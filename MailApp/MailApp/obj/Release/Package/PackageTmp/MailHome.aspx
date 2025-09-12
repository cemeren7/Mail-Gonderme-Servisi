<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailHome.aspx.cs" Inherits="MailApp.MailHome" Async="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mail Gönderme Sayfası</title>
    <link rel="stylesheet" href="./Boostrap/bootstrap.min.css" />
    <link rel="stylesheet" href="./Boostrap/bootstrap.min.css.map" />
</head>
<body> 
    <form id="form1" runat="server">
        <div class="text-center">
        <h6 class="text-primary mt-2" id="DatetimeValue"></h6>
        </div>
        <div class="container w-50 mt-4 bg-light p-4 rounded-4 border border-2 ">
      <h5 class="text-success d-inline-block pb-2">
        Mail Gönderme Servisi (Gmail)
      </h5>
      <div class="row mt-3 row-cols-1">
        <!--row-container-->

          <div class="col mb-3">
          <!--col-1-->
          <label
            class="form-label font-monospace"
            >Gmail account</label
          >            
             
            <asp:TextBox ID="accountmail" runat="server" CssClass="form-control"  Font-Size="Small" TextMode="Email" placeholder="example@gmail.com"></asp:TextBox>
        </div>

           <div class="col mb-3">
          <!--col-2-->
          <label
            class="form-label font-monospace"
            >Gmail account app password</label
          >
            
            <asp:TextBox ID="apppassword" runat="server" CssClass="form-control" TextMode="Password" TabIndex="1"  Font-Size="Small" placeholder="abcdefghijklmnoq"></asp:TextBox>
        </div>

        <div class="col  mb-3">
          <!--col-3-->
          <label
            class="form-label font-monospace"
            >From</label
          >
            
            <asp:TextBox ID="from" runat="server" CssClass="form-control" TabIndex="2"  Font-Size="Small" TextMode="Email" placeholder="example@gmail.com"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-4-->
          <label
            class="form-label mt-2 font-monospace"
            >To</label
          >
            
           <asp:TextBox ID="to" runat="server" CssClass="form-control" TabIndex="3" Font-Size="Small" TextMode="Email" placeholder="example2@gmail.com"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-5-->
          <label
            class="form-label font-monospace"
            >Subject</label
          >
           <asp:TextBox ID="subject" runat="server" CssClass="form-control " TabIndex="4"  Font-Size="Small"></asp:TextBox>
        </div>
      </div>
      <!--row-container-end-->

      <div class="mb-3">
        <label
          class="form-label font-monospace"
          >File Upload</label
        >
          <asp:FileUpload ID="filemail" runat="server" CssClass="form-control" TabIndex="5" style="font-family:monospace" ToolTip=".RAR .ZİP .EXE Uzantılı dosyalar desteklenmemektedir." AllowMultiple="True"/>
      </div>

      <div class="mb-2">
        <!--textarea-->
        <label
          class="form-label font-monospace" 
          >Message</label
        >
          <asp:TextBox ID="mailmessage" runat="server" TextMode="MultiLine" CssClass="form-control fs-6" Height="50" TabIndex="6"  Font-Size="X-Small"></asp:TextBox>
      </div>
      <!--textarea-end-->

      <div class="row">
        <div class="col">
            <asp:Button ID="Send" runat="server" Text="Send" title="Mail Send" CssClass="btn btn-outline-success font-monospace" OnClick="Send_Click" TabIndex="7"/>
        </div>
      </div>
       <div class="row mt-2">
        <div class="col">
          <asp:LinkButton ID="mailhref" runat="server" CssClass="btn btn-outline-success" OnClientClick="window.open('https://mail.google.com', '_blank'); return false;" TabIndex="8">Gmail Account Control</asp:LinkButton>
        </div>
      </div>

            </div>
    </form>
    <script>
        function UpdateTime() {
            var date = new Date();
            const dateval = document.getElementById("DatetimeValue");
            dateval.style.borderBottom = "1px solid blue";
            dateval.style.display = "inline-block"
            dateval.style.paddingBottom = "5px";
            dateval.innerText = date.toLocaleString();
        }
        setInterval(UpdateTime, 1000);
        UpdateTime();
    </script>
</body>
</html>
