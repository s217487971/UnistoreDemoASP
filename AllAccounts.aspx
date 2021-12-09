<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllAccounts.aspx.cs" Inherits="UnistoreWeb.AllAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Student Accounts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    university storage management
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Student Accounts</h2></section>

    <table><tr><td>
        <asp:TextBox ID="TrackingNum" runat="server" Width="170px" TextMode="Number"></asp:TextBox>

        </td><td>
            <asp:Button ID="Button1" runat="server" Text="Search" Width="160px" OnClick="Button1_Click" />
        &nbsp;<asp:Label ID="feedback" runat="server"></asp:Label>
        </td></tr>
    </table>
    <br />
    <br />

        <asp:Button ID="Button4" runat="server" Text="Show all" Height="25px" OnClick="Button4_Click" Width="160px" />
    <asp:Button CssClass="back" ID="Button2" runat="server" Text="Back" Width="160" Height="25px" OnClick="Button2_Click" />
    <br />
    <br />
    <asp:GridView ID="Accounts" runat="server" AutoGenerateColumns="False" DataKeyNames="StudNum" DataSourceID="SqlDataSource1" Width="838px">
        <Columns>
            <asp:BoundField DataField="StudNum" HeaderText="Stundent number" ReadOnly="True" SortExpression="StudNum" />
            <asp:BoundField DataField="StudFname" HeaderText="Name" SortExpression="StudFname" />
            <asp:BoundField DataField="StudLname" HeaderText="Surname" SortExpression="StudLname" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="CellPhone" HeaderText="CellPhone" SortExpression="CellPhone" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [StudNum], [StudFname], [StudLname], [Email], [CellPhone] FROM [Student]"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
