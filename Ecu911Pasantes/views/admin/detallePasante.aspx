<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="detallePasante.aspx.cs" Inherits="Ecu911Pasantes.views.admin.detallePasante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Detalle de Pasantes | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-150px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Detalles del responsable</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="responsables.aspx">Listado de responsables</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Detalles del responsable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-15 card-box mb-30">
                    <div class="card-header bg-transparent">
                        <h4>Datos del Responsable</h4>
                    </div>
                    <div class="card-body">
                        <h6>Cédula de Identidad:
                            <asp:Label ID="lblCedula" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Nombres:
                            <asp:Label ID="lblNombres" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Apellidos:
                            <asp:Label ID="lblApellidos" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Dirección:
                            <asp:Label ID="lblDireccion" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Correo Electronico:
                            <asp:Label ID="lblCorreo" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Numero de Celular:
                            <asp:Label ID="lblCelular" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Nombre de Usuario:
                            <asp:Label ID="lblUser" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Area de Prácticas/Vinculación:
                            <asp:Label ID="lblArea" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Universidad/Instituto:
                            <asp:Label ID="lblUniversidad" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Carrera Universitaria:
                            <asp:Label ID="lblCarrera" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Nivel de Semestre:
                            <asp:Label ID="lblSemestre" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Codigo del ECU 911:
                            <asp:Label ID="lblCodigo" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Actividad:
                            <asp:Label ID="lblActividad" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                        <br />
                        <h6>Estado:
                            <asp:Label ID="lblEstado" CssClass="form-label font-15" Font-Bold="false" runat="server" Text=""></asp:Label></h6>
                    </div>
                    <div class="card-footer bg-transparent">
                        <asp:Button ID="btnVolver" OnClick="btnVolver_Click" CssClass="btn btn-info" runat="server" Text="Volver" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
