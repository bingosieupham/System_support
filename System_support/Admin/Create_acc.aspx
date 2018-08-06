<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Site3.Master" AutoEventWireup="true" CodeBehind="Create_acc.aspx.cs" Inherits="System_support.Admin.Create_acc" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Office2010Blue" EnableTheming="True" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Cập nhật th&#244;ng tin t&#224;i khoản" ColCount="2" ShowCaption="False">
                <Items>
                    <dx:LayoutItem Caption="Full name">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox runat="server" Width="270px" ID="ASPxTextBox1"></dx:ASPxTextBox>                     
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Phone">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="270px">
                                    <MaskSettings Mask="0000000000" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="User Name">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                <dx:ASPxTextBox runat="server" Width="270px" ID="ASPxTextBox3"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Password">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Password="True" Width="270px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Unit name">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" TextField="Ten_dv" ValueField="ID_dv" Width="50%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT [ID_dv], [Ten_dv] FROM [DM_donvi]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Role">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" Width="50%">
                                    <Items>
                                        <dx:ListEditItem Text="Customer" Value="1" />
                                        <dx:ListEditItem Text="Support" Value="2" />
                                        <dx:ListEditItem Text="Consultant" Value="3" />
                                        <dx:ListEditItem Text="Technical" Value="3" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Cập nhật" Width="150px">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Ten_dv" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Tên đơn vị">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ID_nv" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="3" Caption="User">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Pass" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Full_name" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Tên nhân viên">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Phone" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Role" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Quyền">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_donvi.Ten_dv, User_login.ID_nv, User_login.User_name, User_login.Pass, User_login.Full_name, User_login.Phone, User_login.Role, User_login.Status, User_login.Create_date FROM User_login INNER JOIN DM_donvi ON User_login.ID_dv = DM_donvi.ID_dv WHERE (User_login.Role &lt;&gt; 1) AND (User_login.Status = 1)"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
</asp:Content>
