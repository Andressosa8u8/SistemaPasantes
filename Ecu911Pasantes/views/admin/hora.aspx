<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="hora.aspx.cs" Inherits="Ecu911Pasantes.views.admin.hora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Hora | Admin - Sistema Pasantes
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
                                <h4>Registrar horas</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="horas.aspx">Listado de horas</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar horas</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Numero de horas</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtCantidad" type="number" CssClass="form-control"  placeholder="60" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="txtCantidad" ValidationGroup="info" ErrorMessage="La cantidad es requerida"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Concepto</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtConcepto" type="text" CssClass="form-control"  placeholder="Diseño de base de datos" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="txtConcepto" ValidationGroup="info" ErrorMessage="El concepto es requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Labores</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlLabor" CssClass="form-control select2" data-toggle="select2" runat="server">
                                <asp:ListItem Selected="True">Seleccione un labor</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ControlToValidate="ddlLabor" ValidationGroup="info" ErrorMessage="El labor es requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="align-items-end">
                        <asp:Button ID="btnRegresar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-primary btn-lg" runat="server" Text="Regresar" />
                        <asp:Button ID="btnEnviar" OnClick="lnbGuardar_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="info" runat="server" Text="Enviar" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script>
        $(document).ready(function () {
            $('#<%=ddlLabor.ClientID%>').select2();
        });
    </script>
</asp:Content>
