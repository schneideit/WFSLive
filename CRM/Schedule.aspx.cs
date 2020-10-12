using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CRM.Common;
using System.Data.SqlClient;
using System.Configuration;


namespace CRM
{
    public partial class Schedule : System.Web.UI.Page
    {
        private DbRoutines objCon = new DbRoutines();
        private AppErrorLog objLog = new AppErrorLog();
        //private LMS_Encript.AES_Encrypt_Decrypt LMSENDE = new LMS_Encript.AES_Encrypt_Decrypt();

        private LinqDBDataContext objLinq = new LinqDBDataContext();
        private string UserName;
        string Ansoptions;
        DateTime chkfromdate;
        DateTime chktodate;
        LinqDBDataContext dbconn = new LinqDBDataContext();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCourse();
            GetLocation();
            GetTrainer();
            Getfeetype();
            BindGrid();

        }
        void GetCourse()
        {
            var cou = (from objcourse in dbconn.MstCourses

                       orderby objcourse.CourseId

                       select new
                       {

                           Name = objcourse.CourseName,
                           objcourse.CourseId


                       }
                                  );
            ddlcourse.DataSource = cou;
            ddlcourse.DataTextField = "Name";
            ddlcourse.DataValueField = "CourseId";
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetLocation()
        {
            var Loc = (from objloc in dbconn.MstLocations
                       orderby objloc.LocId

                       select new
                       {

                           Name = objloc.LocName,
                           objloc.LocId


                       }
                                  );
            ddlloc.DataSource = Loc;
            ddlloc.DataTextField = "Name";
            ddlloc.DataValueField = "LocId";
            ddlloc.DataBind();
            ddlloc.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetTrainer()
        {
            var train = (from objtrain in dbconn.MstTrainers
                         orderby objtrain.TrainerId

                         select new
                         {

                             Name = objtrain.FirstName,
                             objtrain.TrainerId


                         }
                                  );
            ddltrain.DataSource = train;
            ddltrain.DataTextField = "Name";
            ddltrain.DataValueField = "TrainerId";
            ddltrain.DataBind();
            //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        }
        void Getfeetype()
        {
            var fee = (from objfee in dbconn.MstFeeTypes
                       orderby objfee.FeeTypeId

                       select new
                       {

                           Name = objfee.FeeType,
                           objfee.FeeTypeId


                       }
                                  );
            ddlfee.DataSource = fee;
            ddlfee.DataTextField = "Name";
            ddlfee.DataValueField = "FeeTypeId";
            ddlfee.DataBind();
            ddlfee.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetFees()
        {
            var fees = (from Objf in dbconn.MstFeeTypes
                        join objfd in dbconn.Tbl_FeeDetails on Objf.FeeTypeId equals objfd.FeeTypeId
                        where objfd.FeeTypeId == Convert.ToUInt32(ddlfee.SelectedValue)
                        orderby Objf.FeeTypeId ascending
                        select new
                        {
                            FeetypeId = Objf.FeeTypeId,
                            Feetype = Objf.FeeType,
                            Feeamount = objfd.FeeAmount,


                        }).ToList();

            grdfee.DataSource = fees;
            grdfee.DataBind();
        }

        private void BindGrid()
        {


            //GrdSchedule.DataSource = dbconn.PR_Schedules();
            //GrdSchedule.DataBind();

        }


        protected void Btbsave_Click(object sender, EventArgs e)
        {
            try
            {
                this.SaveRecord();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", "<script>showpop5('Record Saved Successfully')</script>", false);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Could not save !!! : " + ex.Message.ToString() + "');", true);
                //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }




        private void SaveRecord()
        {
            Tbl_TrnSchedule objtrainer = new Tbl_TrnSchedule();

            Tbl_FeeDetail objfee = new Tbl_FeeDetail();

            MstCourseFee objcfee = new MstCourseFee();


            #region save training schedule
            objtrainer.ScheduleName = txtschname.Text;
            objtrainer.LocationId = Convert.ToInt32(ddlloc.SelectedValue);
            objtrainer.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
            objtrainer.TrainerId = Convert.ToInt32(ddltrain.SelectedValue);
            //ASPxfromDate.Date = Convert.ToDateTime(ASPxfromDate.Text);
            //ASPxtoDate.Date = Convert.ToDateTime(ASPxtoDate.Text);
            objtrainer.FromDate = Convert.ToDateTime(ASPxfromDate.Text); //.ToString("yyyy/MM/dd"));
            //Convert.ToDateTime(ASPxfromDate.Text);
            objtrainer.ToDate = Convert.ToDateTime(ASPxtoDate.Text); //.ToString("yyyy/MM/dd"));
            //Convert.ToDateTime(ASPxtoDate.Text);
            objtrainer.FromTime = aspFromtime.Text.Trim();
            objtrainer.ToTime = aspTotime.Text.Trim();



            objtrainer.IsActive = chkactive.Checked;
            for (int i = 0; i < Chkclass.Items.Count; i++)
            {
                if (Chkclass.Items[i].Selected)
                {
                    Ansoptions += "" + Chkclass.Items[i].Value + ",";

                }
            }
            objtrainer.ClassDays = Ansoptions;
            objLinq.Tbl_TrnSchedules.InsertOnSubmit(objtrainer);
            objLinq.SubmitChanges();

            #endregion


            #region save course fee table

            var shdlid = (from objschdlid in dbconn.Tbl_TrnSchedules
                          orderby objschdlid.TSchdlId descending
                          select objschdlid.TSchdlId).Take(1);


            objcfee.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
            objcfee.LocId = Convert.ToInt32(ddlloc.SelectedValue);
            objcfee.TSchdlId = Convert.ToInt32(shdlid.FirstOrDefault());

            objLinq.MstCourseFees.InsertOnSubmit(objcfee);
            objLinq.SubmitChanges();

            #endregion

            #region save fee details

            var feeid = (from objcfeeid in dbconn.MstCourseFees
                         orderby objcfeeid.TSchdlId descending
                         select objcfeeid.CFeeId).Take(1);

            objfee.CFeeId = Convert.ToInt32(feeid.FirstOrDefault()); ;
            objfee.FeeTypeId = Convert.ToInt32(ddlfee.SelectedValue);
            objfee.FeeAmount = Convert.ToInt32(txtfee.Text);

            objLinq.Tbl_FeeDetails.InsertOnSubmit(objfee);
            objLinq.SubmitChanges();

            #endregion


            btnsave.Visible = true;

        }



        protected void btnclear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Schedule.aspx");
        }

        protected void ddlfee_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetFees();
        }

        //    protected void GrdSchedule_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //    {
        //        if (e.CommandArgs.CommandName == "Edit")
        //        {
        //            try
        //            {

        //                HdnEdit.Value = e.CommandArgs.CommandArgument.ToString();
        //                //cblClassdays.Items.Clear();
        //                Chkclass.SelectedIndex = -1;//M007

        //                var Scheduleedit = from objSchedule in dbconn.Tbl_TrnSchedules
        //                                   where objSchedule.TSchdlId == Convert.ToInt32(HdnEdit.Value)
        //                                   select objSchedule;
        //                foreach (Tbl_TrnSchedule schedule in Scheduleedit)
        //                {
        //                    txtschname.Text = schedule.ScheduleName.ToString();
        //                    GetLocation();
        //                    ddlloc.SelectedValue = schedule.LocationId.ToString();
        //                    GetCourse();
        //                    ddlcourse.SelectedValue = schedule.CourseId.ToString();
        //                    GetTrainer();
        //                    ddltrain.SelectedValue = schedule.TrainerId.ToString();


        //                    ASPxfromDate.Date = Convert.ToDateTime(schedule.FromDate);
        //                    //if (Convert.ToDateTime(schedule.ActualStartDate) >= DateTime.Now.Date)//M013

        //                    //HdnGetStartDate.Value = schedule.ActualStartDate.ToString();//M013
        //                    ASPxtoDate.Date = Convert.ToDateTime(schedule.ToDate);
        //                    Ansoptions = schedule.ClassDays;
        //                    if (Ansoptions != null)
        //                    {
        //                        string[] arrayModule = Ansoptions.Split(',');

        //                        foreach (string st in arrayModule)
        //                        {
        //                            if (st != "")
        //                            {
        //                                Chkclass.Items.FindByValue(st).Selected = true;
        //                            }
        //                        }
        //                    }
        //                    aspFromtime.Text = schedule.FromTime.ToString();
        //                    aspTotime.Text = schedule.ToTime.ToString();

        //                    //HdnfEdit.Value = schedule.ProjectId.ToString();

        //                    chkactive.Checked = Convert.ToBoolean(schedule.IsActive);



        //                    btnsave.Text = "Update";
        //                }
        //            }

        //            catch (Exception ex)
        //            {
        //                objLog.ErrorLog("CreateSchedule", "GrdSchedule_RowCommand", ex.Message.ToString(), LMSENDE.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString(), AppErrorLog.ErrorLogMethods.TextFile, "EBS_ERP");
        //            }

        //        }
        //    }
        //}
    }
}