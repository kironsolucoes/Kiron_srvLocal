unit unt_MetodoServico;

interface
uses SysUtils,Classes, DB, SqlExpr, Variants;

type
     {$METHODINFO ON}
    TMetodoServico = class(TPersistent)
      public
        { Public declarations }
        Function  ValidarUsuarioADM(pLogin,pSenha: String): Boolean;
        Procedure AtualizarStatusNovaChave(pCodigo: Integer; pStatus: String);
        Function  VerificarAcesso(pEmpresa,pCodigo: Integer; pForm,pOpcao: String;
                  out pMensaAcesso: OleVariant): Boolean;
        Procedure AtualizarPendenciaFinanceira;
        Procedure AtualizarItemPedido(pPed_id, pItp_Item: Integer);
        Procedure AtualizarStatusPedido(pPed_id: Integer);
        Procedure AtualizarSaldoExtrato(pEmpresa, pBan_Codigo: Integer; pPridat, pUltdat: TDateTime);
        Procedure AtualizarChaveAcesso(pEmpresa: Integer; pChave: String; pDtValidade: TDatetime);
    end;
    {$METHODINFO OFF}
    Function ConectarClienteKiron(pCodigo: Integer): Boolean;

implementation
uses Unt_SM;
{ TMetodoADM }

Function ConectarClienteKiron(pCodigo: Integer): Boolean;
begin

end;


function TMetodoServico.ValidarUsuarioADM(pLogin, pSenha: String): Boolean;
var
  _q : TSqlQuery;
begin
  Result := false;
  _q := TSQLQuery.Create( nil );
  _q.SQLConnection := SMXE7.db_Servico;
  _q.SQL.Text := ' Select emp_codigo,usu_datexp from usuario ' +
                 ' where usu_login = ' + QuotedStr(uppercase(pLogin)) +
                 '       and usu_senha = ' + QuotedStr(uppercase(pSenha));
  _q.Open;
  if _q.RecordCount > 0 then begin
     Result := true;
     if _q.FieldByName('usu_datexp').AsDateTime < now() then begin
        Result := false;
     end;
  end;
  _q.Free;

end;

function TMetodoServico.VerificarAcesso(pEmpresa, pCodigo: Integer; pForm,
  pOpcao: String; out pMensaAcesso: OleVariant ): Boolean;
var
  _q: TSqlQuery;
begin

     Result := false;
     pMensaAcesso := '';
     _q:=TSqlquery.create( nil );
     _q.SQLConnection := SMXE7.db_Servico;
     _q.sql.Text := ' select usu_adm from usuario '+
                     ' where usu_codigo = '+inttostr(pCodigo);
     _q.open();
     if _q.FieldByName('usu_adm').AsString = 'S' then begin
        Result := true;
        FreeAndNil(_q);
        exit;
     end;
     _q.close;
     _q.sql.Text := ' select a.hab_executar,a.hab_incluir,a.hab_editar, '+
                     '       a.hab_excluir,a.hab_visualizar,a.hab_imprimir '+
                     ' from habusu a '+
                     ' inner join form b on a.frm_id = b.frm_id '+
                     ' where a.emp_codigo = '+inttostr(pEmpresa)+' and '+
                     '       a.usu_codigo = '+inttostr(pCodigo)+' and '+
                     '       upper(b.frm_form) = '+QuotedStr(uppercase(pForm));
     _q.open();
//     if _q.RecordCount > 0 then begin //Nao funciona no TSQLQuery (unibiridecional)
     if not _q.IsEmpty() then begin
        if (_q.FieldByName('hab_executar').AsString = 'S') and (pOpcao = 'EXE') then
            Result := true
        else if (_q.FieldByName('hab_incluir').AsString = 'S') and (pOpcao = 'INC') then
                 Result := true
        else if (_q.FieldByName('hab_editar').AsString = 'S') and (pOpcao = 'EDI') then
                 Result := true
        else if (_q.FieldByName('hab_excluir').AsString = 'S') and (pOpcao = 'EXC') then
                 Result := true
        else if (_q.FieldByName('hab_visualizar').AsString = 'S') and (pOpcao = 'VIS') then
                 Result := true
        else if (_q.FieldByName('hab_imprimir').AsString = 'S') and (pOpcao = 'IMP') then
                 Result := true;
     end;

     if not Result  then begin
        pMensaAcesso := ' Você não está autorizado(a) para executar esta operação! ';
     end;
     FreeAndNil(_q);

end;

procedure TMetodoServico.AtualizarChaveAcesso(pEmpresa: Integer; pChave: String; pDtValidade: TDatetime);
var
  _q: TSqlQuery;

begin
    _q := TSqlQuery.create( nil ) ;
    _q.SQLConnection := SMXE7.db_Servico;
    _q.SQL.Text := ' update empresa '+
                   ' set emp_chaveAcesso = ' + QuotedStr(pChave) + ', '+
                   '     emp_dtValidade = ' + QuotedStr( formatdatetime('yyyy-mm-dd hh:mm:ss',pDtValidade))+
                   ' where emp_codigo = ' + inttostr( pEmpresa );
   try
     SMXE7.StartTransaction();
     _q.ExecSQL;
     SMXE7.Commit();
   except

     SMXE7.Rollback();
   end;
    _q.Free;

