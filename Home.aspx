<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UnistoreWeb.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<div class="slideshow-container">
  <div class="mySlides fade">
    <img src="Images/unistoref.jpg" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="Images/lock.jpg" style="width:100%">
    <div class="text">Your items are safe with us</div>
  </div>

  <div class="mySlides fade">
    <img src="Images/firstB.jpg" style="width:100%">
  </div>
</div>
    <h1 style="text-align:center;margin-top:30px;font-size:60px" >SAFE STORAGE FOR YOU LUGGAGE WHILE YOU ARE ON HOLIDAYS</h1>
<br>
    <style>
        * {
            box-sizing: border-box
        }

        .slideshow-container {
            max-width: 100%;
            max-height:500px;
            position: relative;
            margin: auto;
        }

        .mySlides {
            display: none;
        }

        .text {
            color: #f2f2f2;
            font-size: 30px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }
    </style>

    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 2500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
