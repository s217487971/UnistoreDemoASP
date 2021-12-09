<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewSingleBooking.aspx.cs" Inherits="UnistoreWeb.ViewSingleBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>View Item</h2></section>
    <section class="container">
       
       <article id="left">
 
            <table >
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
                                <asp:Label ID="Label5" runat="server" Text="Unit ID:"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    
                    <tr>
                        <td>
                                <asp:Label ID="Label7" runat="server" Text="Unit Size:"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                   
                    <tr>
                        <td>
                                <asp:Label ID="Label14" runat="server" Text="Dimensions:"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    <tr>
                        <td>
                                <asp:Label ID="Label11" runat="server" Text="Price: R"></asp:Label>
                                </td>
                                <td>
                                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Cancel Booking" Onclick="cancelBooking"/>
                </td>
            </tr>
                </table>
       </article>
        <article id="right" >
            <asp:Button CssClass=back ID="Buttoensas" runat="server" Text="Back To Bookings" OnClick="Buttoensas_Click" />
            <table>
                <tr>
                    <th colspan="2">
                        <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                    </td>

                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" Text="Are you Sure you want to Cancel Booking ?"></asp:Label>
            <asp:Label ID="Label18" runat="server" Text="(Cancelling a booking cannot be undone)"></asp:Label>
            <table><tr><td>
        <asp:Button ID="Button2" runat="server" OnClick="confirmCancellation" Text="Confirm" Height="30px" Width="126px" />
        </td><td>
            <asp:Button ID="Button3" runat="server" Text="Cancel" Height="30px" OnClick="cancel" Width="126px" />
        </tr></table>
        </article>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
