﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/responsable/responsable.Master" AutoEventWireup="true" CodeBehind="responsable.aspx.cs" Inherits="Ecu911Pasantes.views.responsable.responsable1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Responsable | Admin - Sistema Pasantes
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
                                <h4>Registrar un responsable</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="responsables.aspx">Listado de responsables</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar un responsable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Cédula</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtCedula" TextMode="SingleLine" MaxLength="10" CssClass="form-control" autocomplete="off" placeholder="Ingrese su cédula" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="La cédula es requerida" ControlToValidate="txtCedula" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegexValidatorCedula" runat="server" ControlToValidate="txtCedula"
                                        ValidationGroup="Info" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Solo se permiten hasta 10 dígitos"
                                        ValidationExpression="^\d{1,10}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Nombre de usuario</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtUser" type="text" CssClass="form-control"  placeholder="Ingrese el nombre de usuario" autocomplete="off" OnTextChanged="txtUser_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="txtUser" ValidationGroup="info" ErrorMessage="El nombre de usuario es requerido" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Contraseña</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" placeholder="Ingrese la contraseña" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Confirmar contraseña</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtConfirmar" TextMode="Password" CssClass="form-control" placeholder="Confirme la contraseña" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="La confirmación de la contraseña es requerida" ControlToValidate="txtConfirmar" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="txtConfirmar" ControlToCompare="txtPass" runat="server" ErrorMessage="Las contraseñas ingresadas no coiciden" ValidationGroup="Info" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Primer Nombre</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtPrimerNombre" type="text" CssClass="form-control" placeholder="Ingrese su primer nombre" runat="server" autocomplete="off" style="text-transform:uppercase;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="El primer nombre es requerido" ControlToValidate="txtPrimerNombre" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Segundo Nombre</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtSegundoNombre" type="text" CssClass="form-control" placeholder="Ingrese su segundo nombre" runat="server" autocomplete="off" style="text-transform:uppercase;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" runat="server" ErrorMessage="El segundo nombre es requerido" ControlToValidate="txtSegundoNombre" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Primer Apellido</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtPrimerApellido" type="text" CssClass="form-control" placeholder="Ingrese su primer apellido" runat="server" autocomplete="off" style="text-transform:uppercase;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="El primer apellido es requerido" ControlToValidate="txtPrimerApellido" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Segundo Apellido</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtSegundoApellido" type="text" CssClass="form-control" placeholder="Ingrese su segundo apellido" runat="server" autocomplete="off" style="text-transform:uppercase;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ForeColor="Red" runat="server" ErrorMessage="El segundo apellido es requerido" ControlToValidate="txtSegundoApellido" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Dirección</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtDireccion" type="text" CssClass="form-control" placeholder="Ingrese la dirección" runat="server" autocomplete="off" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="La dirección es requerida" ControlToValidate="txtDireccion" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Correo electronico</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Ingrese el correo electronico" runat="server" autocomplete="off" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="txtEmail" ValidationGroup="info" ErrorMessage="El correo electronico es requerido" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Celular</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:TextBox ID="txtCelular" TextMode="Phone" AutoCompleteType="Cellular" MaxLength="10" CssClass="form-control" placeholder="Ingrese el numero de celular" autocomplete="off" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="El celular es requerido" ControlToValidate="txtCelular" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtCedula"
                                        ValidationGroup="Info" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Solo se permiten hasta 10 dígitos"
                                        ValidationExpression="^\d{1,10}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Centro:</label>
                                <div class="col-sm-12 col-md-8">
                                    <%--<asp:TextBox ID="txtArea" type="text" CssClass="form-control" placeholder="Ingrese el area de trabajo" autocomplete="off" runat="server" style="text-transform:uppercase;"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlCentro" CssClass="form-control select2" data-toggle="select2" runat="server" required="true">
                                        <asp:ListItem Value="0">Seleccione un centro</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" runat="server" ErrorMessage="La area de trabajo es requerida" ControlToValidate="ddlCentro" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Area</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:DropDownList ID="ddlArea" CssClass="form-control select2" data-toggle="select2" runat="server" required="true">
                                        <asp:ListItem Value="0">Seleccione un centro</asp:ListItem>
                                    </asp:DropDownList>                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ForeColor="Red" runat="server" ErrorMessage="La area de trabajo es requerida" ControlToValidate="ddlArea" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Cargo</label>
                                <div class="col-sm-12 col-md-8">
                                    <%--<asp:TextBox ID="txtCargo" type="text" CssClass="form-control" placeholder="Ingrese el area de trabajo" autocomplete="off" runat="server" style="text-transform:uppercase;"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlCargo" CssClass="form-control select2" data-toggle="select2" runat="server" required="true">
                                        <asp:ListItem Value="0">Seleccione un cargo</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" runat="server" ErrorMessage="El cargo es requerido" ControlToValidate="ddlCargo" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-3 col-form-label">Estado</label>
                                <div class="col-sm-12 col-md-9">
                                    <asp:DropDownList ID="ddlEstado" CssClass="form-control" Enabled="false" runat="server">
                                        <asp:ListItem Value="A">Activo</asp:ListItem>
                                        <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ForeColor="Red" runat="server" ErrorMessage="El estado es requerido" ControlToValidate="ddlEstado" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="align-items-end">
                        <asp:Button ID="btnRegresar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-primary btn-lg" runat="server" Text="Regresar" />
                        <asp:Button ID="btnGuardar" OnClick="lnbGuardar_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="info" runat="server" Text="Enviar" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
