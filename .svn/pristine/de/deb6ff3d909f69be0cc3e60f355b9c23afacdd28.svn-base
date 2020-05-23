{ Histórico das versões
  1.34 - 29/08/18 10:33 - Acrescentado o campo cir_codigo tabela: pi_programcao - Ipanema
  1.35 - 13/03/19 20:33 - Acrescentado o campo dup_idPulsar tabela: duplic - Ipanema
}

unit Unt_SC;

interface

uses System.SysUtils, IPPeerServer, FMX.Types,
  Datasnap.DSCommonServer, Datasnap.DSServer, Datasnap.DSTCPServerTransport,
  System.Classes, Vcl.SvcMgr,
  Vcl.Dialogs,
  Datasnap.DSAuth, Unt_MetodoServico, Data.DB,
  Datasnap.DBClient, IdTCPConnection, Registry, xmlDoc, XmlIntf, INIFiles,
  Midas, MidasLib, Unt_background;
   //Linha IMPORTANTE pra NAO dar msg Access Violation
//  System.JSON, IdCoder, IdCoderMIME;

type
  TSC = class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DSServerClass2: TDSServerClass;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure DSServerClass2GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    _executaWS : String[1];
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
    Procedure VerificarChaveAcesso;
    Procedure GravarXMLNfe(pXML: AnsiString; pChave, pProt: String);
    procedure Gravar_XML_Web;
    procedure LerPastaXML;
    function ExibirArquivos(pPasta, pExtensao, pTipo : String): Boolean;
    Function LerXML(pPath, pArq, pTipo: String): Boolean;
    Function RetornarMesAno(pTipo: Integer): String;
    procedure GravarLogINI(pMsg: String);
    procedure VerificarChaveAcessoJSON;
  end;

var
  SC: TSC;
  MetodoServicoClient: TMetodoServico;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses Winapi.Windows, Unt_SM, Unt_Classe_SM;

procedure TSC.DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
var
//   Conn: TIdTCPConnection;
   pUsu_nome,pComputador,USR_Login : String;
begin
    {Cria o objeto}
//    Conn := TIdTCPConnection(DSConnectEventObject.ChannelInfo.Id);
    {Recupera os parametros}
    SMXE7.pUSU_Nome := DSConnectEventObject.ConnectProperties.Values['pUsu_Nome'];
    SMXE7.pLoginComputer := DSConnectEventObject.ConnectProperties.Values['pLoginComputer'];
//     SMXE7.pLog_ip    := Conn.Socket.Binding.PeerIP;
    SMXE7.pComputer  := DSConnectEventObject.ConnectProperties.Values['pComputer'];
    SMXE7.pLog_IP    := DSConnectEventObject.ConnectProperties.Values['pIP'];
end;

procedure TSC.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := Unt_SM.TSMXE7;
end;


procedure TSC.DSServerClass2GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
      PersistentClass := unt_MetodoServico.TMetodoServico;

end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SC.Controller(CtrlCode);
end;

function TSC.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TSC.ExibirArquivos(pPasta, pExtensao, pTipo: String): Boolean;
Var
   _Proc: TSearchRec;
   _Path: String;
