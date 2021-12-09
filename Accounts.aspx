<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="UnistoreWeb.Accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Accounts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

 
           <div id="left-menu">
                  <ul>
                <li><a href="Accounts.aspx">Accounts</a></li>
                <li><a href="AllBookings.aspx">Bookings</a></li>
                      <li><a href="Storage.aspx">Storage</a></li>
                <li><a href="CheckIn.aspx">Check In</a></li>
                <li><a href="CheckOut.aspx">Check Out</a></li>
            </ul>
           </div>

   <section id="account-header"><h2>Students Accounts</h2></section>

   

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">

</asp:Content>
