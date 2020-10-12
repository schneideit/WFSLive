<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text2Speech.aspx.cs" Inherits="CRM.Text2Speech" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
        <asp:TextBox ID="txtSpeak" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="btnSpeak" runat="server" Text="Speak" 
            onclick="btnSpeak_Click" />
    </div>
    </div>
    </form>
</body>
</html>
