<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddUnit.aspx.cs" Inherits="UnistoreWeb.AddUnit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Add Unit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

     <section id="account-header"><h2>Add unit</h2></section>

    <asp:Button CssClass="back" ID="Button2" runat="server" Text="Back" Height="25px" OnClick="Button2_Click" Width="160px" />


    <table class="addunit">
        <tr><td>Campus:</td><td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cumpusName" DataValueField="cumpusId" Height="30px" Width="160px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [cumpusId], [cumpusName] FROM [Campus]"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Building:</td><td>
            <asp:DropDownList ID="build" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BuildName" DataValueField="BuildingNum" Height="30px" Width="160px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [BuildName], [BuildingNum], [CampusID] FROM [Building] WHERE ([CampusID] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CampusID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td></tr>
        <tr><td>Size:</td><td>
            <asp:DropDownList ID="size" runat="server" DataSourceID="SqlDataSource3" DataTextField="UnitSize" DataValueField="UnitSize" Height="30px" Width="160px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [UnitSize] FROM [UnitSize]"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Available:</td><td>
            <asp:CheckBox ID="available" runat="server" />
            </td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" Width="160px" Height="25px" />
            </td><td>&nbsp;</td></tr>

        <tr><td colspan="2">
    <asp:Label ID="fb" runat="server" Text=""></asp:Label>

            </td><td></td></tr>
    </table>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