begin
   Result := false;
   _Path := pPasta;

   Try
      if FindFirst(_Path + '\' + pExtensao, faArchive, _proc) = 0 then begin
         repeat
             LerXML(_Path, _Proc.Name, pTipo);
         until
         FindNext(_Proc) <> 0;
      end;
   finally
  //    FindClose(_Proc);
   end;

   Result := true;

end;

procedure TSC.GravarLogINI(pMsg: String);
var
  _log: TIniFile;

begin
  _log := TIniFile.Create(ExtractFilePath( ParamStr(0) )+'\log.ini');
  _log.WriteString('Servico', formatdatetime('dd/mm/yyyy hh:mm:ss.zzz',now()), ' -> ' + pMsg);
  _log.Free;

end;

Procedure TSC.GravarXMLNfe(pXML: AnsiString; pChave, pProt: String);
begin
      SMXE7.cds_xmlNFe.Close;
      SMXE7.cds_xmlNFe.CommandText :=
         ' select * from xmlNFe '+
         ' where xml_chNFe = ' + QuotedStr(pChave);
       SMXE7.cds_xmlNFe.Open;
      if  SMXE7.cds_xmlNFe.RecordCount > 0 then exit;

      SMXE7.cds_xmlNFe.Append;
       SMXE7.cds_xmlNFe.FieldByName('xml_id').AsInteger := 0;
       SMXE7.cds_xmlNFe.FieldByName('emp_codigo').AsInteger :=
         SMXE7.cds_notafi.FieldByName('emp_codigo').asinteger;
       SMXE7.cds_xmlNFe.FieldByName('not_id').AsInteger :=
         SMXE7.cds_notafi.FieldByName('not_id').asinteger;

       SMXE7.cds_xmlNFe.FieldByName('xml_serie').asinteger :=
         SMXE7.cds_notafi.FieldByName('not_serie').asinteger;
       SMXE7.cds_xmlNFe.FieldByName('xml_modelo').asinteger :=
         SMXE7.cds_notafi.FieldByName('not_modelo').asinteger;

       SMXE7.cds_xmlNFe.FieldByName('xml_nNF').asinteger :=
         SMXE7.cds_notafi.FieldByName('not_numero').asinteger;
       SMXE7.cds_xmlNFe.FieldByName('xml_datemi').asdatetime :=
         SMXE7.cds_notafi.FieldByName('not_datemi').asdatetime;

       SMXE7.cds_xmlNFe.FieldByName('xml_xml').asstring := pXML;
       SMXE7.cds_xmlNFe.FieldByName('xml_chNFe').asstring := pChave;
       SMXE7.cds_xmlNFe.FieldByName('xml_nProt').asstring := pProt;
       SMXE7.cds_xmlNFe.FieldByName('xml_ServidorKiron').asstring := 'N';
       try
          SMXE7.cds_xmlNFe.Post;
      except on E : Exception  do
          GRavarLogIni('Erro: ' + e.Message );
       end;
       SMXE7.cds_xmlNFe.ApplyUpdates(0);
end;

procedure TSC.Gravar_XML_Web;
begin
  SMXE7.cds_xmlNFe.Close;
  SMXE7.cds_xmlNFe.CommandText :=
     ' select * from xmlNFe '+
     ' where xml_ServidorKiron = "N" and xml_chNFe <> "" '+
     ' order by xml_id ';
  SMXE7.cds_xmlNFe.Open;
  while not SMXE7.cds_xmlNFe.Eof do begin
        SMXE7.cds_xmlNFe_Web.Close;
        SMXE7.cds_xmlNFe_Web.CommandText :=
            ' select * from xmlNFe '+
            ' where xml_chNFe = ' + QuotedStr( SMXE7.cds_xmlNFe.FieldByName('xml_chNFe').AsString );
        try
           SMXE7.cds_xmlNFe_Web.Open;
         except on E : Exception  do
              GRavarLogIni('Erro: ' + e.Message );
        end;

        if SMXE7.cds_xmlNFe_Web.RecordCount = 0 then begin
           SMXE7.cds_xmlNFe_Web.append;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_id').AsInteger := 0;
           SMXE7.cds_xmlNFe_Web.fieldbyname('ent_id').AsInteger :=
                 SMXE7.cds_xmlNFe.fieldbyname('emp_codigo').asinteger;
           SMXE7.cds_xmlNFe_Web.fieldbyname('not_id').AsInteger :=
                 SMXE7.cds_xmlNFe.fieldbyname('not_id').asinteger;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_modelo').AsInteger :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_modelo').asinteger;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_serie').AsInteger :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_serie').asinteger;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_nNF').AsInteger :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_nNF').asinteger;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_datemi').Asdatetime :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_datemi').asdatetime;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_xml').Asstring   :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_xml').asstring;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_chNFe').Asstring :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_chNFe').asstring;
           SMXE7.cds_xmlNFe_Web.fieldbyname('xml_nProt').Asstring :=
                 SMXE7.cds_xmlNFe.fieldbyname('xml_nProt').asstring;
            try
               SMXE7.cds_xmlNFe_Web.Post;
            except on E : Exception  do
              GRavarLogIni('Erro: ' + e.Message );
           end;
           try
             SMXE7.cds_xmlNFe_Web.ApplyUpdates(0);
            except on E : Exception  do
              GRavarLogIni('Erro: ' + e.Message );
           end;
        end;
        SMXE7.cds_xmlNFe.Edit;
        SMXE7.cds_xmlNFe.FieldByName('xml_ServidorKiron').AsString := 'S';
        SMXE7.cds_xmlNFe.Post;
        SMXE7.cds_xmlNFe.ApplyUpdates(0);
        SMXE7.cds_xmlNFe.Next;
  end;
