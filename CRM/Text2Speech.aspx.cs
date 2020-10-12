using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SpeechLib;

namespace CRM
{
    public partial class Text2Speech : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSpeak_Click(object sender, EventArgs e)
        {
            //create voice object
            SpVoice Voice = new SpVoice();
            //have it speak the text in out textbox
            Voice.Speak(txtSpeak.Text);
        }
    }
}