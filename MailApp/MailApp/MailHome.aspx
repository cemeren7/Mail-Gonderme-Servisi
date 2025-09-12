<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailHome.aspx.cs" Inherits="MailApp.MailHome" Async="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mail Gönderme Sayfası</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        .plach::placeholder{
            color:seagreen;
        }      
        @media (max-width:1260px){
            .column-flex{
                flex-direction:column;
            }
        }
    </style>
</head>
<body> 
    <form id="form1" runat="server">
        <div class="text-center">
        <h6 class="text-primary mt-2" id="DatetimeValue"></h6>
        </div>
        <div class="container w-50 mt-4 bg-light p-4 rounded-4 border border-2 mb-3">
      <h5 class="text-success d-inline-block pb-2">
        Mail Gönderme Servisi
      </h5>
      <div class="row mt-3 row-cols-1">
        <!--row-container-->

          <div class="col mb-3">
          <!--col-1-->
          <label
            class="form-label font-monospace text-success"
            >Gmail Hesabı</label
          >            
             
            <asp:TextBox ID="accountmail" runat="server" CssClass="form-control plach"  Font-Size="Small" TextMode="Email" placeholder="örnek@gmail.com"></asp:TextBox>
        </div>

           <div class="col mb-3">
          <!--col-2-->
          <label
            class="form-label font-monospace text-success"
            >Gmail hesab şifresi</label
          >
            <asp:TextBox ID="apppassword" runat="server" title="Gmail hesabınızın 16 haneli (uygulama) şifresini içermelidir. Uygulama şifresi olmadan mail gönderme işlemi yapılamaz." CssClass="form-control plach" TextMode="Password" TabIndex="1"  Font-Size="Small" placeholder="abcdefghijklmnoq"></asp:TextBox>
        </div>

        <div class="col  mb-3">
          <!--col-3-->
          <label
            class="form-label font-monospace text-success"
            >Kimden</label
          >
            
            <asp:TextBox ID="from" runat="server" CssClass="form-control plach" TabIndex="2"  Font-Size="Small" TextMode="Email" placeholder="örnek@gmail.com"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-4-->
          <label
            class="form-label mt-2 font-monospace text-success"
            >Kime</label
          >
            
           <asp:TextBox ID="to" runat="server" CssClass="form-control plach" TabIndex="3" Font-Size="Small" TextMode="Email" placeholder="örnek2@gmail.com"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-5-->
          <label
            class="form-label font-monospace text-success"
            >Başlık/Konu</label
          >
           <asp:TextBox ID="subject" runat="server" CssClass="form-control" TabIndex="4"  Font-Size="Small"></asp:TextBox>
        </div>
      </div>
      <!--row-container-end-->

      <div class="mb-3">
        <label
          class="form-label font-monospace text-success"
          >Dosya Yükle</label
        >
          <asp:FileUpload ID="filemail" runat="server" CssClass="form-control" TabIndex="5" style="font-family:monospace" ToolTip=".RAR .ZİP .EXE Uzantılı dosyalar desteklenmemektedir." AllowMultiple="True"/>
      </div>

      <div class="mb-2">
        <!--textarea-->
        <label
          class="form-label font-monospace text-success" 
          >Mesaj içerigi</label
        >
          <asp:TextBox ID="mailmessage" runat="server" TextMode="MultiLine" CssClass="form-control fs-6" Height="50" TabIndex="6"  Font-Size="X-Small"></asp:TextBox>
      </div>
      <!--textarea-end-->

      <div class="d-flex justify-content-start mt-2 column-flex">  
           <asp:Button ID="Send" runat="server" Text="Gönder" CssClass="btn btn-outline-success font-monospace" OnClick="Send_Click" TabIndex="7"/>
      </div>
            </div>
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
    </form>
    </body>
</html>
