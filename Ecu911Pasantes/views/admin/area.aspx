<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="area.aspx.cs" Inherits="Ecu911Pasantes.views.admin.area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Pasante | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Registrar una Universidad</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="universidades.aspx">Listado de Areas</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar una Area</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="row">
                        <div class="col-9">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Nombre del Area</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtNombre" OnTextChanged="txtNombre_TextChanged" TextMode="SingleLine" CssClass="form-control" autocomplete="off" placeholder="Ingrese el Area" runat="server" style="text-transform:uppercase;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="El Area es requerida" ControlToValidate="txtNombre" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Estado</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:DropDownList ID="ddlEstado" CssClass="form-control" Enabled="false" runat="server" required="true">
                                        <asp:ListItem Value="A">Activo</asp:ListItem>
                                        <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ForeColor="Red" runat="server" ErrorMessage="El estado es requerido" ControlToValidate="ddlEstado" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="align-items-end">
                        <asp:Button ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-outline-primary btn-lg" runat="server" Text="Regresar" />
                        <asp:Button ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="info" runat="server" Text="Enviar" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <%--<Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnCodPa" EventName="Click" />
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>