end;

procedure TMetodoServico.AtualizarItemPedido(pPed_id, pItp_Item: Integer);
var
  _itp_qtda, _ite_qtda, _ite_qtda_can, _ise_qtda, _qtda_Vale: Double;
  _q: TSqlQuery;
  _itp_Id: Integer;
begin

     if (pPed_id = 0) or (pItp_Item = 0) THEN exit;

     //Pedido
     _q := TSqlquery.create( nil );
     _q.SQLConnection := SMXE7.db_Servico;
     _q.sql.Text :=
        ' select sum(itp_qtda) as _qtda '+
        ' from itemped a '+
        ' where a.ped_id = ' + inttostr( pPed_id ) +
        '       and a.itp_item = ' + inttostr( pItp_item );
     _q.open();
     _itp_qtda := _q.FieldByName('_qtda').asfloat;

     //NF-e
     _q.close;
     _q.sql.Text :=
        ' select sum(ite_qtda) as _qtda '+
        ' from item_not b '+
        ' left join notafi c on b.not_id = c.not_id ' +
        ' where b.ped_id = ' + inttostr( pPed_id ) +
        '       and b.itp_item = ' + inttostr( pItp_item );
     _q.open();
     _ite_qtda := _q.FieldByName('_qtda').asfloat;

     //Servico
     _q.close;
     _q.sql.Text :=
        ' select sum(ise_qtda) as _qtda '+
        ' from item_ser b '+
        ' left join servico c on b.ser_id = c.ser_id ' +
        ' where b.ped_id = ' + inttostr( pPed_id ) +
        '       and b.itp_item = ' + inttostr( pItp_item );
     _q.open();
     _ise_qtda := _q.FieldByName('_qtda').asfloat;

     //Cancelada
     _q.close;
     _q.sql.Text :=
        ' select sum(ite_qtda) as _qtda '+
        ' from item_not b '+
        ' left join notafi c on b.not_id = c.not_id ' +
        ' where b.ped_id = ' + inttostr( pPed_id ) +
        '       and b.itp_item = ' + inttostr( pItp_item ) +
        '       and c.stn_codigo = 4 ';
     _q.open();
     _ite_qtda_can := _q.FieldByName('_qtda').asfloat;


     // Vale
     _q.close;
     _q.sql.Text :=
        ' select sum(itp_qtda) as _qtda '+
        ' from itemped a '+
        ' where a.ped_id = ' + inttostr( pPed_id ) +
        '       and a.itp_item = ' + inttostr( pItp_item )+
        '       and a.itp_Vale = "S" ';
     _q.open();
     _qtda_Vale := _q.FieldByName('_qtda').asfloat;

     //Localizar ID
     _q.close;
     _q.sql.Text :=
        ' select itp_id  '+
        ' from itemped a '+
        ' where a.ped_id = ' + inttostr( pPed_id ) +
        '       and a.itp_item = ' + inttostr( pItp_item );
     _q.open();
     _itp_Id := _q.FieldByName('itp_id').asinteger;


     _ite_qtda := ((_ite_qtda + _ise_qtda) - _ite_qtda_can);

    SMXE7.cds_itemped.Close;
    SMXE7.cds_itemped.Params[0].AsInteger := _itp_id;
    SMXE7.cds_itemped.Execute;
    SMXE7.cds_itemped.Open;
    SMXE7.cds_itemped.Edit;

     IF (_itp_qtda <= _ite_Qtda) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 1;
        SMXE7.cds_itemped.fieldbyname('itp_reserva').AsString := 'N';
        SMXE7.cds_itemped.fieldbyname('itp_faturar').AsString := 'N';
     END;

     //Aberto
     IF (_ite_Qtda = 0) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 0;
     END;

     //* Vale Parcial
     IF (_itp_qtda > _Qtda_Vale) and (_Qtda_Vale > 0) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 4;
     END;

     //* Vale Gerado
     IF (_itp_qtda = _Qtda_Vale) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 5;
     END;

     //* Fat Parcial
     IF (_itp_qtda > _ite_Qtda) and (_ite_Qtda > 0) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 2;
     END;

     // Finalizado
     IF (_itp_qtda = _ite_Qtda) and (_ite_Qtda > 0) THEN begin
        SMXE7.cds_itemped.fieldbyname('stp_codigo').AsInteger := 1;
     END;
     SMXE7.cds_itemped.post;
     SMXE7.cds_itemped.ApplyUpdates(0);
end;

procedure TMetodoServico.AtualizarPendenciaFinanceira;
var
    _q: TSqlQuery;
