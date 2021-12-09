<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Storage.aspx.cs" Inherits="UnistoreWeb.Storage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Storage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    
<section id="account-header"><h2>Manage Storage</h2></section>

   
     <asp:Button CssClass="add" ID="add" runat="server" Text="Add unit" OnClick="add_Click" Width="155px" Height="25px" />
    <asp:Button CssClass="back" ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" Width="122px" Height="25px" />
     <br />
    <br />
    <section class="container">
       
        <article id="left">
            
        <table><tr><td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="cumpusName" DataValueField="cumpusId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="150px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [cumpusId], [cumpusName] FROM [Campus]"></asp:SqlDataSource>
            </td><td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="BuildName" DataValueField="BuildingNum" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="150px" OnDataBound="building_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [CampusID], [BuildingNum], [BuildName] FROM [Building] WHERE ([CampusID] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CampusID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td></tr></table>

            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="UnitId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" OnRowCancelingEdit="GridView3_RowCancelingEdit" Width="468px">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="UnitId" HeaderText="Unit number" InsertVisible="False" ReadOnly="True" SortExpression="UnitId" />
                    <asp:BoundField DataField="UnitSize" HeaderText="Unit size" ReadOnly="true" SortExpression="UnitSize" />
                    <asp:TemplateField HeaderText="Available"  ItemStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [UnitId], [UnitSize], [Available], [BuilNum] FROM [StorageUnit] WHERE ([BuilNum] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="BuilNum" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
  

          

        </article>

        <article id="right">
            



            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="UnitSize" DataSourceID="SqlDataSource2" Width="588px">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="UnitSize" HeaderText="Unit size" ReadOnly="True" SortExpression="UnitSize" />
                    <asp:BoundField DataField="Dimension" HeaderText="Dimension (cm)" SortExpression="Dimension" />
                    <asp:BoundField DataField="Fee" HeaderText="Fee (rand)" SortExpression="Fee" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UnitSize] WHERE [UnitSize] = ?" InsertCommand="INSERT INTO [UnitSize] ([UnitSize], [Dimension], [Fee]) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [UnitSize]" UpdateCommand="UPDATE [UnitSize] SET [Dimension] = ?, [Fee] = ? WHERE [UnitSize] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="UnitSize" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UnitSize" Type="String" />
                    <asp:Parameter Name="Dimension" Type="String" />
                    <asp:Parameter Name="Fee" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Dimension" Type="String" />
                    <asp:Parameter Name="Fee" Type="Decimal" />
                    <asp:Parameter Name="UnitSize" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />



        </article>

    </section>
   </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
