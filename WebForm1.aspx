<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UnistoreWeb.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    fcgg
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="Dimension" HeaderText="Dimension" SortExpression="Dimension" />
            <asp:BoundField DataField="TrackingNum" HeaderText="TrackingNum" SortExpression="TrackingNum" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:TemplateField HeaderText="Checkedin" SortExpression="Checkedin">
               <EditItemTemplate>
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Checkedin") %>' />
        </EditItemTemplate>
        <ItemTemplate>
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Checkedin") %>' />
        </ItemTemplate>

            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = ?" InsertCommand="INSERT INTO [Item] ([ItemID], [Dimension], [TrackingNum], [Description], [Checkedin]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ItemID], [Dimension], [TrackingNum], [Description], [Checkedin] FROM [Item]" UpdateCommand="UPDATE [Item] SET [Dimension] = ?, [TrackingNum] = ?, [Description] = ?, [Checkedin] = ? WHERE [ItemID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Dimension" Type="String" />
            <asp:Parameter Name="TrackingNum" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Checkedin" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Dimension" Type="String" />
            <asp:Parameter Name="TrackingNum" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Checkedin" Type="Boolean" />
            <asp:Parameter Name="ItemID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
