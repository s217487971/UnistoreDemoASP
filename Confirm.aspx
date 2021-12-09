<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="UnistoreWeb.Confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Thank you!</h2></section>
    <section id="thank"><h4><asp:Label ID="name" runat="server" Text=""></asp:Label> thank you for booking :)</h4></section>
     <h4>Your Booking was Successful!</h4>
     <br />

    

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
