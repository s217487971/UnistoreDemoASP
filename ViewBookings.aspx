<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBookings.aspx.cs" Inherits="UnistoreWeb.ViewBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Student Bookings</h2></section>
    <section class="container">
        <article id="left">
            <p id="bookingslist">List of Bookings</p>
            <asp:Button CssClass=back ID="Button2" runat="server" Text="Create New Booking" OnClick="Create_NewBooing"/>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TrackingNum" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged" >
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TrackingNum" HeaderText="TrackingNum" InsertVisible="False" ReadOnly="True" SortExpression="TrackingNum" />
                    <asp:BoundField DataField="UnitNum" HeaderText="UnitNum" SortExpression="UnitNum" />
                    <asp:BoundField DataField="DateBooked" HeaderText="DateBooked" SortExpression="DateBooked" />
                    <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TrackingNum], [UnitNum], [DateBooked], [Paid] FROM [Booking] WHERE (([Cancelled] = ?) AND ([StudNum] = ?))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="false" Name="Cancelled" Type="Boolean" />
                    <asp:SessionParameter Name="StudNum" SessionField="snum" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
             <table class="spaced">
                <tr>
                    <th colspan="2">
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="View Booking" OnClick="viewBooking"/>
                    </td>
                </tr>

            </table>
        </article>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