end;


procedure TSC.LerPastaXML;
var
  _path: String;
begin
     _executaWS := 'S';
    SMXE7.cds_empresa.Close;
    SMXE7.cds_empresa.CommandText :=
       ' select emp_codigo, emp_pathXML ' +
       ' from empresa ' +
       ' where emp_codigo <> 999999 '+
       ' order by emp_codigo ';
    SMXE7.cds_empresa.open;
    while not SMXE7.cds_empresa.Eof do begin
          _path := ExtractFilePath( ParamStr(0) ) + '\XML';
          if SMXE7.cds_empresa.FieldByName('emp_pathXML').AsString <> '' then
             _path := SMXE7.cds_empresa.FieldByName('emp_pathXML').AsString;

          //Mes Atual
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(0),
                          '*-NFe.xml', 'NFe' );
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(0),
                          '*-procEventoNFe.xml', 'EVENTO' );
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(0),
                          '*-CCe.xml', 'EVENTO' );

          //Mes Anterior
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(1),
                          '*-NFe.xml', 'NFe' );
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(1),
                          '*-procEventoNFe.xml', 'EVENTO' );
          ExibirArquivos( _path + '\' + SMXE7.cds_empresa.FieldByName('emp_codigo').AsString + '\'+ RetornarMesAno(1),
                          '*-CCe.xml', 'EVENTO' );


          SMXE7.cds_empresa.Next;
    end;
    SMXE7.db_Web.Open;
    Gravar_XML_Web;
    SMXE7.db_Web.close;
     _executaWS := 'N';

end;

function TSC.LerXML(pPath, pArq, pTipo: String): Boolean;
var
    _serie, _nota: Integer;
    _Chave, _nProt : String;
    _xml: TXMLDocument;
    _xml_xml: WideString;
    _Node : IXMLNode;
