<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookingInformation.aspx.cs" Inherits="UnistoreWeb.BookingInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
      <section id="account-header"><h2>Booking Confirmation</h2></section>
    <p class="successfont">
              Your Booking was Successful, please take note of the tracking number
          </p>
    <section class="container">
        <article id="left">
            <table class="tablebooking">
                            <tr>
                 <th colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Booking Information"></asp:Label>
                </th>
            </tr>
           
                    <tr>
                        <td>
                                <asp:Label ID="Label3" runat="server" Text="Tracking Number :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    <tr>
                        <td>
                                <asp:Label ID="Label13" runat="server" Text="Booking Date :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label1n" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                     <tr>
                        <td>
                                <asp:Label ID="Label16" runat="server" Text="Campus :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label17" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    <tr>
                        <td>
                                <asp:Label ID="Label9" runat="server" Text="Building :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                        <tr>
                        <td>
                                <asp:Label ID="Label5" runat="server" Text="Unit ID :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    
                    <tr>
                        <td>
                                <asp:Label ID="Label7" runat="server" Text="Unit Size :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                   
                    <tr>
                        <td>
                                <asp:Label ID="Label14" runat="server" Text="Dimensions :"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    <tr>
                        <td>
                                <asp:Label ID="Label11" runat="server" Text="Price : R"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                </table>
            </article>
      <article id="right">
          <br />
              <p>
              Thank you Very Much <asp:Label ID="nameLabel" runat="server" Text="Label"></asp:Label> for using the Unistore for storing your items. The storage costs are to be settled when you check in your item(s).
          </p>
          <br />
          <p>
              Check-In and Check-Out hours are between 09:00AM and 16:00PM, Your Items will be stored for the duration of 1-December of the current year till 30-February of the Successive Year
          </p>
      </article>
      </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    
</asp:Content>
