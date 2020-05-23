program Kiron_srvLocal;



{$R *.RES}

uses
  Vcl.SvcMgr,
  Unt_SC in 'Unt_SC.pas' {SC: TService},
  Unt_SM in 'Unt_SM.pas' {SMXE7: TDSServerModule},
  unt_MetodoServico in 'unt_MetodoServico.pas',
  Unt_MetodoADM_Client in 'Unt_MetodoADM_Client.pas',
  Unt_Classe_SM in '..\Utils\Unt_Classe_SM.pas',
  superdate in '..\Utils\superdate.pas',
  superobject in '..\Utils\superobject.pas',
  supertimezone in '..\Utils\supertimezone.pas',
  supertypes in '..\Utils\supertypes.pas',
  superxmlparser in '..\Utils\superxmlparser.pas',
  Unt_background in '..\..\..\delphi\Kiron_XE7\Classes\Unt_background.pas';

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TSC, SC);
  Application.CreateForm(TSMXE7, SMXE7);
  Application.Run;
end.

