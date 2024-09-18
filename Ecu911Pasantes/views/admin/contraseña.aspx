<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="contraseña.aspx.cs" Inherits="Ecu911Pasantes.views.admin.contraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Cambio de contraseña | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Cambio de contraseña</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cambio de contraseña</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <img src="../../resources/vendors/images/forgot-password.png" alt="">
                                </div>
                                <div class="col-md-6">
                                    <div class="login-box bg-white box-shadow border-radius-10">
                                        <div class="login-title">
                                            <h2 class="text-center text-primary">Restablecer la contraseña</h2>
                                        </div>
                                        <h6 class="mb-20">Ingrese su contraseña anterior, su nueva contraseña, confirme y actualize</h6>
                                        <div class="input-group custom">
                                            <asp:TextBox ID="txtActual" CssClass="form-control form-control-lg" type="password" placeholder="Contraseña anterior" runat="server"></asp:TextBox>
                                            <div class="input-group-append custom">
                                                <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="txtActual" ValidationGroup="info" ErrorMessage="La contraseña anterior es requerida"></asp:RequiredFieldValidator>
                                        <div class="input-group custom">
                                            <asp:TextBox ID="txtPass" CssClass="form-control form-control-lg" type="password" placeholder="Nueva contraseña" runat="server"></asp:TextBox>
                                            <div class="input-group-append custom">
                                                <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="txtPass" ValidationGroup="info" ErrorMessage="La nueva contraseña es requerida"></asp:RequiredFieldValidator>
                                        <div class="input-group custom">
                                            <asp:TextBox ID="txtConfirmar" CssClass="form-control form-control-lg" type="password" placeholder="Confirmar nueva contraseña" runat="server"></asp:TextBox>
                                            <div class="input-group-append custom">
                                                <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ControlToValidate="txtConfirmar" ValidationGroup="info" ErrorMessage="Confirmar la contraseña es requerida"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="txtConfirmar" ControlToCompare="txtPass" runat="server" ErrorMessage="Las contraseñas ingresadas no coiciden" ValidationGroup="Info"></asp:CompareValidator>
                                        <div class="row align-items-center">
                                            <div class="col-5">
                                                <div class="input-group mb-0">
                                                    <asp:Button ID="btnGuardar" OnClick="lnbGuardar_Click" CssClass="btn btn-primary btn-lg btn-block" ValidationGroup="info" runat="server" Text="Actualizar" />
                                                    <br />
                                                </div>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
