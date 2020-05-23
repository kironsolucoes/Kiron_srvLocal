//
// Created by the DataSnap proxy generator.
// 21/04/2016 11:55:58
//

unit Unt_MetodoADM_Client;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMXE7Client = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    Fdsp_duplicAfterApplyUpdatesCommand: TDBXCommand;
    FDB_SequenciaCommand: TDBXCommand;
    FStartTransactionCommand: TDBXCommand;
    FCommitCommand: TDBXCommand;
    FRollBackCommand: TDBXCommand;
    FDatSisCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FLog_iniCommand: TDBXCommand;
    FParametrosConfigWebCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure dsp_duplicAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    function DB_Sequencia(pTabela: string): Integer;
    procedure StartTransaction;
    procedure Commit;
    procedure RollBack;
    function DatSis: TDateTime;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure Log_ini(pConteudo: string);
    function ParametrosConfigWeb: Boolean;
  end;

  TMetodoServicoClient = class(TDSAdminClient)
  private
    FValidarUsuarioADMCommand: TDBXCommand;
    FAtualizarStatusNovaChaveCommand: TDBXCommand;
    FVerificarAcessoCommand: TDBXCommand;
    FAtualizarPendenciaFinanceiraCommand: TDBXCommand;
    FAtualizarItemPedidoCommand: TDBXCommand;
    FAtualizarStatusPedidoCommand: TDBXCommand;
    FAtualizarSaldoExtratoCommand: TDBXCommand;
    FAtualizarChaveAcessoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ValidarUsuarioADM(pLogin: string; pSenha: string): Boolean;
    procedure AtualizarStatusNovaChave(pCodigo: Integer; pStatus: string);
    function VerificarAcesso(pEmpresa: Integer; pCodigo: Integer; pForm: string; pOpcao: string; out pMensaAcesso: OleVariant): Boolean;
    procedure AtualizarPendenciaFinanceira;
    procedure AtualizarItemPedido(pPed_id: Integer; pItp_Item: Integer);
    procedure AtualizarStatusPedido(pPed_id: Integer);
    procedure AtualizarSaldoExtrato(pEmpresa: Integer; pBan_Codigo: Integer; pPridat: TDateTime; pUltdat: TDateTime);
    procedure AtualizarChaveAcesso(pEmpresa: Integer; pChave: string; pDtValidade: TDateTime);
  end;

implementation