begin
    if length( pArq ) < 44 then exit;

    _serie := 0;
    _nota  := 0;
    if pTipo = 'NFe' then begin
       _serie := strtoint( copy( pArq, 23, 3) );
       _nota  := strtoint( copy( pArq, 26, 9) );
       _Chave := copy( pArq, 1,44 );
    end;
    if pTipo = 'EVENTO' then begin
       _serie := strtoint( copy( pArq, 29, 3) );
       _nota  := strtoint( copy( pArq, 32, 9) );
       _Chave := copy( pArq, 1,52 );
    end;
    if (_serie = 0) or (_nota = 0) then exit;
    if not fileexists( pPath + '\' + pArq ) then exit;

    _xml := TXMLDocument.Create( self );
    _xml.Active := true;
    try
       _xml.LoadFromFile(pPath + '\' + pArq );
    except
       exit;
    end;
    _xml_xml := _xml.XML.Text;

    if _xml_xml = '' then exit;

    //Cabeçaho NFe
    if pTipo = 'NFe' then begin
       try
           _Node     := _Xml.DocumentElement.ChildNodes['protNFe'].ChildNodes['infProt'];
        except
          exit;
       end;
    end else if pTipo = 'EVENTO' then begin
       try
           _Node     := _Xml.DocumentElement.ChildNodes['retEvento'].ChildNodes['infEvento'];
        except
          exit;
       end;
    end;

    _nProt := _Node.ChildNodes['nProt'].Text;
    _xml.Free;

    SMXE7.cds_notafi.Close;
    SMXE7.cds_notafi.CommandText :=
      ' select a.emp_codigo, a.not_id, a.not_serie, a.not_datemi, a.not_numero, a.not_modelo ' +
      ' from notafi a ' +
      ' where a.emp_codigo = ' + SMXE7.cds_empresa.FieldByName('emp_codigo').asstring +
      '       and a.not_serie = ' + inttostr( _serie ) +
      '       and a.not_numero = ' + inttostr( _nota ) +
      '       and a.not_proprio = "S" ';
    SMXE7.cds_notafi.Open;
    if SMXE7.cds_notafi.RecordCount = 0 then exit;

     GravarXMLNfe(_xml_xml, _Chave, _nProt);

end;

function TSC.RetornarMesAno(pTipo: Integer): String;
var
    _dataux: TDateTime;
    _NomeMEs: String;
    _Mes, _Ano : Integer;
begin
    _dataux := now();
    _Ano := strtoint( formatdatetime('yyyy', _dataux) );
    _Mes := strtoint( formatdatetime('mm', _dataux) );

    if pTipo = 1 then begin
       _Mes := _Mes - 1;
       if _Mes = 0 then begin
          _Mes := 1;
          _Ano := _Ano - 1;
       end;
    end;

   if _Mes = 1       then _NomeMEs := 'Janeiro'
   else if _Mes = 2  then _NomeMEs := 'Fevereiro'
   else if _Mes = 3  then _NomeMEs := 'Março'
   else if _Mes = 4  then _NomeMEs := 'Abril'
   else if _Mes = 5  then _NomeMEs := 'Maio'
   else if _Mes = 6  then _NomeMEs := 'Junho'
   else if _Mes = 7  then _NomeMEs := 'Julho'
   else if _Mes = 8  then _NomeMEs := 'Agosto'
   else if _Mes = 9  then _NomeMEs := 'Setembro'
   else if _Mes = 10 then _NomeMEs := 'Outubro'
   else if _Mes = 11 then _NomeMEs := 'Novembro'
   else if _Mes = 12 then _NomeMEs := 'Dezembro';
   Result := inttostr( _Ano ) + '\' + _NomeMes;

end;

function TSC.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TSC.DoInterrogate;
begin
  inherited;
end;

function TSC.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TSC.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TSC.ServiceAfterInstall(Sender: TService);
var
  regEdit : TRegistry;
begin
  regEdit := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    regEdit.RootKey := HKEY_LOCAL_MACHINE;

    if regEdit.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name,False) then
    begin
      regEdit.WriteString('Description','Gerenciador de Tarefas do Sistema Kiron, desenvolvido pela Kiron Soluções em Softwares Ltda.');
      regEdit.CloseKey;
    end;

  finally
    FreeAndNil(regEdit);
  end;

end;

procedure TSC.ServiceCreate(Sender: TObject);
begin
      MetodoServicoClient := TMetodoServico.Create;

end;

procedure TSC.ServiceStart(Sender: TService; var Started: Boolean);
begin
//  ShortDateFormat := 'dd/mm/yyyy';

  _executaWS := 'N';
  DSServer1.Start;  //Nao sei pq mas dá erro na Jotta tintas
  try
     SMXE7.ParametrosConfigWeb();
  except
      exit;
  end;
  VerificarChaveAcessoJSON;
  Unt_background.pServico := 'S';
  BackGround_EnviarXMLKiron(
       SMXE7.db_Servico.Params.Values['HostName'],
       SMXE7.db_Servico.Params.Values['Database'],
       SMXE7.db_Servico.Params.Values['User_Name'],
       SMXE7.db_Servico.Params.Values['Password'],
       'mysql',
       SMXE7.db_Servico.Params.Values['Port'].ToInteger());

end;

procedure TSC.Timer1Timer(Sender: TObject);
begin
      if formatdatetime('hh:mm:ss',now()) = '12:00:00'  then
          VerificarChaveAcessoJSON;
      if formatdatetime('hh:mm:ss',now()) = '16:00:00'  then
         BackGround_EnviarXMLKiron(
            SMXE7.db_Servico.Params.Values['HostName'],
            SMXE7.db_Servico.Params.Values['Database'],
            SMXE7.db_Servico.Params.Values['User_Name'],
            SMXE7.db_Servico.Params.Values['Password'],
            'mysql',
            SMXE7.db_Servico.Params.Values['Port'].ToInteger());
// sempre cai o serviço por causa desta rotina
//      if formatdatetime('hh:mm:ss',now()) = '12:30:00'  then
//          VerificarChaveAcesso;
end;

procedure TSC.Timer2Timer(Sender: TObject);
begin
//      if _executaWS = 'N' then LerPastaXML;
//1800000
//      if _executaWS = 'N' then Gravar_XML_Web;
end;

procedure TSC.VerificarChaveAcessoJSON;
var
 oHttpSM : THttpSM;
begin
  SMXE7.db_Servico.Close;
  SMXE7.cds_geral.Close;
  SMXE7.cds_geral.CommandText :=
      ' select emp_codigo, emp_cnpj,  emp_chaveAcesso, emp_dtValidade '+
      ' from empresa '+
      ' where  emp_codigo <> 999999 '+
      ' order by emp_codigo  ';
  try
    SMXE7.cds_geral.Open;
  except on E : Exception  do begin
       GravarLogINI('VerificarChaveAcessoJSON: ' + E.ClassName+' - '+e.Message);
       exit;
     end;
  end;
  while not SMXE7.cds_geral.Eof do begin
        oHttpSM := THttpSM.create();
        oHttpSM.GetEntidade( SMXE7.cds_geral.FieldByName('emp_cnpj').asstring,
                             SMXE7.cds_geral.FieldByName('emp_codigo').asinteger  );
        if oHttpSM.ent_dtValidaChave = '' then begin
           oHttpSM.free;
           SMXE7.cds_geral.next;
           continue;
        end;
        SMXE7.cds_geral.edit;
        SMXE7.cds_geral.fieldbyname('emp_chaveAcesso').AsString  :=
            oHttpSM.ent_ChaveAcesso;
        GravarLogINI(' Chave: ' + oHttpSM.ent_ChaveAcesso + ' - DataChave: ' + oHttpSM.ent_dtValidaChave);
//        GravarLogINI(' emp_dtValidade xxx: ' + SMXE7.cds_geral.fieldbyname('emp_dtValidade').asstring);
        try
           SMXE7.cds_geral.fieldbyname('emp_dtValidade').asstring :=
              oHttpSM.ent_dtValidaChave;
        except on E : Exception  do
           try
              SMXE7.cds_geral.fieldbyname('emp_dtValidade').asstring :=
                  copy( oHttpSM.ent_dtValidaChave, 4,2) + '/' +
                  copy( oHttpSM.ent_dtValidaChave, 1,2) + '/' +
                  copy( oHttpSM.ent_dtValidaChave, 7,4) + ' ' +
                  copy( oHttpSM.ent_dtValidaChave, 12,8);
            except on E : Exception  do
                GravarLogINI('emp_dtValidade: ' +E.ClassName+' - '+e.Message);
           end;
        end;

        try
            SMXE7.cds_geral.post;
            SMXE7.cds_geral.applyupdates(0);
        except on E : Exception  do
            GravarLogINI('cds_geral.post: ' +E.ClassName+' - '+e.Message);
        end;
        oHttpSM.free;
        SMXE7.cds_geral.next;
  end;
  SMXE7.cds_geral.close;
end;


procedure TSC.VerificarChaveAcesso;
begin
// Rotina com Erro
       SMXE7.cds_geral.Close;
       SMXE7.cds_geral.CommandText :=
         ' select * from empresa '+
         ' where  emp_codigo <> 999999 ';
       try
          SMXE7.cds_geral.Open;
       except on E : Exception  do
          GravarLogINI('cds_geral ' + E.ClassName+' - '+e.Message);
       end;
       SMXE7.db_ADM.Open;
       while not SMXE7.cds_geral.Eof do begin
             SMXE7.cds_K_Geral.Close;
             SMXE7.cds_K_Geral.CommandText :=
               ' select ent_codigo, ent_chaveAcesso, ent_dtValidaChave '+
               ' from  kironadm.entidade ' +
               ' where ent_codigo = ' + SMXE7.cds_geral.FieldByName('emp_codigo').AsString;
             try
                SMXE7.cds_K_Geral.Open;
             except on E : Exception  do
                 GravarLogINI('cds_K_geral ' +E.ClassName+' - '+e.Message);
             end;
             SMXE7.cds_geral.edit;
             SMXE7.cds_geral.fieldbyname('emp_chaveAcesso').AsString :=
               SMXE7.cds_K_Geral.FieldByName('ent_chaveAcesso').AsString;
             SMXE7.cds_geral.fieldbyname('emp_dtValidade').asdatetime :=
               SMXE7.cds_K_Geral.FieldByName('ent_dtValidaChave').asdatetime;
             SMXE7.cds_geral.post;
             SMXE7.cds_geral.applyupdates(0);
             {
             MetodoServicoClient.AtualizarChaveAcesso(
                      SMXE7.cds_K_geral.fieldbyname('ent_codigo').asinteger,
                      SMXE7.cds_K_geral.fieldbyname('ent_chaveACesso').asstring,
                      SMXE7.cds_K_geral.fieldbyname('ent_dtValidaChave').asdatetime
                       );
             }
             SMXE7.cds_geral.Next;
       end;
       SMXE7.cds_geral.Close;
       SMXE7.cds_K_Geral.Close;
       SMXE7.db_ADM.close;
end;

end.

