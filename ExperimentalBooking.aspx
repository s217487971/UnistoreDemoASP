<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExperimentalBooking.aspx.cs" Inherits="UnistoreWeb.ExperimentalBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
     <section id="account-header"><h2>Booking</h2></section>
    <p id="intro">
                Dear Valued Customer, please Note that all bookings are only for the duration of 1-December of the current year till 30-February of the successive year.
    </p>
    <asp:Button CssClass=back ID="Button6" runat="server" Text="View Existing Bookings" OnClick="Button6_Click"/>
    <section class="container">
        <article id="right">
                        <table class="tablebooking">
                    <tr>
                        <th colspan="4">
                            <asp:Label ID="Label1" runat="server" Text="Campus Details"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Campus"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cumpusName" DataValueField="cumpusId" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Building"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BuildName" DataValueField="BuildingNum"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="4">
                            <asp:Label ID="Label4" runat="server" Text="Item Details"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="L" runat="server" Text="Length "></asp:Label>
                        </td>
                        
                        <td>
                            <asp:Label ID="B" runat="server" Text="Breadth"></asp:Label>
                        </td>
                        
                        <td>
                            <asp:Label ID="H" runat="server" Text="Height"></asp:Label>
                        </td>
                       
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="length" runat="server" MaxLength="2" TextMode="Number" Width="50px"></asp:TextBox>
                        
                        </td>
                        <td>
                            <asp:TextBox ID="breath" runat="server" TextMode="Number" MaxLength="2" Width="50px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="height" runat="server" TextMode="Number" MaxLength="2" EnableViewState="True" Width="50px"></asp:TextBox>
                        </td>
                    </tr>
                            <tr>
                                <td>
                                     <asp:Label ID="Labe" runat="server" Text="Description"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ds" runat="server" Width="119px"></asp:TextBox>
                                </td>
                            </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="Check Unit" OnClick="CheckUnit" />
                            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Add" Width="90px" />
                        </td>
                        <td colspan="2">
                            <asp:Button ID="Button4" runat="server" Text="Clear" OnClick="clear" />
                        </td>
                    </tr>
                </table>
                <table class="tablebooking"><tr><td>
                    
                        <table>
                    <tr>
                        <th colspan="4" style="height: 20px">
                            <asp:Label ID="Label9" runat="server" Text="Booked Unit"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="bookedunitids" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="BookedUnits" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Unitid1" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="unitdels1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="unitid2" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="unitdels2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="unitid3" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="unitdels3" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    
                            
                    </table></td>
                        <td>
                            <table>
                    <tr>
                        <th colspan="2">
                            <asp:Label ID="Label5" runat="server" Text="Total Cost"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2">
                        R<asp:Label ID="totalCosts" runat="server" Text="0" ></asp:Label>.00
                        </th>
                    </tr>
                    <tr>
                        <td>
                        <asp:Button ID="Button3" runat="server" Text="Confirm Booking" OnClick="confirmBooking"/>
                    </td>
                        
                            <td>
                        <asp:Button ID="Button5" runat="server" Text="Cancel Booking" OnClick="cancelbooks"/>
                            </td>
                        
                    </tr>
   
                </table>
                        </td>
                    </tr>
                    </table>
               
        </article>

        <article id="left">
            <table class="tablebooking">
                    <tr>
                        <th colspan="2">
                            Unit Information
                        </th>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                            Unit ID:
                        </td>
                        <td style="height: 20px">
                            <asp:Label ID="UnitIDLabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Unit size:
                        </td>
                        <td>
                            <asp:Label ID="UnitSizeLabel" runat="server" Text="">

                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Unit Dimesions:
                        </td>
                        <td>
                            <asp:Label ID="UnitDimensionLabel" runat="server" Text="">

                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Unit price:
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLable" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Book Unit" OnClick="selectUnit" />
            </td>
                        <td>
                            <asp:Label ID="Advice" runat="server">

                            </asp:Label>
                        </td>
        </tr>
                </table >

            <asp:GridView ID="itemsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    <asp:BoundField DataField="TrackingNum" HeaderText="TrackingNum" SortExpression="TrackingNum" />
                    <asp:BoundField DataField="Dimension" HeaderText="Dimension" SortExpression="Dimension" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>
                    
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = ?" InsertCommand="INSERT INTO [Item] ([ItemID], [TrackingNum], [Dimension], [Description]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ItemID], [TrackingNum], [Dimension], [Description] FROM [Item] WHERE ([TrackingNum] = ?)" UpdateCommand="UPDATE [Item] SET [TrackingNum] = ?, [Dimension] = ?, [Description] = ? WHERE [ItemID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="TrackingNum" Type="Int32" />
                    <asp:Parameter Name="Dimension" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="-1" Name="TrackingNum" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TrackingNum" Type="Int32" />
                    <asp:Parameter Name="Dimension" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                    
        </article>
   
        </section>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Building] WHERE ([CampusID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CampusID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Campus]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
