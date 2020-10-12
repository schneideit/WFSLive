using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CRM
{
    public partial class Payment : System.Web.UI.Page
    {
        LinqDBDataContext objLinq = new LinqDBDataContext();
        LinqDBDataContext dbconn = new LinqDBDataContext();
        DataTable dtitems = new DataTable();
        public string mStudId, mFeeId;  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                mStudId = Session["SesnStudId"].ToString();
               // GetFeeDet();
            }
            if (!Page.IsPostBack)
            {
                GetStudDet();
                GetCourse();
                GetItem();
                GetFeeDet();
                GetItemDet();
            }

        }

        protected void GetStudDet()
        {
            var ObjFees = dbconn.PR_GetFeeById(Convert.ToInt32(mFeeId)).SingleOrDefault();

            var StudEdit = from objstd in dbconn.MstStudents
                           where objstd.StudId == Convert.ToInt32(mStudId)
                           select objstd;
            foreach (MstStudent EE in StudEdit)
            {
                txtStudent.Text = EE.FirstName.ToString() + " " + EE.LastName.ToString();
                txtstudId.Text = EE.StudId.ToString();
            }
        }

        protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Feedet = from objfeedet in dbconn.Tbl_CourseFeeDetails
                         where objfeedet.CourseId == Convert.ToInt32(ddlcourse.SelectedValue)
                          select objfeedet;

            foreach (Tbl_CourseFeeDetail CF in Feedet)
            {
                txtRegFee.Text = CF.RegnFee.ToString();
                txtcoursefee.Text = CF.ChildFee.ToString();
                txtsessn.Text = CF.Sessn.ToString();
                txthrs.Text = CF.Hrs.ToString();
            }

        }

        protected void ddlitem_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Itmdet = from objitmdet in dbconn.Tbl_Merchandises
                         where objitmdet.ItemId == Convert.ToInt32(ddlitem.SelectedValue)
                         select objitmdet;

            foreach (Tbl_Merchandise IF in Itmdet)
            {
                txtuc.Text = IF.UnitCost.ToString();
                
            }

        }
        protected void GetFeeRec()
        { 
             var FeeEdit = from objPymtEdt in dbconn.Vw_StudFeeDets
                            where objPymtEdt.SFeeId == Convert.ToInt32(mFeeId)
                            select objPymtEdt;

                foreach (Vw_StudFeeDet SF in FeeEdit)
                {
                GetCourse();
                ddlcourse.SelectedValue = SF.CourseId.ToString();
                txtRegFee.Text = SF.RegAmt.ToString();
                txtsessn.Text = SF.Sessn.ToString();
                txthrs.Text = SF.Hrs.ToString();
              
                }
        }

        private void GetFeeDet()
        {
           var objstdfee =  (from ObjFees in dbconn.Vw_StudFeeDets
             where ObjFees.StudId == Convert.ToInt32(mStudId)
             select new
            {
                ObjFees.StudName,
                ObjFees.StudId,
                ObjFees.CourseName,
                ObjFees.Hrs,
                ObjFees.PDate,
                ObjFees.RegAmt,
                ObjFees.Sessn,
                ObjFees.SFeeId,
                ObjFees.CAmt,
                ObjFees.AAmt
        }).ToList();
           
            rptfees.DataSource = objstdfee;
            rptfees.DataBind();
        }

     
        void GetCourse()
        {
            var cou = (from objcou in dbconn.MstCourses
                           //join objcou in dbconn.MstCourses on objcourse.CourseId equals objcou.CourseId
                       orderby objcou.CourseId

                       select new
                       {

                           Name = objcou.CourseName,
                           objcou.CourseId


                       }
                                  ).ToList();
            ddlcourse.DataSource = cou.Distinct();
            ddlcourse.DataTextField = "Name";
            ddlcourse.DataValueField = "CourseId";
            ddlcourse.DataBind();

        }

        

        protected void BtnPaySave_Click(object sender, EventArgs e)
        {
            try
                {
                    Tbl_StudFee objsfee = new Tbl_StudFee();
                    objsfee.StudId = Convert.ToInt32(txtstudId.Text);
                    objsfee.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
                    objsfee.RegAmt = Convert.ToInt32(txtRegFee.Text);
                    objsfee.CAmt = Convert.ToInt32(txtcoursefee.Text);
                    objsfee.Sessn = Convert.ToInt32(txtsessn.Text);
                    objsfee.Hrs = Convert.ToInt32(txthrs.Text);
                    dbconn.Tbl_StudFees.InsertOnSubmit(objsfee);
                    dbconn.SubmitChanges();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }

            GetFeeDet();
        }
        void GetItem()
        {
            var it = (from objitem in dbconn.Tbl_Merchandises
                          //join objcou in dbconn.MstCourses on objcourse.CourseId equals objcou.CourseId
                      orderby objitem.ItemId

                      select new
                      {

                          Name = objitem.ItemName,
                          objitem.ItemId


                      }
                                  ).ToList();
            ddlitem.DataSource = it.Distinct();
            ddlitem.DataTextField = "Name";
            ddlitem.DataValueField = "ItemId";
            ddlitem.DataBind();

        }
        private void GetItemDet()
        {
            rptitem.DataSource = dbconn.PR_GetItems();
            rptitem.DataBind();
        }

        protected void btnFeeEdt_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            mFeeId = lnkedit.CommandArgument.ToString();
            GetFeeRec();
        }
        protected void BtnItemSave_Click(object sender, EventArgs e)
        {
            try
            {
                Tbl_MerchandiseOrder objmer = new Tbl_MerchandiseOrder();
                objmer.ItemId = Convert.ToInt32(ddlitem.SelectedValue);
                objmer.ItemQty = Convert.ToInt32(txtqty.Text);
                //objmer.StudId = Convert.ToInt32(txtstudId.Text);
                objmer.TotalAmt = Convert.ToInt32(txttotal.Text);
                dbconn.Tbl_MerchandiseOrders.InsertOnSubmit(objmer);
                dbconn.SubmitChanges();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
            }
            GetItemDet();

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudents.aspx");
        }
    }
}