procedure TSMXE7Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TSMXE7.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TSMXE7Client.dsp_duplicAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if Fdsp_duplicAfterApplyUpdatesCommand = nil then
  begin
    Fdsp_duplicAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    Fdsp_duplicAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fdsp_duplicAfterApplyUpdatesCommand.Text := 'TSMXE7.dsp_duplicAfterApplyUpdates';
    Fdsp_duplicAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    Fdsp_duplicAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(Fdsp_duplicAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      Fdsp_duplicAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  Fdsp_duplicAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  Fdsp_duplicAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := Fdsp_duplicAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

function TSMXE7Client.DB_Sequencia(pTabela: string): Integer;
begin
  if FDB_SequenciaCommand = nil then
  begin
    FDB_SequenciaCommand := FDBXConnection.CreateCommand;
    FDB_SequenciaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDB_SequenciaCommand.Text := 'TSMXE7.DB_Sequencia';
    FDB_SequenciaCommand.Prepare;
  end;
  FDB_SequenciaCommand.Parameters[0].Value.SetWideString(pTabela);
  FDB_SequenciaCommand.ExecuteUpdate;
  Result := FDB_SequenciaCommand.Parameters[1].Value.GetInt32;
end;

procedure TSMXE7Client.StartTransaction;
begin
  if FStartTransactionCommand = nil then
  begin
    FStartTransactionCommand := FDBXConnection.CreateCommand;
    FStartTransactionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStartTransactionCommand.Text := 'TSMXE7.StartTransaction';
    FStartTransactionCommand.Prepare;
  end;
  FStartTransactionCommand.ExecuteUpdate;
end;

procedure TSMXE7Client.Commit;
begin
  if FCommitCommand = nil then
  begin
    FCommitCommand := FDBXConnection.CreateCommand;
    FCommitCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCommitCommand.Text := 'TSMXE7.Commit';
    FCommitCommand.Prepare;
  end;
  FCommitCommand.ExecuteUpdate;
end;

procedure TSMXE7Client.RollBack;
begin
  if FRollBackCommand = nil then
  begin
    FRollBackCommand := FDBXConnection.CreateCommand;
    FRollBackCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRollBackCommand.Text := 'TSMXE7.RollBack';
    FRollBackCommand.Prepare;
  end;
  FRollBackCommand.ExecuteUpdate;
end;

function TSMXE7Client.DatSis: TDateTime;
begin
  if FDatSisCommand = nil then
  begin
    FDatSisCommand := FDBXConnection.CreateCommand;
    FDatSisCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDatSisCommand.Text := 'TSMXE7.DatSis';
    FDatSisCommand.Prepare;
  end;
  FDatSisCommand.ExecuteUpdate;
  Result := FDatSisCommand.Parameters[0].Value.AsDateTime;
end;

function TSMXE7Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TSMXE7.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMXE7Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TSMXE7.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TSMXE7Client.Log_ini(pConteudo: string);
begin
  if FLog_iniCommand = nil then
  begin
    FLog_iniCommand := FDBXConnection.CreateCommand;
    FLog_iniCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLog_iniCommand.Text := 'TSMXE7.Log_ini';
    FLog_iniCommand.Prepare;
  end;
  FLog_iniCommand.Parameters[0].Value.SetWideString(pConteudo);
  FLog_iniCommand.ExecuteUpdate;
end;

function TSMXE7Client.ParametrosConfigWeb: Boolean;
begin
  if FParametrosConfigWebCommand = nil then
  begin
    FParametrosConfigWebCommand := FDBXConnection.CreateCommand;
    FParametrosConfigWebCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosConfigWebCommand.Text := 'TSMXE7.ParametrosConfigWeb';
    FParametrosConfigWebCommand.Prepare;
  end;
  FParametrosConfigWebCommand.ExecuteUpdate;
  Result := FParametrosConfigWebCommand.Parameters[0].Value.GetBoolean;
end;


constructor TSMXE7Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TSMXE7Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TSMXE7Client.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  Fdsp_duplicAfterApplyUpdatesCommand.DisposeOf;
  FDB_SequenciaCommand.DisposeOf;
  FStartTransactionCommand.DisposeOf;
  FCommitCommand.DisposeOf;
  FRollBackCommand.DisposeOf;
  FDatSisCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FLog_iniCommand.DisposeOf;
  FParametrosConfigWebCommand.DisposeOf;
  inherited;
end;

function TMetodoServicoClient.ValidarUsuarioADM(pLogin: string; pSenha: string): Boolean;
begin
  if FValidarUsuarioADMCommand = nil then
  begin
    FValidarUsuarioADMCommand := FDBXConnection.CreateCommand;
    FValidarUsuarioADMCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FValidarUsuarioADMCommand.Text := 'TMetodoServico.ValidarUsuarioADM';
    FValidarUsuarioADMCommand.Prepare;
  end;
  FValidarUsuarioADMCommand.Parameters[0].Value.SetWideString(pLogin);
  FValidarUsuarioADMCommand.Parameters[1].Value.SetWideString(pSenha);
  FValidarUsuarioADMCommand.ExecuteUpdate;
  Result := FValidarUsuarioADMCommand.Parameters[2].Value.GetBoolean;
end;

procedure TMetodoServicoClient.AtualizarStatusNovaChave(pCodigo: Integer; pStatus: string);
begin
  if FAtualizarStatusNovaChaveCommand = nil then
  begin
    FAtualizarStatusNovaChaveCommand := FDBXConnection.CreateCommand;
    FAtualizarStatusNovaChaveCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarStatusNovaChaveCommand.Text := 'TMetodoServico.AtualizarStatusNovaChave';
    FAtualizarStatusNovaChaveCommand.Prepare;
  end;
  FAtualizarStatusNovaChaveCommand.Parameters[0].Value.SetInt32(pCodigo);
  FAtualizarStatusNovaChaveCommand.Parameters[1].Value.SetWideString(pStatus);
  FAtualizarStatusNovaChaveCommand.ExecuteUpdate;
end;

function TMetodoServicoClient.VerificarAcesso(pEmpresa: Integer; pCodigo: Integer; pForm: string; pOpcao: string; out pMensaAcesso: OleVariant): Boolean;
begin
  if FVerificarAcessoCommand = nil then
  begin
    FVerificarAcessoCommand := FDBXConnection.CreateCommand;
    FVerificarAcessoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVerificarAcessoCommand.Text := 'TMetodoServico.VerificarAcesso';
    FVerificarAcessoCommand.Prepare;
  end;
  FVerificarAcessoCommand.Parameters[0].Value.SetInt32(pEmpresa);
  FVerificarAcessoCommand.Parameters[1].Value.SetInt32(pCodigo);
  FVerificarAcessoCommand.Parameters[2].Value.SetWideString(pForm);
  FVerificarAcessoCommand.Parameters[3].Value.SetWideString(pOpcao);
  FVerificarAcessoCommand.ExecuteUpdate;
  pMensaAcesso := FVerificarAcessoCommand.Parameters[4].Value.AsVariant;
  Result := FVerificarAcessoCommand.Parameters[5].Value.GetBoolean;
end;

procedure TMetodoServicoClient.AtualizarPendenciaFinanceira;
begin
  if FAtualizarPendenciaFinanceiraCommand = nil then
  begin
    FAtualizarPendenciaFinanceiraCommand := FDBXConnection.CreateCommand;
    FAtualizarPendenciaFinanceiraCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarPendenciaFinanceiraCommand.Text := 'TMetodoServico.AtualizarPendenciaFinanceira';
    FAtualizarPendenciaFinanceiraCommand.Prepare;
  end;
  FAtualizarPendenciaFinanceiraCommand.ExecuteUpdate;
end;

procedure TMetodoServicoClient.AtualizarItemPedido(pPed_id: Integer; pItp_Item: Integer);
begin
  if FAtualizarItemPedidoCommand = nil then
  begin
    FAtualizarItemPedidoCommand := FDBXConnection.CreateCommand;
    FAtualizarItemPedidoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarItemPedidoCommand.Text := 'TMetodoServico.AtualizarItemPedido';
    FAtualizarItemPedidoCommand.Prepare;
  end;
  FAtualizarItemPedidoCommand.Parameters[0].Value.SetInt32(pPed_id);
  FAtualizarItemPedidoCommand.Parameters[1].Value.SetInt32(pItp_Item);
  FAtualizarItemPedidoCommand.ExecuteUpdate;
end;

procedure TMetodoServicoClient.AtualizarStatusPedido(pPed_id: Integer);
begin
  if FAtualizarStatusPedidoCommand = nil then
  begin
    FAtualizarStatusPedidoCommand := FDBXConnection.CreateCommand;
    FAtualizarStatusPedidoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarStatusPedidoCommand.Text := 'TMetodoServico.AtualizarStatusPedido';
    FAtualizarStatusPedidoCommand.Prepare;
  end;
  FAtualizarStatusPedidoCommand.Parameters[0].Value.SetInt32(pPed_id);
  FAtualizarStatusPedidoCommand.ExecuteUpdate;
end;

procedure TMetodoServicoClient.AtualizarSaldoExtrato(pEmpresa: Integer; pBan_Codigo: Integer; pPridat: TDateTime; pUltdat: TDateTime);
begin
  if FAtualizarSaldoExtratoCommand = nil then
  begin
    FAtualizarSaldoExtratoCommand := FDBXConnection.CreateCommand;
    FAtualizarSaldoExtratoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarSaldoExtratoCommand.Text := 'TMetodoServico.AtualizarSaldoExtrato';
    FAtualizarSaldoExtratoCommand.Prepare;
  end;
  FAtualizarSaldoExtratoCommand.Parameters[0].Value.SetInt32(pEmpresa);
  FAtualizarSaldoExtratoCommand.Parameters[1].Value.SetInt32(pBan_Codigo);
  FAtualizarSaldoExtratoCommand.Parameters[2].Value.AsDateTime := pPridat;
  FAtualizarSaldoExtratoCommand.Parameters[3].Value.AsDateTime := pUltdat;
  FAtualizarSaldoExtratoCommand.ExecuteUpdate;
end;

procedure TMetodoServicoClient.AtualizarChaveAcesso(pEmpresa: Integer; pChave: string; pDtValidade: TDateTime);
begin
  if FAtualizarChaveAcessoCommand = nil then
  begin
    FAtualizarChaveAcessoCommand := FDBXConnection.CreateCommand;
    FAtualizarChaveAcessoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizarChaveAcessoCommand.Text := 'TMetodoServico.AtualizarChaveAcesso';
    FAtualizarChaveAcessoCommand.Prepare;
  end;
  FAtualizarChaveAcessoCommand.Parameters[0].Value.SetInt32(pEmpresa);
  FAtualizarChaveAcessoCommand.Parameters[1].Value.SetWideString(pChave);
  FAtualizarChaveAcessoCommand.Parameters[2].Value.AsDateTime := pDtValidade;
  FAtualizarChaveAcessoCommand.ExecuteUpdate;
end;


constructor TMetodoServicoClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TMetodoServicoClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TMetodoServicoClient.Destroy;
begin
  FValidarUsuarioADMCommand.DisposeOf;
  FAtualizarStatusNovaChaveCommand.DisposeOf;
  FVerificarAcessoCommand.DisposeOf;
  FAtualizarPendenciaFinanceiraCommand.DisposeOf;
  FAtualizarItemPedidoCommand.DisposeOf;
  FAtualizarStatusPedidoCommand.DisposeOf;
  FAtualizarSaldoExtratoCommand.DisposeOf;
  FAtualizarChaveAcessoCommand.DisposeOf;
  inherited;
end;

end.

