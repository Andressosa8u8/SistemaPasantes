<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="proyecto.aspx.cs" Inherits="Ecu911Pasantes.views.admin.proyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Proyecto | Admin - Sistema Pasantes
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
                                <h4>Crear un proyecto</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="proyectos.aspx">Listado de proyectos</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Crear un proyecto</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Nombre del proyecto</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtConcepto" type="text" CssClass="form-control" placeholder="Nombre del proyecto" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="txtConcepto" ValidationGroup="info" ErrorMessage="El nombre del proyecto es requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Descripción</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtDescripcion" type="text" CssClass="form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="txtDescripcion" ValidationGroup="info" ErrorMessage="La descripción es requerida"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Responsable</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlResponsables" CssClass="form-control select2" data-toggle="select2" runat="server">
                                <asp:ListItem Value="0">Seleccione responsable</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ControlToValidate="ddlResponsables" ValidationGroup="info" ErrorMessage="El responsable es requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="align-items-end">
                        <asp:Button ID="btnRegresar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-primary btn-lg" runat="server" Text="Regresar" />
                        <asp:Button ID="btnEnviar" OnClick="lnbGuardar_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="info" runat="server" Text="Enviar" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnEnviar"/>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script>
        $(document).ready(function () {
            $('#<%=ddlResponsables.ClientID%>').select2();
        });
    </script>
</asp:Content>
