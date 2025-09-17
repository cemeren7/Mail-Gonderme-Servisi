<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailHome.aspx.cs" Inherits="MailApp.MailHome" Async="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>✉️</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"/>
    <style>
        .plach::placeholder{
            color:seagreen;
        }      
        @media (max-width:1260px){
            .column-flex{
                flex-direction:column;
            }
        }
        body{
            background-image: linear-gradient( 90.5deg,  rgba(112,181,176,1) 1.9%, rgba(220,244,241,1) 87.7% );
        }
    </style>
</head>
<body> 
    <form id="form1" runat="server">
        <div class="text-center">
        <h6 class="text-success mt-3" id="DatetimeValue"></h6>
        </div>
        <div class="container w-50 mt-2 bg-light p-4 rounded-4 border border-3 border-success-subtle">
       <div class="text-center">
      <h5 class="text-success d-inline-block">
        Mail Gönderme Servisi
      </h5>
      </div>
      <div class="row mt-3 row-cols-1">
        <!--row-container-->

          <div class="col mb-3">
          <!--col-1-->
          <label
            class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
            >Gmail Hesabı</label
          >            
             
            <asp:TextBox ID="accountmail" runat="server" CssClass="form-control plach mt-1"  Font-Size="Small" TextMode="Email" placeholder="örnek@gmail.com" ClientIDMode="Static"></asp:TextBox>
        </div>

           <div class="col mb-3">
          <!--col-2-->
          <label
            class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
            >Gmail Uygulama Hesap şifresi</label
          >
            <asp:TextBox ID="apppassword" runat="server" title="Gmail hesabınızın 16 haneli (uygulama) şifresini içermelidir. Uygulama şifresi olmadan mail gönderme işlemi yapılamaz." CssClass="form-control plach mt-1" TextMode="Password" TabIndex="1"  Font-Size="Small" placeholder="abcdefghijklmnoq"></asp:TextBox>
        </div>

        <div class="col  mb-2">
          <!--col-3-->
          <label
            class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
            >Kimden</label
          >
            
            <asp:TextBox ID="from" runat="server" CssClass="form-control plach" TabIndex="2"  Font-Size="Small" TextMode="Email" placeholder="örnek@gmail.com" ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-4-->
          <label
            class="form-label mt-2 font-monospace text-white ps-2 pe-2 bg-success rounded-3"
            >Kime</label
          >
            
           <asp:TextBox ID="to" runat="server" CssClass="form-control plach mt-1" TabIndex="3" Font-Size="Small" TextMode="Email" placeholder="örnek2@gmail.com/örnek2@outlook.com/örnek2@hotmail.com" ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="col mb-3">
          <!--col-5-->
          <label
            class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
            >Başlık/Konu</label
          >
           <asp:TextBox ID="subject" runat="server" CssClass="form-control plach mt-1" TabIndex="4"  Font-Size="Small" placeholder="ders kayıtları" ClientIDMode="Static"></asp:TextBox>
        </div>
      </div>
      <!--row-container-end-->

      <div class="mb-3">
        <label
          class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
          >Dosya Yükle</label
        >
          <asp:FileUpload ID="filemail" runat="server" CssClass="form-control mt-1" TabIndex="5" Font-Size="Small" ToolTip=".RAR .ZİP .EXE Uzantılı dosyalar desteklenmemektedir. Çoklu dosya yükleme mevcuttur." AllowMultiple="True" ClientIDMode="Static"/>
      </div>

      <div class="mb-2">
        <!--textarea-->
        <label
          class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3" 
          >Mesaj</label
        >
            <label
          class="form-label font-monospace text-white ps-2 pe-2 bg-success rounded-3"
          id="textcontrol"      
          ></label
        >
          <asp:TextBox ID="mailmessage" runat="server" TextMode="MultiLine" CssClass="form-control plach mt-1" Height="50" TabIndex="6" placeholder="Bu bir deneme mail mesajıdır." ClientIDMode="Static"></asp:TextBox>
      </div>
      <!--textarea-end-->

      <div class="d-flex justify-content-start mt-3 column-flex">  
           <asp:Button ID="Send" runat="server" Text="Gönder" CssClass="btn btn-outline-success font-monospace" OnClick="Send_Click" TabIndex="7" ClientIDMode="Static"/>
      </div>
            </div>
         <script>
             const mailm = document.querySelector("#mailmessage");
             const btn = document.querySelector("#Send");
             const sb = document.querySelector("#subject");
             const t = document.querySelector("#to");
             const frm = document.querySelector("#from");
             const accmail = document.querySelector("#accountmail");
             const textval = document.querySelector("#textcontrol");
             const textk = document.querySelector("#mailmessage");
             const file = document.querySelector("#filemail");
             textk.addEventListener("keyup", () => {
                 const val = textk.value.trim().length;
                 textval.innerHTML = `Karakter Sayısı: <b>${val}</b>`
             })
             btn.addEventListener("click", () => {
                 const ddd = "Mail Logları"
                 let mailarray = JSON.parse(localStorage.getItem(ddd) || "[]");
                 const newmailms = { // JS İN OBJECT CREAT
                     hesapAd: accmail.value.trim(),
                     Kimden: frm.value.trim(),
                     Kime: t.value.trim(),
                     Konu: sb.value.trim(),
                     Mesaj: textk.value.trim(),
                     Tarih: new Date().toLocaleString(),
                     GönderilenDosyalar: [],
                 }
                 for (var i = 0; i < file.files.length; i++) {
                     newmailms.GönderilenDosyalar.push(file.files[i].name)
                 }
                 mailarray.push(newmailms);
                 localStorage.setItem(ddd, JSON.stringify(mailarray));
             })
             function UpdateTime() {
                 var date = new Date();
                 const dateval = document.getElementById("DatetimeValue");
                 dateval.style.borderBottom = "1px solid green";
                 dateval.style.display = "inline-block"
                 dateval.style.paddingBottom = "5px";
                 dateval.style.fontWeight = "bold"
                 dateval.innerText = date.toLocaleString();
             }
             setInterval(UpdateTime, 1000);
             UpdateTime();
         </script>
    </form>
    </body>
</html>