begin
    _q := TSqlQuery.create( nil ) ;
    _q.SQLConnection := SMXE7.db_Servico;
    _q.SQL.Text := ' update entidade '+
                   ' set ent_blockFin = "N" '+
                   ' where ent_cliente = "S" ';
   try
     SMXE7.StartTransaction();
     _q.ExecSQL;
     SMXE7.Commit();
   except
     SMXE7.Rollback();
   end;

    _q.SQL.Text :=
        ' update duplic ' +
        ' set dup_saldo = (dup_valor - dup_valpag - dup_valdes - dup_valdev) ' ;
   try
     SMXE7.StartTransaction();
     _q.ExecSQL;
     SMXE7.Commit();
   except
     SMXE7.Rollback();
   end;

    _q.SQLConnection := SMXE7.db_Servico;
    _q.SQL.Text :=
           '  update entidade a, duplic b, empresa c ' +
           '  set a.ent_blockFin = "S" ' +
           '  where a.ent_id = b.ent_id ' +
           '        and b.emp_codigo = c.emp_codigo ' +
           '        and b.dup_tipo = "R" ' +
           '        and b.dup_saldo > 0 ' +
           '        and (DATEDIFF(curdate(), b.dup_vencto) > c.emp_diasBlockFin) ' ;
   try
     SMXE7.StartTransaction();
     _q.ExecSQL;
     SMXE7.Commit();
   except
     SMXE7.Rollback();
   end;
   _q.Free;

end;


procedure TMetodoServico.AtualizarSaldoExtrato(pEmpresa,
  pBan_Codigo: Integer; pPridat, pUltdat: TDateTime);
var
    _q: TSqlQuery;
begin
{    Showmessage( 'Empresa:  '+ inttostr( pEmpresa ) + #13 +
                 'Banco:  '+ inttostr( pBan_codigo ) + #13 +
                 'Pridat:  '+ datetostr( pPridat ) + #13 +
                 'Ultdat:  '+ datetostr( pUltdat ));
}
    _q := TSqlQuery.create( nil ) ;
    _q.SQLConnection := SMXE7.db_Servico;
{    _q.SQL.Text := ' call SP_AtuSaldoCtaCorrente(:empresa,:banco,:pridat,:ultdat) ';
    _q.Params[0].AsInteger := pEmpresa;
    _q.Params[1].AsInteger := pBan_Codigo;
    _q.Params[2].Asdatetime := pPridat;
    _q.Params[3].Asdatetime := pUltdat;
}
    _q.SQL.Text := ' call SP_AtuSaldoCtaCorrente( ' +
                     inttostr( pEmpresa ) + ', ' +
                     inttostr( pBan_codigo ) + ', ' +
                     QuotedStr(formatdatetime('yyyy-mm-dd hh:mm:ss', pPridat)) + ', '+
                     QuotedStr(formatdatetime('yyyy-mm-dd hh:mm:ss', pUltdat)) + ') ';

   try
     SMXE7.StartTransaction();
     _q.ExecSQL;
     SMXE7.Commit();
   except
     SMXE7.Rollback();
   end;

end;

procedure TMetodoServico.AtualizarStatusNovaChave(pCodigo: Integer; pStatus: String);
var
    _q: TSqlQuery;
begin
    _q := TSqlQuery.create( nil ) ;
    _q.SQLConnection := SMXE7.db_Servico;
    _q.SQL.Text := ' update entidade '+
                   ' set ent_novaChave = ' + QuotedStr(uppercase(pStatus))+
                   ' where ent_codigo = ' + inttostr( pCodigo );
  try
    SMXE7.StartTransaction();
    _q.ExecSQL;
    SMXE7.Commit();
  except
    SMXE7.Rollback();
  end;
  _q.Free;
end;


procedure TMetodoServico.AtualizarStatusPedido(pPed_id: Integer);
var
  _qtda : Double;
  _q: TSqlQuery;
  _stp_codigo: Integer;
begin


     //Pedido
     _q := TSqlquery.create( nil );
     _q.SQLConnection := SMXE7.db_Servico;
     _q.sql.Text :=
        ' select stp_codigo,sum(itp_qtda) as _qtda '+
        ' from itemped a '+
        ' where a.ped_id = ' + inttostr( pPed_id ) +
        ' order by stp_codigo desc ';

     _q.open();
     if _q.RecordCount = 1 then begin
        _stp_codigo := _q.FieldByName('stp_codigo').AsInteger;
     end else begin
        _q.First;
        while not _q.Eof do begin
              if _q.FieldByName('stp_codigo').AsInteger = 1 then begin
                 _q.Next;
                 continue;
              end;
              _stp_codigo := _q.FieldByName('stp_codigo').AsInteger;
              _q.Next;
        end;

     end;

     SMXE7.cds_pedido.Close;
     SMXE7.cds_pedido.Params[0].AsInteger := pPed_ID;
     SMXE7.cds_pedido.Execute;
     SMXE7.cds_pedido.Open;
     SMXE7.cds_pedido.Edit;
     SMXE7.cds_pedido.fieldbyname('stp_codigo').asinteger := _stp_codigo;
           _q.FieldByName('stp_codigo').AsInteger;

end;

end.
