object SMXE7: TSMXE7
  Left = 0
  Top = 0
  ClientHeight = 700
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = DSServerModuleCreate
  PixelsPerInch = 96
  TextHeight = 13
  object db_Servico: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'HostName=localhost'
      'Database=kiron'
      'User_Name=root'
      'Password=kiron'
      'Port=3307'
      'AutoCommit=0'
      'Usuario=0'
      'Nome=Genilson')
    Left = 24
    Top = 72
  end
  object qr_geral: TSQLDataSet
    CommandText = 'select * from empresa'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = db_Servico
    Left = 96
    Top = 80
  end
  object dsp_geral: TDataSetProvider
    DataSet = qr_geral
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 80
  end
  object db_ADM: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=21.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'HostName=191.252.3.206'
      'Filters={}'
      'Port=3309')
    Left = 24
    Top = 8
    UniqueId = '{52FAA604-0B5C-4990-A63F-9D8FDC04DD17}'
  end
  object dsp_ADM: TDSProviderConnection
    ServerClassName = 'TSMXE7'
    SQLConnection = db_ADM
    Left = 96
    Top = 16
  end
  object cds_K_entidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_entidade'
    RemoteServer = dsp_ADM
    Left = 168
    Top = 16
  end
  object cds_k_geral: TClientDataSet
    Aggregates = <>
    CommandText = 'select ent_codigo from kironadm.entidade'
    Params = <>
    ProviderName = 'dsp_geral'
    RemoteServer = dsp_ADM
    Left = 264
    Top = 24
  end
  object qr_log: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from log'
      'where log_id = :_id')
    SQLConnection = db_Servico
    Left = 416
    Top = 16
    object qr_loglog_id: TIntegerField
      FieldName = 'log_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_logtpl_codigo: TIntegerField
      FieldName = 'tpl_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_logusu_codigo: TIntegerField
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_loglog_data: TSQLTimeStampField
      FieldName = 'log_data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_loglog_tabela: TStringField
      FieldName = 'log_tabela'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qr_loglog_IDTabela: TStringField
      FieldName = 'log_IDTabela'
      ProviderFlags = [pfInUpdate]
    end
    object qr_loglog_descricao: TBlobField
      FieldName = 'log_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_loglog_computer: TStringField
      FieldName = 'log_computer'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_loglog_username: TStringField
      FieldName = 'log_username'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_loglog_ip: TStringField
      FieldName = 'log_ip'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_log: TDataSetProvider
    DataSet = qr_log
    UpdateMode = upWhereKeyOnly
    Left = 480
    Top = 16
  end
  object cds_log: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_log'
    Left = 544
    Top = 16
  end
  object qr_artigo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from artigo'
      'where art_codigo = :_id')
    SQLConnection = db_Servico
    Left = 224
    Top = 80
    object qr_artigoart_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'art_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_artigoart_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'art_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_artigoart_obs: TBlobField
      DisplayLabel = 'OBS'
      FieldName = 'art_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_artigodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_artigoart_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'art_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_artigo: TDataSetProvider
    DataSet = qr_artigo
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_artigoBeforeUpdateRecord
    Left = 296
    Top = 80
  end
  object qr_anp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from anp'
      'where anp_id = :_id')
    SQLConnection = db_Servico
    Left = 368
    Top = 80
    object qr_anpanp_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'anp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_anpanp_codigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'anp_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_anpanp_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'anp_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_anpanp_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'anp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_anp: TDataSetProvider
    DataSet = qr_anp
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_anpBeforeUpdateRecord
    Left = 440
    Top = 80
  end
  object qr_banco: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from banco'
      'where ban_codigo = :_id')
    SQLConnection = db_Servico
    Left = 496
    Top = 80
    object qr_bancoban_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_bancotba_codigo: TStringField
      DisplayLabel = 'C'#243'digo Bancario'
      FieldName = 'tba_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_bancoban_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'ban_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_bancoban_agencia: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'ban_agencia'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_bancoban_digage: TStringField
      DisplayLabel = 'Digito da Agencia'
      FieldName = 'ban_digage'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancoban_conta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'ban_conta'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_bancoban_digcon: TStringField
      DisplayLabel = 'Digito da Conta'
      FieldName = 'ban_digcon'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancocontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_bancoban_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'ban_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancoban_cedNome: TStringField
      DisplayLabel = 'Nome do Cedente'
      FieldName = 'ban_cedNome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_bancoban_cedCodigo: TStringField
      DisplayLabel = 'C'#243'digo do Cedente'
      FieldName = 'ban_cedCodigo'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_bancoban_especieDoc: TStringField
      DisplayLabel = 'Especie do Docto'
      FieldName = 'ban_especieDoc'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_bancoban_aceite: TStringField
      DisplayLabel = 'Aceite?'
      FieldName = 'ban_aceite'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancoban_carteira: TStringField
      DisplayLabel = 'Carteira'
      FieldName = 'ban_carteira'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_bancoban_diasProt: TIntegerField
      DisplayLabel = 'Dias para Protesto'
      FieldName = 'ban_diasProt'
      ProviderFlags = [pfInUpdate]
    end
    object qr_bancoban_pMulta: TFMTBCDField
      DisplayLabel = 'Multa'
      FieldName = 'ban_pMulta'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_bancoban_Mensagem: TBlobField
      DisplayLabel = 'Mensagem'
      FieldName = 'ban_Mensagem'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_bancoban_Instrucao1: TStringField
      DisplayLabel = 'Instru'#231#227'o 1'
      FieldName = 'ban_Instrucao1'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object qr_bancoban_Instrucao2: TStringField
      DisplayLabel = 'Instru'#231#227'o 2'
      FieldName = 'ban_Instrucao2'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object qr_bancoban_nossoNro: TIntegerField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'ban_nossoNro'
      ProviderFlags = [pfInUpdate]
    end
    object qr_bancoban_Modalidade: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'ban_Modalidade'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_bancoban_Convenio: TStringField
      DisplayLabel = 'Convenio'
      FieldName = 'ban_Convenio'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_bancoban_transmissao: TStringField
      DisplayLabel = 'Transmiss'#227'o'
      FieldName = 'ban_transmissao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_bancoban_pJuros: TFMTBCDField
      DisplayLabel = 'Juros'
      FieldName = 'ban_pJuros'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_bancoban_BancoGeraNossoNro: TStringField
      FieldName = 'ban_BancoGeraNossoNro'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bancoban_tpProtesto: TStringField
      FieldName = 'ban_tpProtesto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_banco: TDataSetProvider
    DataSet = qr_banco
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_bancoBeforeUpdateRecord
    Left = 560
    Top = 80
  end
  object qr_cce: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cce'
      'where cce_id = :_id')
    SQLConnection = db_Servico
    Left = 624
    Top = 80
    object qr_ccecce_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'cce_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ccenot_id: TIntegerField
      DisplayLabel = 'ID Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ccecce_sequencia: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'cce_sequencia'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ccecce_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'cce_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ccecce_obs: TBlobField
      DisplayLabel = 'OBS'
      FieldName = 'cce_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_ccecce_nProt: TStringField
      DisplayLabel = 'Numero do Protocolo'
      FieldName = 'cce_nProt'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_ccecce_XML: TBlobField
      DisplayLabel = 'XML'
      FieldName = 'cce_XML'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object qr_cidade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cidade'
      'where cid_id = :_id')
    SQLConnection = db_Servico
    Left = 15
    Top = 152
    object qr_cidadecid_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'cid_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_cidadecid_codigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cid_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_cidadecid_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'cid_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_cidadeuf_codigo: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_cidadedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_cidadecid_siafi: TStringField
      DisplayLabel = 'C'#243'digo Siafi'
      FieldName = 'cid_siafi'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
  end
  object qr_cobranca: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cobranca'
      'where cob_id = :_id')
    SQLConnection = db_Servico
    Left = 136
    Top = 152
    object qr_cobrancacob_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'cob_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_cobrancaemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_cobrancaban_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_cobrancacob_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'cob_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_cobrancacob_arquivo: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'cob_arquivo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object qr_cofins: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cofins'
      'where cof_id = :_id')
    SQLConnection = db_Servico
    Left = 284
    Top = 152
    object qr_cofinscof_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'cof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_cofinscof_pCOFINS: TFMTBCDField
      DisplayLabel = 'Cofins'
      FieldName = 'cof_pCOFINS'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_cofinsdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_comissao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from comissao'
      'where com_id = :_id')
    SQLConnection = db_Servico
    Left = 414
    Top = 152
    object qr_comissaocom_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'com_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_comissaoven_codigo: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_comissaocom_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'com_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_comissaocom_historico: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'com_historico'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_comissaocom_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'com_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_compl_orca: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from compl_orca'
      'where cor_codigo = :_id')
    SQLConnection = db_Servico
    Left = 568
    Top = 152
    object qr_compl_orcacor_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cor_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_compl_orcacor_nome: TBlobField
      DisplayLabel = 'Nome'
      FieldName = 'cor_nome'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_compl_orcacor_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'cor_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_compl_orcadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_conpag: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from conpag'
      'where cpg_id = :_id')
    SQLConnection = db_Servico
    Left = 16
    Top = 216
    object qr_conpagcpg_id: TIntegerField
      FieldName = 'cpg_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = 'ID'
    end
    object qr_conpagnot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'ID Nota'
    end
    object qr_conpagcpg_dias: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'cpg_dias'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagped_id: TIntegerField
      DisplayLabel = 'ID Pedido'
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagcpg_qtdpar: TIntegerField
      DisplayLabel = 'Qtd Pag'
      FieldName = 'cpg_qtdpar'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagsdp_codigo: TIntegerField
      DisplayLabel = 'Codigo da Situa'#231#227'o'
      FieldName = 'sdp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagcpg_vencto: TSQLTimeStampField
      DisplayLabel = 'Vencto'
      FieldName = 'cpg_vencto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conpagcpg_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'cpg_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
  end
  object dsp_cce: TDataSetProvider
    DataSet = qr_cce
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_cceBeforeUpdateRecord
    Left = 685
    Top = 83
  end
  object dsp_cidade: TDataSetProvider
    DataSet = qr_cidade
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_cidadeBeforeUpdateRecord
    Left = 71
    Top = 152
  end
  object dsp_cobranca: TDataSetProvider
    DataSet = qr_cobranca
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_cobrancaBeforeUpdateRecord
    Left = 208
    Top = 152
  end
  object dsp_cofins: TDataSetProvider
    DataSet = qr_cofins
    Constraints = False
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_cofinsBeforeUpdateRecord
    Left = 350
    Top = 152
  end
  object dsp_comissao: TDataSetProvider
    DataSet = qr_comissao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_comissaoBeforeUpdateRecord
    Left = 483
    Top = 152
  end
  object dsp_compl_orca: TDataSetProvider
    DataSet = qr_compl_orca
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_compl_orcaBeforeUpdateRecord
    Left = 647
    Top = 152
  end
  object dsp_conpag: TDataSetProvider
    DataSet = qr_conpag
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_conpagBeforeUpdateRecord
    Left = 80
    Top = 216
  end
  object qr_conta_email: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from conta_email'
      'where ema_id = :_id')
    SQLConnection = db_Servico
    Left = 159
    Top = 216
    object qr_conta_emailema_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ema_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_conta_emailema_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'ema_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_conta_emailema_usu_email: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'ema_usu_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_conta_emailema_smtp: TStringField
      DisplayLabel = 'SMTP'
      FieldName = 'ema_smtp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_conta_emailema_pop3: TStringField
      DisplayLabel = 'POP3'
      FieldName = 'ema_pop3'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_conta_emailema_porta: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'ema_porta'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conta_emailema_usu_login: TStringField
      DisplayLabel = 'Login'
      FieldName = 'ema_usu_login'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_conta_emailema_senha: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'ema_senha'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_conta_emailema_autentica: TStringField
      DisplayLabel = 'Autentica'
      FieldName = 'ema_autentica'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_conta_emailema_tsl: TIntegerField
      DisplayLabel = 'TSL'
      FieldName = 'ema_tsl'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conta_emailema_ssl: TStringField
      DisplayLabel = 'SSL'
      FieldName = 'ema_ssl'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_conta_emailema_metodo: TIntegerField
      DisplayLabel = 'Metodo'
      FieldName = 'ema_metodo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_deducao_ser: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from deducao_ser'
      'where ded_id = :_id')
    SQLConnection = db_Servico
    Left = 322
    Top = 216
    object qr_deducao_serded_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ded_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_deducao_serser_id: TIntegerField
      DisplayLabel = 'Id Servi'#231'o'
      FieldName = 'ser_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_deducao_serded_Deducao: TStringField
      DisplayLabel = 'Dedu'#231#227'o'
      FieldName = 'ded_Deducao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_deducao_serded_Tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ded_Tipo'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qr_deducao_serded_vTotal: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'ded_vTotal'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_deducao_serded_pDeduzir: TFMTBCDField
      DisplayLabel = 'P Deduzir'
      FieldName = 'ded_pDeduzir'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_deducao_serded_vDeduzir: TFMTBCDField
      DisplayLabel = 'V Deduzir'
      FieldName = 'ded_vDeduzir'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_deducao_serdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_devolucao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from devolucao'
      'where dev_id = :_id')
    SQLConnection = db_Servico
    Left = 488
    Top = 216
    object qr_devolucaodev_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'dev_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_devolucaoemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_devolucaodev_ano: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'dev_ano'
      ProviderFlags = [pfInUpdate]
    end
    object qr_devolucaodev_mes: TStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'dev_mes'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_devolucaodev_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'dev_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_devolucaodev_destinatario: TStringField
      DisplayLabel = 'Destinatario'
      FieldName = 'dev_destinatario'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_devolucaodev_nroNota: TStringField
      DisplayLabel = 'Nro Nota'
      FieldName = 'dev_nroNota'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_devolucaodev_dtNota: TSQLTimeStampField
      DisplayLabel = 'Dt Nota'
      FieldName = 'dev_dtNota'
      ProviderFlags = [pfInUpdate]
    end
    object qr_devolucaodev_obs: TBlobField
      DisplayLabel = 'OBS'
      FieldName = 'dev_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_devolucaodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_duplic: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from duplic'
      'where dup_id = :_id')
    SQLConnection = db_Servico
    Left = 630
    Top = 216
    object qr_duplicdup_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'dup_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_duplicnot_id: TIntegerField
      DisplayLabel = 'Id Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_numero: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'dup_numero'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_duplicdup_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'dup_parcela'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_vencto: TSQLTimeStampField
      DisplayLabel = 'Vencto'
      FieldName = 'dup_vencto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'dup_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_duplicdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicser_id: TIntegerField
      DisplayLabel = 'ID Servi'#231'o'
      FieldName = 'ser_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicent_id: TIntegerField
      DisplayLabel = 'Id Entidade'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicpla_id: TIntegerField
      DisplayLabel = 'Plano'
      FieldName = 'pla_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'dup_tipo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_duplicban_codigo: TIntegerField
      DisplayLabel = 'Codigo Banco'
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicsdp_codigo: TIntegerField
      DisplayLabel = 'Codigo da Situa'#231#227'o'
      FieldName = 'sdp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicnaf_codigo: TIntegerField
      DisplayLabel = 'Natureza Financeira'
      FieldName = 'naf_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_datemi: TSQLTimeStampField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'dup_datemi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_datpag: TSQLTimeStampField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'dup_datpag'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_valpag: TFMTBCDField
      DisplayLabel = 'Valor Pagto'
      FieldName = 'dup_valpag'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_duplicdup_valjur: TFMTBCDField
      DisplayLabel = 'Valor Juros'
      FieldName = 'dup_valjur'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_duplicdup_valdes: TFMTBCDField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'dup_valdes'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_duplicdup_valdev: TFMTBCDField
      DisplayLabel = 'Valor Devolu'#231#227'o'
      FieldName = 'dup_valdev'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_duplicdup_saldo: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'dup_saldo'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_duplicdup_obs: TBlobField
      DisplayLabel = 'OBS'
      FieldName = 'dup_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_duplicdup_numchq: TIntegerField
      DisplayLabel = 'Nro Cheque'
      FieldName = 'dup_numchq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_dtCompe: TSQLTimeStampField
      DisplayLabel = 'Dt. Compensa'#231#227'o'
      FieldName = 'dup_dtCompe'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_ctacor: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'dup_ctacor'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_duplicdup_salatu: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'dup_salatu'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_duplicore_codigo: TStringField
      DisplayLabel = 'Cod. Retorno'
      FieldName = 'ore_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_duplicdup_ocoRetorno: TStringField
      DisplayLabel = 'Ocorrencia Retorno'
      FieldName = 'dup_ocoRetorno'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_duplicdup_ocoNome: TStringField
      DisplayLabel = 'Nome da Ocorrencia'
      FieldName = 'dup_ocoNome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_dupliccob_id: TIntegerField
      DisplayLabel = 'ID Cobran'#231'a'
      FieldName = 'cob_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_nossoNro: TIntegerField
      DisplayLabel = 'Nosso Nro'
      FieldName = 'dup_nossoNro'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_cancel: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'dup_cancel'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_duplicnfc_id: TIntegerField
      FieldName = 'nfc_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicext_id: TIntegerField
      FieldName = 'ext_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_vIOF: TFMTBCDField
      FieldName = 'dup_vIOF'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_duplicdup_vTarifa: TFMTBCDField
      FieldName = 'dup_vTarifa'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_duplicdup_vLiquido: TFMTBCDField
      FieldName = 'dup_vLiquido'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_duplicdup_descontado: TStringField
      FieldName = 'dup_descontado'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_duplicdup_dtDesconto: TSQLTimeStampField
      FieldName = 'dup_dtDesconto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_dupliccon_id: TIntegerField
      FieldName = 'con_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_duplicdup_idPulsar: TIntegerField
      FieldName = 'dup_idPulsar'
    end
  end
  object qr_embala: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from embala'
      'where emb_id = :_id')
    SQLConnection = db_Servico
    Left = 16
    Top = 296
    object qr_embalaemb_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'emb_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_embalaemb_codigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'emb_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_embalaemb_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'emb_nome'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_embalaemb_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'emb_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_embaladat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_empresa: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from empresa'
      'where emp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 146
    Top = 297
    object qr_empresaemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_empresaemp_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'emp_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_razao: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'emp_razao'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_endereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'emp_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_numero: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'emp_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_comple: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'emp_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'emp_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'emp_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresacid_codigo: TStringField
      DisplayLabel = 'Codigo Cidade'
      FieldName = 'cid_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_empresauf_codigo: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_empresapai_codigo: TIntegerField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pai_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'emp_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_empresaemp_cnpj: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'emp_cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_empresaemp_ie: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'emp_ie'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_empresaemp_ie_st: TStringField
      DisplayLabel = 'I.E S.T'
      FieldName = 'emp_ie_st'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_empresaemp_im: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'emp_im'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_empresaemp_cnae: TStringField
      DisplayLabel = 'CNAE'
      FieldName = 'emp_cnae'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object qr_empresaemp_regtrib: TIntegerField
      DisplayLabel = 'Regime Tributario'
      FieldName = 'emp_regtrib'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'emp_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_empresaemp_homepage: TStringField
      DisplayLabel = 'Site'
      FieldName = 'emp_homepage'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_empresaemp_fone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'emp_fone'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_empresaemp_fax: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'emp_fax'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_empresaemp_nfe: TStringField
      DisplayLabel = 'NF-e'
      FieldName = 'emp_nfe'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'emp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_simples: TStringField
      DisplayLabel = 'Simples?'
      FieldName = 'emp_simples'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresanat_codigo: TIntegerField
      DisplayLabel = 'Natureza da Opera'#231#227'o'
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_tpAmb: TIntegerField
      DisplayLabel = 'Tipo de Ambiente'
      FieldName = 'emp_tpAmb'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_qCom: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'emp_qCom'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_vUnCom: TIntegerField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'emp_vUnCom'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_tpIMP: TIntegerField
      DisplayLabel = 'Tipo de Impress'#227'o'
      FieldName = 'emp_tpIMP'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_serie: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'emp_serie'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_empresaemp_serieDPEC: TStringField
      DisplayLabel = 'Serie DPEC'
      FieldName = 'emp_serieDPEC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_empresaemp_ultnota: TIntegerField
      DisplayLabel = 'Ultima Nota'
      FieldName = 'emp_ultnota'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_smtp: TStringField
      DisplayLabel = 'SMTP'
      FieldName = 'emp_smtp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_porta: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'emp_porta'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_usu_email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'emp_usu_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_empresaemp_usu_login: TStringField
      DisplayLabel = 'Login'
      FieldName = 'emp_usu_login'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_empresaemp_senha_email: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'emp_senha_email'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_aute_email: TStringField
      DisplayLabel = 'Autetica'
      FieldName = 'emp_aute_email'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_imprimirSaida: TStringField
      DisplayLabel = 'Imprimir Saida'
      FieldName = 'emp_imprimirSaida'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_CerNumSerie: TStringField
      DisplayLabel = 'Nro Serie Certificado'
      FieldName = 'emp_CerNumSerie'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_empresaemp_TpEnvioEmail: TStringField
      DisplayLabel = 'Tipo Envio de Email'
      FieldName = 'emp_TpEnvioEmail'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_chaveAcesso: TStringField
      DisplayLabel = 'Chave de Acesso'
      FieldName = 'emp_chaveAcesso'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_dtValidade: TSQLTimeStampField
      DisplayLabel = 'Dt. Validade'
      FieldName = 'emp_dtValidade'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_bkpAuto: TStringField
      DisplayLabel = 'Bkp Automatico'
      FieldName = 'emp_bkpAuto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_dtValidaCert: TSQLTimeStampField
      DisplayLabel = 'Validade Certificado'
      FieldName = 'emp_dtValidaCert'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_logo: TStringField
      DisplayLabel = 'Logo'
      FieldName = 'emp_logo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_pop3: TStringField
      DisplayLabel = 'Pop3'
      FieldName = 'emp_pop3'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_tamFonteCodpro: TIntegerField
      DisplayLabel = 'Tamanho fonte Codigo Produto'
      FieldName = 'emp_tamFonteCodpro'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_tsl: TIntegerField
      DisplayLabel = 'TSL'
      FieldName = 'emp_tsl'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_ssl: TStringField
      DisplayLabel = 'SSL'
      FieldName = 'emp_ssl'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_metodo: TIntegerField
      DisplayLabel = 'Metodo'
      FieldName = 'emp_metodo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_entEnde: TStringField
      DisplayLabel = 'Endere'#231'o de Entrega'
      FieldName = 'emp_entEnde'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_entNume: TStringField
      DisplayLabel = 'Nro Entrega'
      FieldName = 'emp_entNume'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_entComp: TStringField
      DisplayLabel = 'Complemento Entrega'
      FieldName = 'emp_entComp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_entBair: TStringField
      DisplayLabel = 'Bairro Entrega'
      FieldName = 'emp_entBair'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_entCida: TStringField
      DisplayLabel = 'Cidade Entrega'
      FieldName = 'emp_entCida'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_entUF: TStringField
      DisplayLabel = 'UF Entrega'
      FieldName = 'emp_entUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_empresaemp_entCep: TStringField
      DisplayLabel = 'CEP Entidade'
      FieldName = 'emp_entCep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_empresaemp_cobEnde: TStringField
      DisplayLabel = 'Endere'#231'o Cobran'#231'a'
      FieldName = 'emp_cobEnde'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_cobNume: TStringField
      DisplayLabel = 'Numero Cobran'#231'a'
      FieldName = 'emp_cobNume'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_cobComp: TStringField
      DisplayLabel = 'Complemento Cobran'#231'a'
      FieldName = 'emp_cobComp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_cobBair: TStringField
      DisplayLabel = 'Bairro Cobran'#231'a'
      FieldName = 'emp_cobBair'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_cobCida: TStringField
      DisplayLabel = 'Cidade Cobran'#231'a'
      FieldName = 'emp_cobCida'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_empresaemp_cobUF: TStringField
      DisplayLabel = 'UF Cobran'#231'a'
      FieldName = 'emp_cobUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_empresaemp_cobCep: TStringField
      DisplayLabel = 'CEP Cobran'#231'a'
      FieldName = 'emp_cobCep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_empresaemp_cnaeP: TStringField
      DisplayLabel = 'CNAE Principal'
      FieldName = 'emp_cnaeP'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_empresaemp_cnaeS: TStringField
      DisplayLabel = 'CNAE Secundario'
      FieldName = 'emp_cnaeS'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_empresaemp_pISS: TFMTBCDField
      DisplayLabel = 'ISS'
      FieldName = 'emp_pISS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_empresaemp_pPIS: TFMTBCDField
      DisplayLabel = 'PIS'
      FieldName = 'emp_pPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_empresaemp_pCofins: TFMTBCDField
      DisplayLabel = 'Cofins'
      FieldName = 'emp_pCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_empresaemp_pCSLL: TFMTBCDField
      DisplayLabel = 'CSLL'
      FieldName = 'emp_pCSLL'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_empresaemp_pINSS: TFMTBCDField
      DisplayLabel = 'INSS'
      FieldName = 'emp_pINSS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_empresaemp_pIR: TFMTBCDField
      DisplayLabel = 'IR'
      FieldName = 'emp_pIR'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_empresaemp_dtEstoque: TSQLTimeStampField
      DisplayLabel = 'Dt. Estoque'
      FieldName = 'emp_dtEstoque'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_emailACBr: TStringField
      DisplayLabel = 'Email ACBR'
      FieldName = 'emp_emailACBr'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_PctAcesso: TIntegerField
      DisplayLabel = 'Pacote de Acesso'
      FieldName = 'emp_PctAcesso'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresacid_siafi: TStringField
      FieldName = 'cid_siafi'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qr_empresaemp_block_Ped: TStringField
      DisplayLabel = 'Pedido Bloqueado'
      FieldName = 'emp_block_Ped'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_Ocultar_prod: TStringField
      DisplayLabel = 'Ocultar Produto'
      FieldName = 'emp_Ocultar_prod'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_obsPedven: TBlobField
      DisplayLabel = 'OBS Pedido de Venda'
      FieldName = 'emp_obsPedven'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_empresaemp_obsPedcom: TBlobField
      DisplayLabel = 'OBS Pedido de Compra'
      FieldName = 'emp_obsPedcom'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_empresaemp_Ocultar_ProNomeNFe: TStringField
      DisplayLabel = 'Ocultar ProNomeNFe'
      FieldName = 'emp_Ocultar_ProNomeNFe'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_diasBlockFin: TIntegerField
      FieldName = 'emp_diasBlockFin'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_validade: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'emp_validade'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_empresaemp_blockPedCompra: TStringField
      DisplayLabel = 'Bloquear Pedido de Compra'
      FieldName = 'emp_blockPedCompra'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_blockPedVenda: TStringField
      DisplayLabel = 'Bloquear Pedido de Venda'
      FieldName = 'emp_blockPedVenda'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresasdp_codigo: TIntegerField
      DisplayLabel = 'Situa'#231#227'o Financeira'
      FieldName = 'sdp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaban_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo Bancario'
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_ReservaProd: TStringField
      FieldName = 'emp_ReservaProd'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_DiasReserva: TIntegerField
      FieldName = 'emp_DiasReserva'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_Ocultar_ProNomeOF: TStringField
      DisplayLabel = 'Ocultar Nome do Produto na O.F'
      FieldName = 'emp_Ocultar_ProNomeOF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_Ocultar_Rodape: TStringField
      DisplayLabel = 'Ocultar Rodape'
      FieldName = 'emp_Ocultar_Rodape'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_precoTab: TIntegerField
      DisplayLabel = 'Pre'#231'o de Tabela'
      FieldName = 'emp_precoTab'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_blockPrintPedido: TStringField
      FieldName = 'emp_blockPrintPedido'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_tpBoleto: TIntegerField
      DisplayLabel = 'Tipo de Boleto'
      FieldName = 'emp_tpBoleto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_licitaOBS: TBlobField
      FieldName = 'emp_licitaOBS'
      Size = 1
    end
    object qr_empresaemp_licitaNorma: TBlobField
      FieldName = 'emp_licitaNorma'
      Size = 1
    end
    object qr_empresaemp_licitaCond: TBlobField
      FieldName = 'emp_licitaCond'
      Size = 1
    end
    object qr_empresaemp_PrintMarcaPedido: TStringField
      FieldName = 'emp_PrintMarcaPedido'
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_pathProdAnexo: TStringField
      FieldName = 'emp_pathProdAnexo'
      Size = 100
    end
    object qr_empresaemp_CalculaVolume: TStringField
      FieldName = 'emp_CalculaVolume'
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_PrintConpagPed: TStringField
      FieldName = 'emp_PrintConpagPed'
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_qCasaDecPed: TIntegerField
      FieldName = 'emp_qCasaDecPed'
    end
    object qr_empresaemp_EmbalaPedido: TStringField
      FieldName = 'emp_EmbalaPedido'
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_SegUnimed: TStringField
      FieldName = 'emp_SegUnimed'
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_RibbonStyle: TIntegerField
      FieldName = 'emp_RibbonStyle'
      ProviderFlags = [pfInUpdate]
    end
    object qr_empresaemp_imgMenu: TBlobField
      FieldName = 'emp_imgMenu'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_empresaemp_LimiteCred: TStringField
      FieldName = 'emp_LimiteCred'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_empresaemp_padraoNFSe: TStringField
      FieldName = 'emp_padraoNFSe'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
  end
  object qr_ent_aliq_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_aliq_icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 288
    Top = 296
    object qr_ent_aliq_icmsicm_id: TIntegerField
      DisplayLabel = 'ICMS Id'
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_aliq_icmsent_id: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_aliq_icmsicm_ufOrig: TStringField
      DisplayLabel = 'UF Origem'
      FieldName = 'icm_ufOrig'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_aliq_icmsicm_ufDest: TStringField
      DisplayLabel = 'UF Destino'
      FieldName = 'icm_ufDest'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pICMS: TFMTBCDField
      DisplayLabel = 'Icms'
      FieldName = 'icm_pICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pICMSFrete: TFMTBCDField
      DisplayLabel = 'Frete'
      FieldName = 'icm_pICMSFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pDifere: TFMTBCDField
      DisplayLabel = 'Diferen'#231'a'
      FieldName = 'icm_pDifere'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pICMSST: TFMTBCDField
      DisplayLabel = 'ICMS S.T'
      FieldName = 'icm_pICMSST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pBC: TFMTBCDField
      DisplayLabel = 'Base de Calculo'
      FieldName = 'icm_pBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pRedBC: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o B.C'
      FieldName = 'icm_pRedBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_vPauta: TFMTBCDField
      DisplayLabel = 'Valor Pauta'
      FieldName = 'icm_vPauta'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pBCST: TFMTBCDField
      DisplayLabel = 'B.C S.T'
      FieldName = 'icm_pBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pRedBCST: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o BC S.T'
      FieldName = 'icm_pRedBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pIVA: TFMTBCDField
      DisplayLabel = 'IVA%'
      FieldName = 'icm_pIVA'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsicm_vPautaST: TFMTBCDField
      DisplayLabel = 'Valor Pauta S.T'
      FieldName = 'icm_vPautaST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_ent_aliq_icmsicm_pOperaPro: TFMTBCDField
      DisplayLabel = 'Opera'#231#227'o Propria'
      FieldName = 'icm_pOperaPro'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ent_aliq_icmsdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_ent_imp_cof: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_imp_cof'
      'where cof_id = :_id')
    SQLConnection = db_Servico
    Left = 464
    Top = 296
    object qr_ent_imp_cofcof_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'cof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_imp_cofent_id: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_cofcof_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'cof_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_cofcof_esquema: TIntegerField
      DisplayLabel = 'Esquema'
      FieldName = 'cof_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_cofcof_cstST: TStringField
      DisplayLabel = 'CST S.T'
      FieldName = 'cof_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_cofcof_esquemaST: TIntegerField
      DisplayLabel = 'Esquema S.T'
      FieldName = 'cof_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_cofcof_tpAliq: TIntegerField
      DisplayLabel = 'Tipo Aliquota'
      FieldName = 'cof_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_cofdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_ent_imp_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_imp_icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 639
    Top = 296
    object qr_ent_imp_icmsicm_id: TIntegerField
      DisplayLabel = 'ICMS id'
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_imp_icmsent_id: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'icm_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_icmsicm_modBC: TIntegerField
      DisplayLabel = 'Modalidade BC'
      FieldName = 'icm_modBC'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_modBCST: TIntegerField
      DisplayLabel = 'Modalidade BC CST'
      FieldName = 'icm_modBCST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_esquema: TIntegerField
      DisplayLabel = 'Esquema'
      FieldName = 'icm_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_esquemaST: TIntegerField
      DisplayLabel = 'Esquema ST'
      FieldName = 'icm_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_tpAliq: TIntegerField
      DisplayLabel = 'Tipo Aliquota'
      FieldName = 'icm_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_icmsicm_csosn: TStringField
      DisplayLabel = 'CSOSN'
      FieldName = 'icm_csosn'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object qr_ent_imp_ipi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_imp_ipi'
      'where ipi_id = :_id')
    SQLConnection = db_Servico
    Left = 27
    Top = 384
    object qr_ent_imp_ipiipi_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ipi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_imp_ipient_id: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_ipiipi_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'ipi_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_ipiipi_esquema: TIntegerField
      DisplayLabel = 'Esquema'
      FieldName = 'ipi_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_ipiipi_tpAliq: TIntegerField
      DisplayLabel = 'Tipo Aliquota'
      FieldName = 'ipi_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_ipidat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_ent_imp_pis: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_imp_pis'
      'where pis_id = :_id')
    SQLConnection = db_Servico
    Left = 192
    Top = 384
    object qr_ent_imp_pispis_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'pis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_imp_pisent_id: TIntegerField
      DisplayLabel = 'Entidade'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_pispis_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'pis_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_pispis_esquema: TIntegerField
      DisplayLabel = 'Esquema'
      FieldName = 'pis_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_pispis_cstST: TStringField
      DisplayLabel = 'CST ST'
      FieldName = 'pis_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_ent_imp_pispis_esquemaST: TIntegerField
      DisplayLabel = 'Esquema ST'
      FieldName = 'pis_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_pispis_tpAliq: TIntegerField
      DisplayLabel = 'Tipo Aliquota'
      FieldName = 'pis_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_imp_pisdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_ent_preco: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ent_preco'
      'where epr_id = :_id')
    SQLConnection = db_Servico
    Left = 364
    Top = 384
    object qr_ent_precoepr_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'epr_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ent_precoent_id: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_precopro_id: TIntegerField
      DisplayLabel = 'Id Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ent_precoepr_preco: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'epr_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
    object qr_ent_precodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_entidade: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from entidade'
      'where ent_id = :_id')
    SQLConnection = db_Servico
    Left = 512
    Top = 384
    object qr_entidadeent_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_entidadeent_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'ent_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_razao: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'ent_razao'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_endereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ent_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_numero: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'ent_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_comple: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ent_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'ent_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'ent_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'ent_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_entidadecid_codigo: TStringField
      DisplayLabel = 'Codigo do Municipio'
      FieldName = 'cid_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_entidadepai_codigo: TIntegerField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pai_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeuf_codigo: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_entidadeent_cnpj: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'ent_cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_entidadeent_cpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'ent_cpf'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qr_entidadeent_ie: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'ent_ie'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_rg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'ent_rg'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_entidadeent_im: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'ent_im'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_entidadeent_suframa: TStringField
      DisplayLabel = 'Suframa'
      FieldName = 'ent_suframa'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_homepage: TStringField
      DisplayLabel = 'Homepage'
      FieldName = 'ent_homepage'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_entidadeent_email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'ent_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_entidadeent_cliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'ent_cliente'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_forne: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'ent_forne'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_transp: TStringField
      DisplayLabel = 'Transportadora'
      FieldName = 'ent_transp'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_fone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'ent_fone'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_entidadedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'ent_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeven_codigo: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_entEnde: TStringField
      DisplayLabel = 'Endere'#231'o de Entrega'
      FieldName = 'ent_entEnde'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_entNume: TStringField
      DisplayLabel = 'Numero Entrega'
      FieldName = 'ent_entNume'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_entComp: TStringField
      DisplayLabel = 'Complemento Entrega'
      FieldName = 'ent_entComp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_entBair: TStringField
      DisplayLabel = 'Bairro Entrega'
      FieldName = 'ent_entBair'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_entCida: TStringField
      DisplayLabel = 'Cidade de Entrega'
      FieldName = 'ent_entCida'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_entUF: TStringField
      DisplayLabel = 'UF Entrega'
      FieldName = 'ent_entUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_entidadeent_entCep: TStringField
      DisplayLabel = 'Cep Entrega'
      FieldName = 'ent_entCep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_entidadeent_cobEnde: TStringField
      DisplayLabel = 'Endere'#231'o Cobran'#231'a'
      FieldName = 'ent_cobEnde'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cobNume: TStringField
      DisplayLabel = 'Numero Cobran'#231'a'
      FieldName = 'ent_cobNume'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_cobComp: TStringField
      DisplayLabel = 'Complemento Cobran'#231'a'
      FieldName = 'ent_cobComp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cobBair: TStringField
      DisplayLabel = 'Bairro cobran'#231'a'
      FieldName = 'ent_cobBair'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cobCida: TStringField
      DisplayLabel = 'Cidade Cobran'#231'a'
      FieldName = 'ent_cobCida'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_cobUF: TStringField
      DisplayLabel = 'UF Cobran'#231'a'
      FieldName = 'ent_cobUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_entidadeent_cobCep: TStringField
      DisplayLabel = 'CEP Cobran'#231'a'
      FieldName = 'ent_cobCep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_entidadeent_bcNome: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'ent_bcNome'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_bcConta: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'ent_bcConta'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_bcAgencia: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'ent_bcAgencia'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_block: TStringField
      DisplayLabel = 'Bloqueado?'
      FieldName = 'ent_block'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidaderat_codigo: TIntegerField
      FieldName = 'rat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_idTransp: TIntegerField
      FieldName = 'ent_idTransp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_simples: TStringField
      DisplayLabel = 'Simples?'
      FieldName = 'ent_simples'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_frete: TIntegerField
      DisplayLabel = 'Frete'
      FieldName = 'ent_frete'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_contato: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'ent_contato'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_entidadeent_email_com: TStringField
      DisplayLabel = 'Email comercial'
      FieldName = 'ent_email_com'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_entidadeent_obs: TBlobField
      DisplayLabel = 'OBS'
      FieldName = 'ent_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_entidadeent_conFinal: TStringField
      DisplayLabel = 'Consumidor Final?'
      FieldName = 'ent_conFinal'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_contrICMS: TStringField
      DisplayLabel = 'Contribuinte ICMS?'
      FieldName = 'ent_contrICMS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeent_entHorario: TStringField
      DisplayLabel = 'Horario'
      FieldName = 'ent_entHorario'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_conpag: TStringField
      FieldName = 'ent_conpag'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entidadeent_DiasEntrega: TIntegerField
      DisplayLabel = 'Qntda de dias p/ entrega'
      FieldName = 'ent_DiasEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadetbp_codigo: TIntegerField
      FieldName = 'tbp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_limite: TFMTBCDField
      DisplayLabel = 'limite'
      FieldName = 'ent_limite'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_entidadereg_codigo: TIntegerField
      FieldName = 'reg_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadefip_codigo: TIntegerField
      FieldName = 'fip_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entidadeent_blockFin: TStringField
      FieldName = 'ent_blockFin'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entidadeage_codigo: TIntegerField
      FieldName = 'age_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_esquema: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from esquema'
      'where esq_codigo = :_id')
    SQLConnection = db_Servico
    Left = 651
    Top = 384
    object qr_esquemaesq_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'esq_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_esquemaesq_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'esq_nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dsp_conta_email: TDataSetProvider
    DataSet = qr_conta_email
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_conta_emailBeforeUpdateRecord
    Left = 239
    Top = 216
  end
  object dsp_deducao_ser: TDataSetProvider
    DataSet = qr_deducao_ser
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_deducao_serBeforeUpdateRecord
    Left = 409
    Top = 216
  end
  object dsp_devolucao: TDataSetProvider
    DataSet = qr_devolucao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_devolucaoBeforeUpdateRecord
    Left = 561
    Top = 216
  end
  object dsp_duplic: TDataSetProvider
    DataSet = qr_duplic
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_duplicBeforeUpdateRecord
    AfterApplyUpdates = dsp_duplicAfterApplyUpdates
    Left = 688
    Top = 216
  end
  object dsp_embala: TDataSetProvider
    DataSet = qr_embala
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_embalaBeforeUpdateRecord
    Left = 77
    Top = 296
  end
  object dsp_empresa: TDataSetProvider
    DataSet = qr_empresa
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_empresaBeforeUpdateRecord
    Left = 213
    Top = 296
  end
  object dsp_ent_aliq_icms: TDataSetProvider
    DataSet = qr_ent_aliq_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_aliq_icmsBeforeUpdateRecord
    Left = 377
    Top = 296
  end
  object dsp_ent_imp_cof: TDataSetProvider
    DataSet = qr_ent_imp_cof
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_imp_cofBeforeUpdateRecord
    Left = 552
    Top = 296
  end
  object dsp_ent_imp_icms: TDataSetProvider
    DataSet = qr_ent_imp_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_imp_icmsBeforeUpdateRecord
    Left = 727
    Top = 296
  end
  object dsp_ent_imp_ipi: TDataSetProvider
    DataSet = qr_ent_imp_ipi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_imp_ipiBeforeUpdateRecord
    Left = 112
    Top = 384
  end
  object dsp_ent_imp_pis: TDataSetProvider
    DataSet = qr_ent_imp_pis
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_imp_pisBeforeUpdateRecord
    Left = 279
    Top = 384
  end
  object dsp_ent_preco: TDataSetProvider
    DataSet = qr_ent_preco
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ent_precoBeforeUpdateRecord
    Left = 438
    Top = 384
  end
  object dsp_entidade: TDataSetProvider
    DataSet = qr_entidade
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_entidadeBeforeUpdateRecord
    Left = 580
    Top = 384
  end
  object dsp_esquema: TDataSetProvider
    DataSet = qr_esquema
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_esquemaBeforeUpdateRecord
    Left = 721
    Top = 384
  end
  object qr_fatura: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from fatura'
      'where fat_id = :_id')
    SQLConnection = db_Servico
    Left = 19
    Top = 472
    object qr_faturafat_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'fat_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_faturaemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_faturafat_ano: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'fat_ano'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qr_faturafat_mes: TStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'fat_mes'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_faturafat_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'fat_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_faturacontrole: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_faturadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_faturafat_vlCancelada: TFMTBCDField
      DisplayLabel = 'Valor Cancelada'
      FieldName = 'fat_vlCancelada'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_faturafat_vlDevolucao: TFMTBCDField
      DisplayLabel = 'Valor Devolu'#231#227'o'
      FieldName = 'fat_vlDevolucao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_finaped: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from finaped'
      'where fip_codigo = :_id')
    SQLConnection = db_Servico
    Left = 140
    Top = 472
    object qr_finapedfip_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fip_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_finapedfip_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'fip_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_finapedcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_finapeddat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_finapedfip_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'fip_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_finapedfip_compra: TStringField
      DisplayLabel = 'Compra'
      FieldName = 'fip_compra'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_finapedfip_venda: TStringField
      DisplayLabel = 'Venda'
      FieldName = 'fip_venda'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_finapedfip_servico: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'fip_servico'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
  end
  object qr_form: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from form'
      'where frm_id = :_id')
    SQLConnection = db_Servico
    Left = 266
    Top = 471
    object qr_formfrm_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'frm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_formfrm_modulo: TStringField
      DisplayLabel = 'Modulo'
      FieldName = 'frm_modulo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_formfrm_form: TStringField
      DisplayLabel = 'Form'
      FieldName = 'frm_form'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_formfrm_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'frm_nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_formfrm_executar: TStringField
      DisplayLabel = 'Executar'
      FieldName = 'frm_executar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_formfrm_incluir: TStringField
      DisplayLabel = 'Incluir'
      FieldName = 'frm_incluir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_formfrm_editar: TStringField
      DisplayLabel = 'Editar'
      FieldName = 'frm_editar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_formfrm_excluir: TStringField
      DisplayLabel = 'Excluir'
      FieldName = 'frm_excluir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_formfrm_visualizar: TStringField
      DisplayLabel = 'Visualizar'
      FieldName = 'frm_visualizar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_formfrm_imprimir: TStringField
      DisplayLabel = 'Imprimir'
      FieldName = 'frm_imprimir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_grupro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from grupro'
      'where grp_id = :_id')
    SQLConnection = db_Servico
    Left = 380
    Top = 471
    object qr_gruprogrp_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'grp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_gruprogrp_codigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'grp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_gruprogrp_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'grp_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_gruprocontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_gruprodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_gruprogrp_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'grp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_habusu: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from habusu'
      'where hab_id = :_id')
    SQLConnection = db_Servico
    Left = 503
    Top = 471
    object qr_habusuhab_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'hab_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_habusufrm_id: TIntegerField
      FieldName = 'frm_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_habusuemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_habusuusu_codigo: TIntegerField
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_habusuhab_executar: TStringField
      FieldName = 'hab_executar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusuhab_incluir: TStringField
      FieldName = 'hab_incluir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusuhab_editar: TStringField
      FieldName = 'hab_editar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusuhab_excluir: TStringField
      FieldName = 'hab_excluir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusuhab_visualizar: TStringField
      FieldName = 'hab_visualizar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusuhab_imprimir: TStringField
      FieldName = 'hab_imprimir'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_habusudat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 640
    Top = 470
    object qr_icmsicm_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_icmsicm_ufOrig: TStringField
      DisplayLabel = 'UF Origem'
      FieldName = 'icm_ufOrig'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_icmsicm_ufDest: TStringField
      DisplayLabel = 'UF Destino'
      FieldName = 'icm_ufDest'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_icmsicm_pICMS: TFMTBCDField
      DisplayLabel = 'Icms'
      FieldName = 'icm_pICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pICMSFrete: TFMTBCDField
      DisplayLabel = 'ICMS Frete'
      FieldName = 'icm_pICMSFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pDifere: TFMTBCDField
      DisplayLabel = 'Diferen'#231'a'
      FieldName = 'icm_pDifere'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pICMSST: TFMTBCDField
      DisplayLabel = 'ICMS ST'
      FieldName = 'icm_pICMSST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pBC: TFMTBCDField
      DisplayLabel = 'Base Calculo'
      FieldName = 'icm_pBC'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pRedBC: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o BC'
      FieldName = 'icm_pRedBC'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_vPauta: TFMTBCDField
      DisplayLabel = 'Pauta'
      FieldName = 'icm_vPauta'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pBCST: TFMTBCDField
      DisplayLabel = 'BC ST'
      FieldName = 'icm_pBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pRedBCST: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o BC ST'
      FieldName = 'icm_pRedBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pIVA: TFMTBCDField
      DisplayLabel = 'IVA%'
      FieldName = 'icm_pIVA'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_vPautaST: TFMTBCDField
      DisplayLabel = 'Pauta ST'
      FieldName = 'icm_vPautaST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_pOperaPro: TFMTBCDField
      DisplayLabel = 'Opera'#231#227'o Propria'
      FieldName = 'icm_pOperaPro'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_icmsicm_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'icm_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_icmsdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_ipi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ipi'
      'where ipi_id = :_id')
    SQLConnection = db_Servico
    Left = 17
    Top = 552
    object qr_ipiipi_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ipi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_ipincm_codigo: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'ncm_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_ipiipi_pIPI: TFMTBCDField
      DisplayLabel = 'IPI'
      FieldName = 'ipi_pIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ipiipi_pBC: TFMTBCDField
      DisplayLabel = 'Base de Calculo'
      FieldName = 'ipi_pBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ipiipi_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'ipi_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_ipidat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ipiipi_pIBPT_Nac: TFMTBCDField
      DisplayLabel = 'IBPT Nacional'
      FieldName = 'ipi_pIBPT_Nac'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_ipiipi_pIBPT_Imp: TFMTBCDField
      DisplayLabel = 'IBPT Importoda'
      FieldName = 'ipi_pIBPT_Imp'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_item_cof: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_cof'
      'where cof_id = :_id')
    SQLConnection = db_Servico
    Left = 131
    Top = 552
    object qr_item_cofcof_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'cof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_cofite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_cofnot_id: TIntegerField
      DisplayLabel = 'Id Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_cofcof_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'cof_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_item_cofcof_vBC: TFMTBCDField
      DisplayLabel = 'Valor Base de Calculo'
      FieldName = 'cof_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_cofcof_pCofins: TFMTBCDField
      DisplayLabel = 'Cofins'
      FieldName = 'cof_pCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_cofcof_vCofins: TFMTBCDField
      DisplayLabel = 'Valor Cofins'
      FieldName = 'cof_vCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_cofcof_vBCProd: TFMTBCDField
      DisplayLabel = 'Valor BC Produto'
      FieldName = 'cof_vBCProd'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_cofcof_vAliqProd: TFMTBCDField
      DisplayLabel = 'Aliquota'
      FieldName = 'cof_vAliqProd'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_cofcof_qBCProd: TFMTBCDField
      DisplayLabel = 'Base Calculo Produto'
      FieldName = 'cof_qBCProd'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_cofcof_vBCST: TFMTBCDField
      DisplayLabel = 'Valor BC ST'
      FieldName = 'cof_vBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_cofcof_pBCST: TFMTBCDField
      DisplayLabel = 'BC ST'
      FieldName = 'cof_pBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_cofcof_pCofinsST: TFMTBCDField
      DisplayLabel = 'Cofins ST'
      FieldName = 'cof_pCofinsST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_cofcof_qBCProdST: TFMTBCDField
      DisplayLabel = 'BC Produto ST'
      FieldName = 'cof_qBCProdST'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_cofcof_vAliqProdST: TFMTBCDField
      DisplayLabel = 'Aliquota Produto ST'
      FieldName = 'cof_vAliqProdST'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_cofcof_vCofinsST: TFMTBCDField
      DisplayLabel = 'Valor Cofins ST'
      FieldName = 'cof_vCofinsST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_cofite_atualiza: TStringField
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_cofdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. inclus'#227'o?'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_comb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_comb'
      'where ico_id = :_id')
    SQLConnection = db_Servico
    Left = 280
    Top = 552
    object qr_item_combico_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ico_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_combite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_combnot_id: TIntegerField
      DisplayLabel = 'Id Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_combanp_codigo: TStringField
      DisplayLabel = 'C'#243'digo ANP'
      FieldName = 'anp_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_item_combico_codif: TStringField
      FieldName = 'ico_codif'
      ProviderFlags = [pfInUpdate]
      Size = 21
    end
    object qr_item_combico_qTemp: TFMTBCDField
      FieldName = 'ico_qTemp'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_combico_UFCons: TStringField
      DisplayLabel = 'UF Cons'
      FieldName = 'ico_UFCons'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_item_combico_qBCProd: TFMTBCDField
      DisplayLabel = 'BC Produto'
      FieldName = 'ico_qBCProd'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_combico_vAliqProd: TFMTBCDField
      DisplayLabel = 'Valor Aliquota Prod'
      FieldName = 'ico_vAliqProd'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_combico_vCide: TFMTBCDField
      DisplayLabel = 'Valor Cide'
      FieldName = 'ico_vCide'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
  end
  object qr_item_di: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_di'
      'where idi_id = :_id')
    SQLConnection = db_Servico
    Left = 448
    Top = 552
    object qr_item_diidi_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'idi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_diite_id: TIntegerField
      DisplayLabel = 'Id Item'
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_dinot_id: TIntegerField
      DisplayLabel = 'Id Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_diidi_nDI: TStringField
      FieldName = 'idi_nDI'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_item_diidi_dDI: TSQLTimeStampField
      FieldName = 'idi_dDI'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_diidi_xLocDesemb: TStringField
      FieldName = 'idi_xLocDesemb'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_item_diidi_UFDesemb: TStringField
      FieldName = 'idi_UFDesemb'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_item_diidi_dDesemb: TSQLTimeStampField
      FieldName = 'idi_dDesemb'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_diidi_cExportador: TStringField
      FieldName = 'idi_cExportador'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_item_diidi_nAdicao: TIntegerField
      FieldName = 'idi_nAdicao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_diidi_nSeqAdi: TIntegerField
      FieldName = 'idi_nSeqAdi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_diidi_cFabricante: TStringField
      FieldName = 'idi_cFabricante'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_item_diidi_vDescDI: TFMTBCDField
      FieldName = 'idi_vDescDI'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_item_didat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_fatura: TDataSetProvider
    DataSet = qr_fatura
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_faturaBeforeUpdateRecord
    Left = 76
    Top = 472
  end
  object dsp_finaped: TDataSetProvider
    DataSet = qr_finaped
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_finapedBeforeUpdateRecord
    Left = 205
    Top = 472
  end
  object dsp_form: TDataSetProvider
    DataSet = qr_form
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_formBeforeUpdateRecord
    Left = 321
    Top = 471
  end
  object dsp_grupro: TDataSetProvider
    DataSet = qr_grupro
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_gruproBeforeUpdateRecord
    Left = 436
    Top = 471
  end
  object dsp_habusu: TDataSetProvider
    DataSet = qr_habusu
    BeforeUpdateRecord = dsp_habusuBeforeUpdateRecord
    Left = 566
    Top = 471
  end
  object dsp_icms: TDataSetProvider
    DataSet = qr_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_icmsBeforeUpdateRecord
    Left = 713
    Top = 470
  end
  object dsp_ipi: TDataSetProvider
    DataSet = qr_ipi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ipiBeforeUpdateRecord
    Left = 71
    Top = 552
  end
  object dsp_item_cof: TDataSetProvider
    DataSet = qr_item_cof
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_cofBeforeUpdateRecord
    Left = 201
    Top = 552
  end
  object dsp_item_comb: TDataSetProvider
    DataSet = qr_item_comb
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_combBeforeUpdateRecord
    Left = 360
    Top = 552
  end
  object dsp_item_di: TDataSetProvider
    DataSet = qr_item_di
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_diBeforeUpdateRecord
    Left = 528
    Top = 552
  end
  object qr_item_est: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_est'
      'where ies_id = :_id')
    SQLConnection = db_Servico
    Left = 616
    Top = 552
    object qr_item_esties_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ies_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_esties_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'ies_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estite_id: TIntegerField
      DisplayLabel = 'Id Item'
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estnot_id: TIntegerField
      DisplayLabel = 'Id Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_esttpe_codigo: TIntegerField
      DisplayLabel = 'Tipo de Estoque'
      FieldName = 'tpe_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estpro_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estuni_codigo: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_item_esties_qtda: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'ies_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_esties_tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ies_tipo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_esties_docto: TStringField
      DisplayLabel = 'Docto'
      FieldName = 'ies_docto'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_item_esties_historico: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'ies_historico'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_item_estdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estven_codigo: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estorf_id: TIntegerField
      DisplayLabel = 'Ordem de Fab.'
      FieldName = 'orf_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estiof_id: TIntegerField
      FieldName = 'iof_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estped_id: TIntegerField
      DisplayLabel = 'Id Pedido'
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_esties_numreq: TIntegerField
      DisplayLabel = 'Nro Requisi'#231#227'o'
      FieldName = 'ies_numreq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_estobr_id: TIntegerField
      DisplayLabel = 'Obra'
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 25
    Top = 640
    object qr_item_icmsicm_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_icmsite_id: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_icmsnot_id: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_icmsicm_cst: TStringField
      DisplayLabel = 'CST'
      FieldName = 'icm_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_item_icmsicm_modBC: TIntegerField
      DisplayLabel = 'Modalidade BC'
      FieldName = 'icm_modBC'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_icmsicm_pRedBC: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o BC'
      FieldName = 'icm_pRedBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_vBC: TFMTBCDField
      DisplayLabel = 'Valor BC'
      FieldName = 'icm_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_pBC: TFMTBCDField
      DisplayLabel = 'BC'
      FieldName = 'icm_pBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_pICMS: TFMTBCDField
      DisplayLabel = 'ICMS'
      FieldName = 'icm_pICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_vICMS: TFMTBCDField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'icm_vICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_modBCST: TIntegerField
      DisplayLabel = 'Modalidade BC ST'
      FieldName = 'icm_modBCST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_icmsicm_pIVA: TFMTBCDField
      DisplayLabel = 'IVA'
      FieldName = 'icm_pIVA'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_pRedBCST: TFMTBCDField
      DisplayLabel = 'Redu'#231#227'o BC ST'
      FieldName = 'icm_pRedBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_vBCST: TFMTBCDField
      DisplayLabel = 'Valor BC ST'
      FieldName = 'icm_vBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_pBCST: TFMTBCDField
      DisplayLabel = 'BC ST'
      FieldName = 'icm_pBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_pICMSST: TFMTBCDField
      DisplayLabel = 'ICMS ST'
      FieldName = 'icm_pICMSST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_vICMSST: TFMTBCDField
      DisplayLabel = 'Valor ICMS ST'
      FieldName = 'icm_vICMSST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_vPauta: TFMTBCDField
      DisplayLabel = 'Valor Pauta'
      FieldName = 'icm_vPauta'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_pOperaPro: TFMTBCDField
      DisplayLabel = 'Opera'#231#227'o Propria'
      FieldName = 'icm_pOperaPro'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_icmsicm_vPautaST: TFMTBCDField
      DisplayLabel = 'Valor Pauta ST'
      FieldName = 'icm_vPautaST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsite_atualiza: TStringField
      DisplayLabel = 'Atualiza'
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_icmsdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_icmsicm_csosn: TStringField
      DisplayLabel = 'CSOSN'
      FieldName = 'icm_csosn'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_item_icmsicm_pCredSN: TFMTBCDField
      DisplayLabel = 'Credito Simples Nacional'
      FieldName = 'icm_pCredSN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_icmsicm_vCredICMSSN: TFMTBCDField
      DisplayLabel = 'Valor Credito ICMS SN'
      FieldName = 'icm_vCredICMSSN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
  end
  object qr_item_ii: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_ii'
      'where iim_id = :_id')
    SQLConnection = db_Servico
    Left = 155
    Top = 640
    object qr_item_iiiim_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'iim_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_iiite_id: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_iinot_id: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_iiiim_vBC: TFMTBCDField
      DisplayLabel = 'Valor BC'
      FieldName = 'iim_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_iiiim_vDespAdu: TFMTBCDField
      DisplayLabel = 'Valor Despesa Aduaneira'
      FieldName = 'iim_vDespAdu'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_iiiim_vII: TFMTBCDField
      DisplayLabel = 'Valor II'
      FieldName = 'iim_vII'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_iiiim_vIOF: TFMTBCDField
      DisplayLabel = 'Valor IOF'
      FieldName = 'iim_vIOF'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_iiite_atualiza: TStringField
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_iidat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_iiiim_vIPI: TFMTBCDField
      DisplayLabel = 'Valor IPI'
      FieldName = 'iim_vIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_item_iiiim_vTaxa: TFMTBCDField
      DisplayLabel = 'Valor Taxa'
      FieldName = 'iim_vTaxa'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_item_iiiim_vPis: TFMTBCDField
      DisplayLabel = 'Valor Pis'
      FieldName = 'iim_vPis'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_item_iiiim_vCofins: TFMTBCDField
      DisplayLabel = 'Valor Cofins'
      FieldName = 'iim_vCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_item_ipi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_ipi'
      'where ipi_id = :_id')
    SQLConnection = db_Servico
    Left = 281
    Top = 640
    object qr_item_ipiipi_id: TIntegerField
      FieldName = 'ipi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_ipiite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ipinot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ipiipi_clEnq: TStringField
      FieldName = 'ipi_clEnq'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object qr_item_ipiipi_CNPJProd: TStringField
      FieldName = 'ipi_CNPJProd'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_item_ipiipi_cSelo: TStringField
      FieldName = 'ipi_cSelo'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_item_ipiipi_qSelo: TIntegerField
      FieldName = 'ipi_qSelo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ipiipi_cEnq: TStringField
      FieldName = 'ipi_cEnq'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_item_ipiipi_cst: TStringField
      FieldName = 'ipi_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_item_ipiipi_vBC: TFMTBCDField
      FieldName = 'ipi_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_ipiipi_pBC: TFMTBCDField
      FieldName = 'ipi_pBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_ipiipi_qUnid: TFMTBCDField
      FieldName = 'ipi_qUnid'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_ipiipi_vUnid: TFMTBCDField
      FieldName = 'ipi_vUnid'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_ipiipi_pIPI: TFMTBCDField
      FieldName = 'ipi_pIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_ipiipi_vIPI: TFMTBCDField
      FieldName = 'ipi_vIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_ipiite_atualiza: TStringField
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_ipidat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_issqn: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_issqn'
      'where iss_id = :_id')
    SQLConnection = db_Servico
    Left = 432
    Top = 640
    object qr_item_issqniss_id: TIntegerField
      FieldName = 'iss_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_issqnite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_issqnnot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_issqniss_vBC: TFMTBCDField
      FieldName = 'iss_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_issqniss_vAliq: TFMTBCDField
      FieldName = 'iss_vAliq'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_issqniss_vISSQN: TFMTBCDField
      FieldName = 'iss_vISSQN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_issqniss_cMunFG: TIntegerField
      FieldName = 'iss_cMunFG'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_issqniss_cListServ: TIntegerField
      FieldName = 'iss_cListServ'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_issqnite_atualiza: TStringField
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_issqndat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_med: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_med'
      'where ime_id = :_id')
    SQLConnection = db_Servico
    Left = 608
    Top = 640
    object qr_item_medime_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ime_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_medite_id: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_mednot_id: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_medime_nLote: TStringField
      DisplayLabel = 'Nro Lote'
      FieldName = 'ime_nLote'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_medime_qLote: TFMTBCDField
      DisplayLabel = 'Qtd Lote'
      FieldName = 'ime_qLote'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 3
    end
    object qr_item_medime_dFab: TSQLTimeStampField
      DisplayLabel = 'Dt. Fabrica'#231#227'o'
      FieldName = 'ime_dFab'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_medime_dVal: TSQLTimeStampField
      DisplayLabel = 'Dt. Validade'
      FieldName = 'ime_dVal'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_medime_vPMC: TFMTBCDField
      DisplayLabel = 'Valor PMC'
      FieldName = 'ime_vPMC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_meddat_inclusao: TSQLTimeStampField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_not: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_not'
      'where ite_id = :_id')
    SQLConnection = db_Servico
    Left = 25
    Top = 720
    object qr_item_notite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_notnot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notpro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notite_comple: TBlobField
      FieldName = 'ite_comple'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_item_notncm_codigo: TStringField
      FieldName = 'ncm_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_item_notite_extipi: TStringField
      FieldName = 'ite_extipi'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_item_notnat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notuni_codigo: TStringField
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object qr_item_notite_qtda: TFMTBCDField
      FieldName = 'ite_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_notite_preco: TFMTBCDField
      FieldName = 'ite_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 23
      Size = 10
    end
    object qr_item_notite_vProd: TFMTBCDField
      FieldName = 'ite_vProd'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notite_vFrete: TFMTBCDField
      FieldName = 'ite_vFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notite_vSeg: TFMTBCDField
      FieldName = 'ite_vSeg'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notite_vDesc: TFMTBCDField
      FieldName = 'ite_vDesc'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notite_vOutro: TFMTBCDField
      FieldName = 'ite_vOutro'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notite_IndTot: TIntegerField
      FieldName = 'ite_IndTot'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notite_vLucro: TFMTBCDField
      FieldName = 'ite_vLucro'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_notdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notite_xPed: TStringField
      FieldName = 'ite_xPed'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_item_notite_nItemPed: TIntegerField
      FieldName = 'ite_nItemPed'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notitp_item: TIntegerField
      FieldName = 'itp_item'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notite_pComissao: TFMTBCDField
      FieldName = 'ite_pComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
    object qr_item_notite_vComissao: TFMTBCDField
      FieldName = 'ite_vComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_item_notobr_id: TIntegerField
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_notite_vTotTrib: TFMTBCDField
      FieldName = 'ite_vTotTrib'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_item_of: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_of'
      'where iof_id = :_id')
    SQLConnection = db_Servico
    Left = 155
    Top = 720
    object qr_item_ofiof_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'iof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_oforf_id: TIntegerField
      FieldName = 'orf_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ofiof_item: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'iof_item'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ofpro_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_ofiof_qtda: TFMTBCDField
      DisplayLabel = 'Qtda'
      FieldName = 'iof_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_ofiof_lote: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'iof_lote'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_item_ofiof_pH: TStringField
      DisplayLabel = 'PH'
      FieldName = 'iof_pH'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_item_ofiof_tempo: TStringField
      DisplayLabel = 'Tempo'
      FieldName = 'iof_tempo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_item_ofiof_qtdre: TFMTBCDField
      DisplayLabel = 'Qtd realizada'
      FieldName = 'iof_qtdre'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_ofiof_perda: TFMTBCDField
      DisplayLabel = 'Perda'
      FieldName = 'iof_perda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
  end
  object qr_item_pis: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_pis'
      'where pis_id = :_id')
    SQLConnection = db_Servico
    Left = 286
    Top = 720
    object qr_item_pispis_id: TIntegerField
      FieldName = 'pis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_pisite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_pisnot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_pispis_cst: TStringField
      FieldName = 'pis_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_item_pispis_vBC: TFMTBCDField
      FieldName = 'pis_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_pispis_pPIS: TFMTBCDField
      FieldName = 'pis_pPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_pispis_vPIS: TFMTBCDField
      FieldName = 'pis_vPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_pispis_qBCProd: TFMTBCDField
      FieldName = 'pis_qBCProd'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_pispis_vAliqProd: TFMTBCDField
      FieldName = 'pis_vAliqProd'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_pispis_vBCST: TFMTBCDField
      FieldName = 'pis_vBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_pispis_pPISST: TFMTBCDField
      FieldName = 'pis_pPISST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_item_pispis_qBCProdST: TFMTBCDField
      FieldName = 'pis_qBCProdST'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_pispis_vAliqProdST: TFMTBCDField
      FieldName = 'pis_vAliqProdST'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qr_item_pispis_vPISST: TFMTBCDField
      FieldName = 'pis_vPISST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_pisite_atualiza: TStringField
      FieldName = 'ite_atualiza'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_pisdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_item_ser: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from item_ser'
      'where ise_id = :_id')
    SQLConnection = db_Servico
    Left = 440
    Top = 720
    object qr_item_serise_id: TIntegerField
      FieldName = 'ise_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_item_serser_id: TIntegerField
      FieldName = 'ser_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_serpro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_serise_qtda: TFMTBCDField
      FieldName = 'ise_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_serise_vUnit: TFMTBCDField
      FieldName = 'ise_vUnit'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_item_serise_vTotal: TFMTBCDField
      FieldName = 'ise_vTotal'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_item_serise_Tributa: TStringField
      FieldName = 'ise_Tributa'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_item_serdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_serped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_item_seritp_item: TIntegerField
      FieldName = 'itp_item'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_itemped: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from itemped'
      'where itp_id = :_id')
    SQLConnection = db_Servico
    Left = 592
    Top = 720
    object qr_itempeditp_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'itp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_itempedped_id: TIntegerField
      DisplayLabel = 'Id Pedido'
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempedrem_id: TIntegerField
      FieldName = 'rem_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_item: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'itp_item'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_posetm: TIntegerField
      FieldName = 'itp_posetm'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempedstp_codigo: TIntegerField
      FieldName = 'stp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempedpro_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempedpem_id: TIntegerField
      FieldName = 'pem_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_comple: TBlobField
      DisplayLabel = 'Complemento'
      FieldName = 'itp_comple'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_itempeditp_qtda: TFMTBCDField
      DisplayLabel = 'Qtda'
      FieldName = 'itp_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
    object qr_itempeditp_preco: TFMTBCDField
      DisplayLabel = 'Preco'
      FieldName = 'itp_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
    object qr_itempeditp_valmer: TFMTBCDField
      FieldName = 'itp_valmer'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_itempeditp_ipi: TFMTBCDField
      DisplayLabel = 'IPI'
      FieldName = 'itp_ipi'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_itempeditp_valipi: TFMTBCDField
      DisplayLabel = 'Valor IPI'
      FieldName = 'itp_valipi'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_itempeditp_valtot: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'itp_valtot'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_itempeditp_prazo_pcp: TSQLTimeStampField
      DisplayLabel = 'prazo pcp'
      FieldName = 'itp_prazo_pcp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_prazo_comp: TSQLTimeStampField
      DisplayLabel = 'prazo comp'
      FieldName = 'itp_prazo_comp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_cancel: TStringField
      DisplayLabel = 'Cancelar'
      FieldName = 'itp_cancel'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_itempeditp_compri: TIntegerField
      DisplayLabel = 'comprimento'
      FieldName = 'itp_compri'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_largura: TIntegerField
      DisplayLabel = 'largura'
      FieldName = 'itp_largura'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_estcom: TStringField
      FieldName = 'itp_estcom'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_itempedusu_codigo: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempedemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_pComissao: TFMTBCDField
      DisplayLabel = 'Comissao'
      FieldName = 'itp_pComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_itempeddat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_vComissao: TFMTBCDField
      DisplayLabel = 'Valor Comissao'
      FieldName = 'itp_vComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_itempeditp_pzEntrega: TSQLTimeStampField
      DisplayLabel = 'prazo Entrega'
      FieldName = 'itp_pzEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_vST: TFMTBCDField
      DisplayLabel = 'Valor ST'
      FieldName = 'itp_vST'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_vDesco: TFMTBCDField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'itp_vDesco'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_pDesco: TFMTBCDField
      DisplayLabel = 'Desconto'
      FieldName = 'itp_pDesco'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_vFrete: TFMTBCDField
      DisplayLabel = 'Valor Frete'
      FieldName = 'itp_vFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_vSeg: TFMTBCDField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'itp_vSeg'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_vDespe: TFMTBCDField
      DisplayLabel = 'Valor Despesa'
      FieldName = 'itp_vDespe'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_itempeditp_codOF: TIntegerField
      DisplayLabel = 'OF'
      FieldName = 'itp_codOF'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_caracte: TBlobField
      FieldName = 'itp_caracte'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_itempedobr_id: TIntegerField
      DisplayLabel = 'Obra'
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_reserva: TStringField
      FieldName = 'itp_reserva'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_itempeditp_faturar: TStringField
      FieldName = 'itp_faturar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_itempedsol_id: TIntegerField
      FieldName = 'sol_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_itempeditp_preco_tab: TFMTBCDField
      DisplayLabel = 'preco tabela'
      FieldName = 'itp_preco_tab'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_itempeditp_pDescoPreco: TFMTBCDField
      DisplayLabel = 'Desconto Preco'
      FieldName = 'itp_pDescoPreco'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_itempeditp_vDescoPreco: TFMTBCDField
      DisplayLabel = 'Valor Desconto Preco'
      FieldName = 'itp_vDescoPreco'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_itempeditp_licitaItem: TIntegerField
      FieldName = 'itp_licitaItem'
    end
    object qr_itempeditp_vale: TStringField
      FieldName = 'itp_vale'
      FixedChar = True
      Size = 1
    end
    object qr_itempedped_idOri: TIntegerField
      FieldName = 'ped_idOri'
    end
    object qr_itempeditp_itemOri: TIntegerField
      FieldName = 'itp_itemOri'
    end
    object qr_itempeditp_fatVale: TStringField
      FieldName = 'itp_fatVale'
      FixedChar = True
      Size = 1
    end
    object qr_itempeditp_qtda2: TFMTBCDField
      FieldName = 'itp_qtda2'
      Precision = 16
      Size = 4
    end
    object qr_itempeduni_codigo2: TStringField
      FieldName = 'uni_codigo2'
      FixedChar = True
      Size = 6
    end
    object qr_itempeditp_preco2: TFMTBCDField
      FieldName = 'itp_preco2'
      Precision = 16
      Size = 4
    end
  end
  object qr_lote: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from lote'
      'where lot_id = :_id')
    SQLConnection = db_Servico
    Left = 24
    Top = 800
    object qr_lotelot_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'lot_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_loteitp_id: TIntegerField
      FieldName = 'itp_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lotelot_qtda: TFMTBCDField
      DisplayLabel = 'Qtda'
      FieldName = 'lot_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_lotelot_lote: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'lot_lote'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_lotelot_dtFabricacao: TSQLTimeStampField
      DisplayLabel = 'Dt. Fabricacao'
      FieldName = 'lot_dtFabricacao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lotelot_dtValidade: TSQLTimeStampField
      DisplayLabel = 'D.t Validade'
      FieldName = 'lot_dtValidade'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lotelot_laudo: TStringField
      DisplayLabel = 'laudo'
      FieldName = 'lot_laudo'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_lotedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_loteite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lotepro_id: TIntegerField
      DisplayLabel = 'produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_loteorf_id: TIntegerField
      DisplayLabel = 'Ordem. Fab'
      FieldName = 'orf_id'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_lote_mov: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from lote_mov'
      'where ltm_id = :_id')
    SQLConnection = db_Servico
    Left = 152
    Top = 800
    object qr_lote_movltm_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ltm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_lote_movlot_id: TIntegerField
      FieldName = 'lot_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lote_movitp_id: TIntegerField
      FieldName = 'itp_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lote_movite_id: TIntegerField
      FieldName = 'ite_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lote_movltm_qtda: TFMTBCDField
      DisplayLabel = 'Qtda'
      FieldName = 'ltm_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_lote_movltm_tipo: TStringField
      FieldName = 'ltm_tipo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object qr_lote_movdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_lote_moviof_id: TIntegerField
      FieldName = 'iof_id'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_maquina: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from maquina'
      'where maq_id = :_id')
    SQLConnection = db_Servico
    Left = 304
    Top = 800
    object qr_maquinamaq_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'maq_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_maquinamaq_codigo: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'maq_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_maquinamaq_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'maq_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_maquinamaq_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'maq_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_maquinacontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_maquinadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_modbc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from modbc'
      'where mod_codigo = :_id')
    SQLConnection = db_Servico
    Left = 456
    Top = 800
    object qr_modbcmod_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mod_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_modbcmod_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'mod_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object qr_modbcst: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from modbcst'
      'where mod_codigo = :_id')
    SQLConnection = db_Servico
    Left = 592
    Top = 800
    object qr_modbcstmod_codigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'mod_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_modbcstmod_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'mod_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dsp_item_est: TDataSetProvider
    DataSet = qr_item_est
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_estBeforeUpdateRecord
    Left = 698
    Top = 552
  end
  object dsp_item_icms: TDataSetProvider
    DataSet = qr_item_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_icmsBeforeUpdateRecord
    Left = 93
    Top = 640
  end
  object dsp_item_ii: TDataSetProvider
    DataSet = qr_item_ii
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_iiBeforeUpdateRecord
    Left = 214
    Top = 640
  end
  object dsp_item_ipi: TDataSetProvider
    DataSet = qr_item_ipi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_ipiBeforeUpdateRecord
    Left = 353
    Top = 640
  end
  object dsp_item_issqn: TDataSetProvider
    DataSet = qr_item_issqn
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_issqnBeforeUpdateRecord
    Left = 518
    Top = 640
  end
  object dsp_item_med: TDataSetProvider
    DataSet = qr_item_med
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_medBeforeUpdateRecord
    Left = 688
    Top = 640
  end
  object dsp_item_not: TDataSetProvider
    DataSet = qr_item_not
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_notBeforeUpdateRecord
    Left = 92
    Top = 720
  end
  object dsp_item_of: TDataSetProvider
    DataSet = qr_item_of
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_ofBeforeUpdateRecord
    Left = 216
    Top = 720
  end
  object dsp_item_pis: TDataSetProvider
    DataSet = qr_item_pis
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_pisBeforeUpdateRecord
    Left = 352
    Top = 720
  end
  object dsp_item_ser: TDataSetProvider
    DataSet = qr_item_ser
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_item_serBeforeUpdateRecord
    Left = 512
    Top = 720
  end
  object dsp_itemped: TDataSetProvider
    DataSet = qr_itemped
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_itempedBeforeUpdateRecord
    Left = 664
    Top = 720
  end
  object dsp_lote: TDataSetProvider
    DataSet = qr_lote
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_loteBeforeUpdateRecord
    Left = 80
    Top = 800
  end
  object dsp_lote_mov: TDataSetProvider
    DataSet = qr_lote_mov
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_lote_movBeforeUpdateRecord
    Left = 224
    Top = 800
  end
  object dsp_maquina: TDataSetProvider
    DataSet = qr_maquina
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_maquinaBeforeUpdateRecord
    Left = 376
    Top = 800
  end
  object dsp_modbc: TDataSetProvider
    DataSet = qr_modbc
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_modbcBeforeUpdateRecord
    Left = 520
    Top = 800
  end
  object dsp_modbcst: TDataSetProvider
    DataSet = qr_modbcst
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_modbcstBeforeUpdateRecord
    Left = 680
    Top = 800
  end
  object qr_modnot: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from modnot'
      'where mnf_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 888
    object qr_modnotmnf_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'mnf_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_modnotmnf_codigo: TStringField
      DisplayLabel = 'codigo'
      FieldName = 'mnf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_modnotmnf_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'mnf_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_modnotcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_modnotdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_modnotmnf_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'mnf_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_modnotmnf_modelo: TStringField
      DisplayLabel = 'modelo'
      FieldName = 'mnf_modelo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object qr_motorca: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from motorca'
      'where mot_codigo = :_id')
    SQLConnection = db_Servico
    Left = 160
    Top = 888
    object qr_motorcamot_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'mot_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_motorcamot_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'mot_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_motorcamot_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'mot_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_motorcacontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_motorcadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_movobra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from movobra'
      'where mob_id = :_id')
    SQLConnection = db_Servico
    Left = 296
    Top = 888
    object qr_movobramob_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'mob_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_movobraemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobraobr_id: TIntegerField
      DisplayLabel = 'Obra'
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobranot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobradup_id: TIntegerField
      FieldName = 'dup_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobrapla_id: TIntegerField
      DisplayLabel = 'Plano de contas'
      FieldName = 'pla_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobrapro_id: TIntegerField
      DisplayLabel = 'produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobramob_data: TSQLTimeStampField
      DisplayLabel = 'data'
      FieldName = 'mob_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobramob_quantidade: TFMTBCDField
      DisplayLabel = 'quantidade'
      FieldName = 'mob_quantidade'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_movobramob_preco: TFMTBCDField
      DisplayLabel = 'preco'
      FieldName = 'mob_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_movobramob_valor: TFMTBCDField
      DisplayLabel = 'valor'
      FieldName = 'mob_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_movobramob_tipo: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'mob_tipo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_movobramob_obs: TBlobField
      DisplayLabel = 'obs'
      FieldName = 'mob_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_movobramob_docto: TStringField
      DisplayLabel = 'docto'
      FieldName = 'mob_docto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_movobradat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_nat_imp_cof: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from nat_imp_cof'
      'where cof_id = :_id')
    SQLConnection = db_Servico
    Left = 456
    Top = 888
    object qr_nat_imp_cofcof_id: TIntegerField
      FieldName = 'cof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_nat_imp_cofnat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_cofcof_cst: TStringField
      FieldName = 'cof_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_cofcof_esquema: TIntegerField
      FieldName = 'cof_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_cofcof_cstST: TStringField
      FieldName = 'cof_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_cofcof_esquemaST: TIntegerField
      FieldName = 'cof_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_cofcof_tpAliq: TIntegerField
      FieldName = 'cof_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_cofdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_cofemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_nat_imp_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from nat_imp_icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 627
    Top = 888
    object qr_nat_imp_icmsicm_id: TIntegerField
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_nat_imp_icmsnat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_cst: TStringField
      FieldName = 'icm_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_icmsicm_modBC: TIntegerField
      FieldName = 'icm_modBC'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_modBCST: TIntegerField
      FieldName = 'icm_modBCST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_esquema: TIntegerField
      FieldName = 'icm_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_esquemaST: TIntegerField
      FieldName = 'icm_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_tpAliq: TIntegerField
      FieldName = 'icm_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_icmsicm_csosn: TStringField
      FieldName = 'icm_csosn'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_nat_imp_icmsemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_nat_imp_ipi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from nat_imp_ipi'
      'where ipi_id = :_id')
    SQLConnection = db_Servico
    Left = 33
    Top = 984
    object qr_nat_imp_ipiipi_id: TIntegerField
      FieldName = 'ipi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_nat_imp_ipinat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_ipiipi_cst: TStringField
      FieldName = 'ipi_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_ipiipi_esquema: TIntegerField
      FieldName = 'ipi_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_ipiipi_tpAliq: TIntegerField
      FieldName = 'ipi_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_ipidat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_ipiemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_nat_imp_pis: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from nat_imp_pis'
      'where pis_id = :_id')
    SQLConnection = db_Servico
    Left = 201
    Top = 984
    object qr_nat_imp_pispis_id: TIntegerField
      FieldName = 'pis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_nat_imp_pisnat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_pispis_cst: TStringField
      FieldName = 'pis_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_pispis_esquema: TIntegerField
      FieldName = 'pis_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_pispis_cstST: TStringField
      FieldName = 'pis_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_nat_imp_pispis_esquemaST: TIntegerField
      FieldName = 'pis_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_pispis_tpAliq: TIntegerField
      FieldName = 'pis_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_pisdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nat_imp_pisemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_natfin: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from natfin'
      'where naf_codigo = :_id')
    SQLConnection = db_Servico
    Left = 361
    Top = 984
    object qr_natfinnaf_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'naf_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_natfinnaf_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'naf_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_natfinnaf_ctarec: TStringField
      DisplayLabel = 'contas a receber'
      FieldName = 'naf_ctarec'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_natfinnaf_ctapag: TStringField
      DisplayLabel = 'contas a pagar'
      FieldName = 'naf_ctapag'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_natfincontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_natfindat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_natfinnaf_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'naf_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_natura: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from natura'
      'where nat_codigo = :_id')
    SQLConnection = db_Servico
    Left = 488
    Top = 984
    object qr_naturanat_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_naturanat_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'nat_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object qr_naturanat_cfop: TStringField
      DisplayLabel = 'cfop'
      FieldName = 'nat_cfop'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object qr_naturanat_obs: TBlobField
      DisplayLabel = 'obs'
      FieldName = 'nat_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_naturanat_somaFat: TStringField
      DisplayLabel = 'Somar Faturamento?'
      FieldName = 'nat_somaFat'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_naturanat_uso: TStringField
      DisplayLabel = 'uso?'
      FieldName = 'nat_uso'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_naturadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_naturanat_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'nat_ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_naturanat_calculaST: TStringField
      DisplayLabel = 'calcula ST?'
      FieldName = 'nat_calculaST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_naturanat_permiteSN: TStringField
      DisplayLabel = 'permite SN?'
      FieldName = 'nat_permiteSN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_naturanat_opEntrada: TIntegerField
      DisplayLabel = 'Opera'#231#227'o de Entrada'
      FieldName = 'nat_opEntrada'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_notafi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from notafi'
      'where not_id = :_id')
    SQLConnection = db_Servico
    Left = 618
    Top = 984
    object qr_notafinot_id: TIntegerField
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_notafiemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_notafient_id: TIntegerField
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_notafinat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_notafistn_codigo: TIntegerField
      FieldName = 'stn_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_tpEmis: TIntegerField
      FieldName = 'not_tpEmis'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_finNFe: TIntegerField
      FieldName = 'not_finNFe'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_transp: TIntegerField
      FieldName = 'not_transp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_entrega: TIntegerField
      FieldName = 'not_entrega'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_retirada: TIntegerField
      FieldName = 'not_retirada'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_modFrete: TIntegerField
      FieldName = 'not_modFrete'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_modelo: TStringField
      FieldName = 'not_modelo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_notafinot_serie: TStringField
      FieldName = 'not_serie'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_notafinot_numero: TIntegerField
      FieldName = 'not_numero'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_notafiart_codigo: TIntegerField
      FieldName = 'art_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_datemi: TSQLTimeStampField
      FieldName = 'not_datemi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_datdup: TSQLTimeStampField
      FieldName = 'not_datdup'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_refNFe: TStringField
      FieldName = 'not_refNFe'
      ProviderFlags = [pfInUpdate]
      Size = 44
    end
    object qr_notafinot_datsai: TSQLTimeStampField
      FieldName = 'not_datsai'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_entsai: TStringField
      FieldName = 'not_entsai'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_vBC: TFMTBCDField
      FieldName = 'not_vBC'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vIcms: TFMTBCDField
      FieldName = 'not_vIcms'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vBCST: TFMTBCDField
      FieldName = 'not_vBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vST: TFMTBCDField
      FieldName = 'not_vST'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vProd: TFMTBCDField
      FieldName = 'not_vProd'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vFrete: TFMTBCDField
      FieldName = 'not_vFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vSeg: TFMTBCDField
      FieldName = 'not_vSeg'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vDesc: TFMTBCDField
      FieldName = 'not_vDesc'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vII: TFMTBCDField
      FieldName = 'not_vII'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vIPI: TFMTBCDField
      FieldName = 'not_vIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vPIS: TFMTBCDField
      FieldName = 'not_vPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vCofins: TFMTBCDField
      FieldName = 'not_vCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vOutro: TFMTBCDField
      FieldName = 'not_vOutro'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vNF: TFMTBCDField
      FieldName = 'not_vNF'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vServ: TFMTBCDField
      FieldName = 'not_vServ'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vBCISS: TFMTBCDField
      FieldName = 'not_vBCISS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vISS: TFMTBCDField
      FieldName = 'not_vISS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vServPIS: TFMTBCDField
      FieldName = 'not_vServPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vServCofins: TFMTBCDField
      FieldName = 'not_vServCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vRetPIS: TFMTBCDField
      FieldName = 'not_vRetPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vRetCofins: TFMTBCDField
      FieldName = 'not_vRetCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vRetCSLL: TFMTBCDField
      FieldName = 'not_vRetCSLL'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vBCIrrf: TFMTBCDField
      FieldName = 'not_vBCIrrf'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vIrrf: TFMTBCDField
      FieldName = 'not_vIrrf'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vBCRetPrev: TFMTBCDField
      FieldName = 'not_vBCRetPrev'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vRetPrev: TFMTBCDField
      FieldName = 'not_vRetPrev'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vEntrada: TFMTBCDField
      FieldName = 'not_vEntrada'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_notafinot_avista: TStringField
      FieldName = 'not_avista'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_obs: TBlobField
      FieldName = 'not_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_notafinot_obsSimples: TBlobField
      FieldName = 'not_obsSimples'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_notafinot_nFat: TStringField
      FieldName = 'not_nFat'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_notafinot_vOrig: TFMTBCDField
      FieldName = 'not_vOrig'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vDescFat: TFMTBCDField
      FieldName = 'not_vDescFat'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vLiq: TFMTBCDField
      FieldName = 'not_vLiq'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_veicPlaca: TStringField
      FieldName = 'not_veicPlaca'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_notafinot_veicUF: TStringField
      FieldName = 'not_veicUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_notafinot_nProt: TStringField
      FieldName = 'not_nProt'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_notafinot_chNFe: TStringField
      FieldName = 'not_chNFe'
      ProviderFlags = [pfInUpdate]
      Size = 44
    end
    object qr_notafidat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_msgAuto: TStringField
      FieldName = 'not_msgAuto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_atualizaVal: TStringField
      FieldName = 'not_atualizaVal'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_envioXML: TStringField
      FieldName = 'not_envioXML'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_tpAmb: TIntegerField
      FieldName = 'not_tpAmb'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_notafinot_XMLKiron: TStringField
      FieldName = 'not_XMLKiron'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_pCredSN: TFMTBCDField
      FieldName = 'not_pCredSN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_vCredICMSSN: TFMTBCDField
      FieldName = 'not_vCredICMSSN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_notafinot_ChaveCompl: TStringField
      FieldName = 'not_ChaveCompl'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object qr_notafinot_xLocEmbarq: TStringField
      FieldName = 'not_xLocEmbarq'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_notafinot_UFEmbarq: TStringField
      FieldName = 'not_UFEmbarq'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_notafinot_proprio: TStringField
      FieldName = 'not_proprio'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_datlan: TSQLTimeStampField
      FieldName = 'not_datlan'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafimnf_codigo: TStringField
      FieldName = 'mnf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_notafinot_estoque: TStringField
      FieldName = 'not_estoque'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafiven_codigo: TIntegerField
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_vbConsumidor: TStringField
      FieldName = 'not_vbConsumidor'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_vbNome: TStringField
      FieldName = 'not_vbNome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_notafinot_vbContato: TStringField
      FieldName = 'not_vbContato'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_notafinot_desc_conpag: TStringField
      FieldName = 'not_desc_conpag'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_notafinot_dtColeta: TSQLTimeStampField
      FieldName = 'not_dtColeta'
      ProviderFlags = [pfInUpdate]
    end
    object qr_notafinot_xmlNFe: TBlobField
      FieldName = 'not_xmlNFe'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_notafinot_cfopAuto: TStringField
      FieldName = 'not_cfopAuto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_xmlWS: TStringField
      FieldName = 'not_xmlWS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_notafinot_vTotTrib: TFMTBCDField
      FieldName = 'not_vTotTrib'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_obra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from obra'
      'where obr_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1064
    object qr_obraobr_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_obraemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraent_id: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_status: TStringField
      DisplayLabel = 'Status'
      FieldName = 'obr_status'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_obraobr_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'obr_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_dtInicio: TSQLTimeStampField
      DisplayLabel = 'Dt. Inicio'
      FieldName = 'obr_dtInicio'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_dtFim: TSQLTimeStampField
      DisplayLabel = 'Dt. Fim'
      FieldName = 'obr_dtFim'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_Servico: TBlobField
      DisplayLabel = 'Servico'
      FieldName = 'obr_Servico'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_obraobr_detalhe: TBlobField
      DisplayLabel = 'detalhe'
      FieldName = 'obr_detalhe'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_obraobr_vEstimado: TFMTBCDField
      DisplayLabel = 'Valor Estimado'
      FieldName = 'obr_vEstimado'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_obraobr_tmpEstimado: TStringField
      DisplayLabel = 'Tempo Estimado'
      FieldName = 'obr_tmpEstimado'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_obs: TBlobField
      DisplayLabel = 'Obs'
      FieldName = 'obr_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_obraobr_endereco: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'obr_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_obraobr_numero: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'obr_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_obraobr_comple: TStringField
      DisplayLabel = 'complemento'
      FieldName = 'obr_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_obraobr_bairro: TStringField
      DisplayLabel = 'bairro'
      FieldName = 'obr_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_obraobr_cidade: TStringField
      DisplayLabel = 'cidade'
      FieldName = 'obr_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_obraobr_cep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'obr_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_obrauf_codigo: TStringField
      DisplayLabel = 'uf'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_obraobr_fone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'obr_fone'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_obraobr_contato: TStringField
      DisplayLabel = 'contato'
      FieldName = 'obr_contato'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_obraobr_email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'obr_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_obradat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_obraobr_vVenda: TFMTBCDField
      DisplayLabel = 'Valor Venda'
      FieldName = 'obr_vVenda'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
  end
  object qr_ordfab: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ordfab'
      'where orf_id = :_id')
    SQLConnection = db_Servico
    Left = 144
    Top = 1064
    object qr_ordfaborf_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'orf_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_ordfabemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_data: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'orf_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfabped_id: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfabitp_item: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'itp_item'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfabpro_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_qtda: TFMTBCDField
      DisplayLabel = 'qtda'
      FieldName = 'orf_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_ordfaborf_qtdaprod: TFMTBCDField
      DisplayLabel = 'qtda produzida'
      FieldName = 'orf_qtdaprod'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_ordfaborf_prazo: TSQLTimeStampField
      DisplayLabel = 'prazo'
      FieldName = 'orf_prazo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_revisao: TStringField
      DisplayLabel = 'revisao'
      FieldName = 'orf_revisao'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_ordfaborf_dtRevi: TSQLTimeStampField
      DisplayLabel = 'Dt. Revisao'
      FieldName = 'orf_dtRevi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_pH: TStringField
      DisplayLabel = 'pH'
      FieldName = 'orf_pH'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_ordfaborf_tempo: TStringField
      DisplayLabel = 'tempo'
      FieldName = 'orf_tempo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_ordfaborf_pedcli: TStringField
      DisplayLabel = 'pedido cliente'
      FieldName = 'orf_pedcli'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_datfab: TSQLTimeStampField
      DisplayLabel = 'Dt. fab'
      FieldName = 'orf_datfab'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfabdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt.inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfabmaq_id: TIntegerField
      DisplayLabel = 'maquina'
      FieldName = 'maq_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ordfaborf_obs: TBlobField
      DisplayLabel = 'obs'
      FieldName = 'orf_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object qr_oripro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from oripro'
      'where orp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 272
    Top = 1064
    object qr_oriproorp_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'orp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_oriproorp_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'orp_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_oriprodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_oriproorp_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'orp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_otb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from otb'
      'where otb_id = :_id')
    SQLConnection = db_Servico
    Left = 384
    Top = 1064
    object qr_otbotb_id: TIntegerField
      FieldName = 'otb_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_otbemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_otbotb_ano: TStringField
      FieldName = 'otb_ano'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 4
    end
    object qr_otbotb_vFatura01: TFMTBCDField
      FieldName = 'otb_vFatura01'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura02: TFMTBCDField
      FieldName = 'otb_vFatura02'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura03: TFMTBCDField
      FieldName = 'otb_vFatura03'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura04: TFMTBCDField
      FieldName = 'otb_vFatura04'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura05: TFMTBCDField
      FieldName = 'otb_vFatura05'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura06: TFMTBCDField
      FieldName = 'otb_vFatura06'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura07: TFMTBCDField
      FieldName = 'otb_vFatura07'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura08: TFMTBCDField
      FieldName = 'otb_vFatura08'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura09: TFMTBCDField
      FieldName = 'otb_vFatura09'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura10: TFMTBCDField
      FieldName = 'otb_vFatura10'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura11: TFMTBCDField
      FieldName = 'otb_vFatura11'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_vFatura12: TFMTBCDField
      FieldName = 'otb_vFatura12'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbotb_media: TFMTBCDField
      FieldName = 'otb_media'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_otbdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_pais: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pais'
      'where pai_codigo = :_id')
    SQLConnection = db_Servico
    Left = 496
    Top = 1064
    object qr_paispai_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'pai_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_paispai_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'pai_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_paisdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_paispai_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'pai_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_modnot: TDataSetProvider
    DataSet = qr_modnot
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_modnotBeforeUpdateRecord
    Left = 94
    Top = 888
  end
  object dsp_motorca: TDataSetProvider
    DataSet = qr_motorca
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_motorcaBeforeUpdateRecord
    Left = 224
    Top = 888
  end
  object dsp_movobra: TDataSetProvider
    DataSet = qr_movobra
    BeforeUpdateRecord = dsp_movobraBeforeUpdateRecord
    Left = 368
    Top = 888
  end
  object dsp_nat_imp_cof: TDataSetProvider
    DataSet = qr_nat_imp_cof
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_nat_imp_cofBeforeUpdateRecord
    Left = 539
    Top = 888
  end
  object dsp_nat_imp_icms: TDataSetProvider
    DataSet = qr_nat_imp_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_nat_imp_icmsBeforeUpdateRecord
    Left = 716
    Top = 888
  end
  object dsp_nat_imp_ipi: TDataSetProvider
    DataSet = qr_nat_imp_ipi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_nat_imp_ipiBeforeUpdateRecord
    Left = 115
    Top = 984
  end
  object dsp_nat_imp_pis: TDataSetProvider
    DataSet = qr_nat_imp_pis
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_nat_imp_pisBeforeUpdateRecord
    Left = 286
    Top = 984
  end
  object dsp_natfin: TDataSetProvider
    DataSet = qr_natfin
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_natfinBeforeUpdateRecord
    Left = 416
    Top = 984
  end
  object dsp_natura: TDataSetProvider
    DataSet = qr_natura
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_naturaBeforeUpdateRecord
    Left = 545
    Top = 984
  end
  object dsp_notafi: TDataSetProvider
    DataSet = qr_notafi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_notafiBeforeUpdateRecord
    Left = 686
    Top = 984
  end
  object dsp_obra: TDataSetProvider
    DataSet = qr_obra
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_obraBeforeUpdateRecord
    Left = 82
    Top = 1064
  end
  object dsp_ordfab: TDataSetProvider
    DataSet = qr_ordfab
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ordfabBeforeUpdateRecord
    Left = 200
    Top = 1064
  end
  object dsp_oripro: TDataSetProvider
    DataSet = qr_oripro
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_oriproBeforeUpdateRecord
    Left = 328
    Top = 1064
  end
  object dsp_otb: TDataSetProvider
    DataSet = qr_otb
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_otbBeforeUpdateRecord
    Left = 440
    Top = 1064
  end
  object dsp_pais: TDataSetProvider
    DataSet = qr_pais
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_paisBeforeUpdateRecord
    Left = 547
    Top = 1064
  end
  object qr_pedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pedido'
      'where ped_id = :_id')
    SQLConnection = db_Servico
    Left = 608
    Top = 1064
    object qr_pedidoped_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pedidoemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidoent_id: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidotpp_codigo: TIntegerField
      FieldName = 'tpp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'Tipo de Pedido'
    end
    object qr_pedidoven_codigo: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidofip_codigo: TIntegerField
      FieldName = 'fip_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidosdp_codigo: TIntegerField
      DisplayLabel = 'Situa'#231#227'o da duplicata'
      FieldName = 'sdp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoban_codigo: TIntegerField
      DisplayLabel = 'Codigo bancario'
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_tipo: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'ped_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_pedidoped_transp: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'ped_transp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_numero: TIntegerField
      DisplayLabel = 'numero'
      FieldName = 'ped_numero'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidoped_datemi: TSQLTimeStampField
      DisplayLabel = 'dt. emiss'#227'o'
      FieldName = 'ped_datemi'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidoped_valmer: TFMTBCDField
      DisplayLabel = 'valor mercadoria'
      FieldName = 'ped_valmer'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_pedidoped_valipi: TFMTBCDField
      DisplayLabel = 'Valor ipi'
      FieldName = 'ped_valipi'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_pedidoped_valdesc: TFMTBCDField
      DisplayLabel = 'Valor desconto'
      FieldName = 'ped_valdesc'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_pedidoped_valdesp: TIntegerField
      DisplayLabel = 'valor despesas'
      FieldName = 'ped_valdesp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_valtot: TFMTBCDField
      DisplayLabel = 'Valor total'
      FieldName = 'ped_valtot'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_pedidoped_frete: TIntegerField
      DisplayLabel = 'frete'
      FieldName = 'ped_frete'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_cancel: TStringField
      DisplayLabel = 'cancelado'
      FieldName = 'ped_cancel'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedidoped_pedcli: TStringField
      FieldName = 'ped_pedcli'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedidoped_datdup: TSQLTimeStampField
      DisplayLabel = 'dt. duplicata'
      FieldName = 'ped_datdup'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_vEntrada: TFMTBCDField
      DisplayLabel = 'Valor Entrada'
      FieldName = 'ped_vEntrada'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pedidoped_aVista: TStringField
      DisplayLabel = 'a Vista?'
      FieldName = 'ped_aVista'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedidostp_codigo: TIntegerField
      FieldName = 'stp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_obs: TBlobField
      DisplayLabel = 'obs'
      FieldName = 'ped_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_pedidoped_pzEntrega: TSQLTimeStampField
      DisplayLabel = 'Prazo Entrega'
      FieldName = 'ped_pzEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_dtEntregue: TSQLTimeStampField
      DisplayLabel = 'Dt. Entregue'
      FieldName = 'ped_dtEntregue'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_pzProducao: TSQLTimeStampField
      DisplayLabel = 'Prazo Producao'
      FieldName = 'ped_pzProducao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_dtProducao: TSQLTimeStampField
      DisplayLabel = 'dt. Producao'
      FieldName = 'ped_dtProducao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_entEnde: TStringField
      DisplayLabel = 'Endere'#231'o entrega'
      FieldName = 'ped_entEnde'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_entNume: TStringField
      DisplayLabel = 'numero entrega'
      FieldName = 'ped_entNume'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_entComp: TStringField
      DisplayLabel = 'complemento de entrega'
      FieldName = 'ped_entComp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_entBair: TStringField
      DisplayLabel = 'bairro entrega'
      FieldName = 'ped_entBair'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_entCida: TStringField
      DisplayLabel = 'cidade entrega'
      FieldName = 'ped_entCida'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_entUF: TStringField
      DisplayLabel = 'UF entrega'
      FieldName = 'ped_entUF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_pedidoped_entCep: TStringField
      DisplayLabel = 'Cep entrega'
      FieldName = 'ped_entCep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_pedidoped_vST: TFMTBCDField
      DisplayLabel = 'Valor ST'
      FieldName = 'ped_vST'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedidoped_block: TStringField
      DisplayLabel = 'Bloqueado?'
      FieldName = 'ped_block'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedidoped_vFrete: TFMTBCDField
      DisplayLabel = 'Valor Frete'
      FieldName = 'ped_vFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedidoped_vSeg: TFMTBCDField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'ped_vSeg'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedidoped_desc_conpag: TStringField
      FieldName = 'ped_desc_conpag'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_orcNumero: TIntegerField
      DisplayLabel = 'Or'#231'amento Numero'
      FieldName = 'ped_orcNumero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_orcNome: TStringField
      FieldName = 'ped_orcNome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_orcFone: TStringField
      FieldName = 'ped_orcFone'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_pedidoped_orcEmail: TStringField
      FieldName = 'ped_orcEmail'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_pedidoped_orcContato: TStringField
      FieldName = 'ped_orcContato'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_pedidoped_orcPedido: TStringField
      FieldName = 'ped_orcPedido'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedidoped_email_enviado: TSQLTimeStampField
      FieldName = 'ped_email_enviado'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_entHorario: TStringField
      FieldName = 'ped_entHorario'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pedidoped_validade: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'ped_validade'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_pedidoped_descPrazo: TStringField
      DisplayLabel = 'Descri'#231'ao Prazo'
      FieldName = 'ped_descPrazo'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_pedidomot_codigo: TIntegerField
      FieldName = 'mot_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_usu_block: TIntegerField
      FieldName = 'ped_usu_block'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedidoped_numeroRC: TStringField
      DisplayLabel = 'numero RC'
      FieldName = 'ped_numeroRC'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_pedido: TDataSetProvider
    DataSet = qr_pedido
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pedidoBeforeUpdateRecord
    Left = 680
    Top = 1064
  end
  object qr_pis: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pis'
      'where pis_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1136
    object qr_pispis_id: TIntegerField
      FieldName = 'pis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pispis_pPIS: TFMTBCDField
      FieldName = 'pis_pPIS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 7
      Size = 2
    end
    object qr_pisdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_plano: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from plano'
      'where pla_id = :_id')
    SQLConnection = db_Servico
    Left = 141
    Top = 1137
    object qr_planopla_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'pla_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_planopla_codigo: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'pla_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object qr_planopla_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'pla_nome'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object qr_planopla_tipo: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'pla_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_planodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_planopla_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'pla_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_planopla_despVar: TStringField
      FieldName = 'pla_despVar'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_prod_aliq_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_aliq_icms'
      'where icm_id = :_id')
    SQLConnection = db_Servico
    Left = 266
    Top = 1138
    object qr_prod_aliq_icmsicm_id: TIntegerField
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_aliq_icmspro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_aliq_icmsicm_ufOrig: TStringField
      FieldName = 'icm_ufOrig'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_ufDest: TStringField
      FieldName = 'icm_ufDest'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pICMS: TFMTBCDField
      FieldName = 'icm_pICMS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pICMSFrete: TFMTBCDField
      FieldName = 'icm_pICMSFrete'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pDifere: TFMTBCDField
      FieldName = 'icm_pDifere'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pICMSST: TFMTBCDField
      FieldName = 'icm_pICMSST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pBC: TFMTBCDField
      FieldName = 'icm_pBC'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pRedBC: TFMTBCDField
      FieldName = 'icm_pRedBC'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_vPauta: TFMTBCDField
      FieldName = 'icm_vPauta'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pBCST: TFMTBCDField
      FieldName = 'icm_pBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pRedBCST: TFMTBCDField
      FieldName = 'icm_pRedBCST'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pIVA: TFMTBCDField
      FieldName = 'icm_pIVA'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_vPautaST: TFMTBCDField
      FieldName = 'icm_vPautaST'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pOperaPro: TFMTBCDField
      FieldName = 'icm_pOperaPro'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_aliq_icmsicm_pBCSN: TFMTBCDField
      FieldName = 'icm_pBCSN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pRedBCSN: TFMTBCDField
      FieldName = 'icm_pRedBCSN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pBCSTSN: TFMTBCDField
      FieldName = 'icm_pBCSTSN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pRedBCSTSN: TFMTBCDField
      FieldName = 'icm_pRedBCSTSN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_prod_aliq_icmsnat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_aliq_icmsemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_aliq_icmsicm_pICMSIntra: TFMTBCDField
      FieldName = 'icm_pICMSIntra'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_prod_aliq_icmsicm_conFinalDest: TStringField
      FieldName = 'icm_conFinalDest'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_prod_aliq_icmsicm_simplesDest: TStringField
      FieldName = 'icm_simplesDest'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_prod_aliq_icmsicm_contrICMS: TStringField
      FieldName = 'icm_contrICMS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_prod_aliq_icmsicm_cst_icms: TStringField
      FieldName = 'icm_cst_icms'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_cst_ipi: TStringField
      FieldName = 'icm_cst_ipi'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_cst_pis: TStringField
      FieldName = 'icm_cst_pis'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_cst_cof: TStringField
      FieldName = 'icm_cst_cof'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_aliq_icmsicm_csosn: TStringField
      FieldName = 'icm_csosn'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_prod_aliq_icmsicm_pIVAAjustado: TFMTBCDField
      FieldName = 'icm_pIVAAjustado'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_prod_aliq_icmsicm_pIVARedSN: TFMTBCDField
      FieldName = 'icm_pIVARedSN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
  end
  object qr_prod_comp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_comp'
      'where pco_id = :_id')
    SQLConnection = db_Servico
    Left = 450
    Top = 1139
    object qr_prod_comppco_id: TIntegerField
      FieldName = 'pco_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_comppco_item: TIntegerField
      FieldName = 'pco_item'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_comppro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_comppco_matpri: TIntegerField
      FieldName = 'pco_matpri'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_comppco_qtda: TFMTBCDField
      FieldName = 'pco_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 5
    end
  end
  object qr_prod_emba: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_emba'
      'where pem_id = :_id')
    SQLConnection = db_Servico
    Left = 611
    Top = 1139
    object qr_prod_embapem_id: TIntegerField
      FieldName = 'pem_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_embapro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_embaemb_codigo: TStringField
      FieldName = 'emb_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object qr_prod_embauni_codigo: TStringField
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qr_prod_embapem_qtda: TFMTBCDField
      FieldName = 'pem_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_prod_embapem_preven: TFMTBCDField
      FieldName = 'pem_preven'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 3
    end
    object qr_prod_embapem_pesliq: TFMTBCDField
      FieldName = 'pem_pesliq'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_prod_embapem_pesbru: TFMTBCDField
      FieldName = 'pem_pesbru'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
  end
  object qr_prod_imp_cof: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_imp_cof'
      'where  cof_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1216
    object qr_prod_imp_cofcof_id: TIntegerField
      FieldName = 'cof_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_imp_cofpro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_imp_cofcof_cst: TStringField
      FieldName = 'cof_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_cofcof_esquema: TIntegerField
      FieldName = 'cof_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_cofcof_cstST: TStringField
      FieldName = 'cof_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_cofcof_esquemaST: TIntegerField
      FieldName = 'cof_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_cofcof_tpAliq: TIntegerField
      FieldName = 'cof_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_cofdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_prod_imp_icms: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_imp_icms'
      'where  icm_id = :_id')
    SQLConnection = db_Servico
    Left = 222
    Top = 1216
    object qr_prod_imp_icmsicm_id: TIntegerField
      FieldName = 'icm_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_imp_icmspro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_imp_icmsicm_cst: TStringField
      FieldName = 'icm_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_icmsicm_modBC: TIntegerField
      FieldName = 'icm_modBC'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsicm_modBCST: TIntegerField
      FieldName = 'icm_modBCST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsicm_esquema: TIntegerField
      FieldName = 'icm_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsicm_esquemaST: TIntegerField
      FieldName = 'icm_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsicm_tpAliq: TIntegerField
      FieldName = 'icm_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_icmsicm_csosn: TStringField
      FieldName = 'icm_csosn'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object qr_prod_imp_ipi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_imp_ipi'
      'where  ipi_id = :_id')
    SQLConnection = db_Servico
    Left = 429
    Top = 1216
    object qr_prod_imp_ipiipi_id: TIntegerField
      FieldName = 'ipi_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_imp_ipipro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_imp_ipiipi_cst: TStringField
      FieldName = 'ipi_cst'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_ipiipi_esquema: TIntegerField
      FieldName = 'ipi_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_ipiipi_tpAliq: TIntegerField
      FieldName = 'ipi_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_ipidat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_prod_imp_pis: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_imp_pis'
      'where  pis_id = :_id')
    SQLConnection = db_Servico
    Left = 613
    Top = 1216
    object qr_prod_imp_pispis_id: TIntegerField
      FieldName = 'pis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_imp_pispro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_imp_pispis_cst: TStringField
      FieldName = 'pis_cst'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_pispis_esquema: TIntegerField
      FieldName = 'pis_esquema'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_pispis_cstST: TStringField
      FieldName = 'pis_cstST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_prod_imp_pispis_esquemaST: TIntegerField
      FieldName = 'pis_esquemaST'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_pispis_tpAliq: TIntegerField
      FieldName = 'pis_tpAliq'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_imp_pisdat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_prod_similar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_similar'
      'where  prs_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1297
    object qr_prod_similarprs_id: TIntegerField
      FieldName = 'prs_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_similarpro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_similarent_cnpj: TStringField
      FieldName = 'ent_cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_prod_similarent_nome: TStringField
      FieldName = 'ent_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_prod_similarprs_codigo: TStringField
      FieldName = 'prs_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_similarprs_cBarras: TStringField
      FieldName = 'prs_cBarras'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_prod_similarprs_nome: TStringField
      FieldName = 'prs_nome'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object qr_prod_similarncm_codigo: TStringField
      FieldName = 'ncm_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_prod_similaruni_codigo: TStringField
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_prod_similarprs_preco: TFMTBCDField
      FieldName = 'prs_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
    object qr_prod_similardat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_prod_tabprec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_tabprec'
      'where ptp_id = :_id')
    SQLConnection = db_Servico
    Left = 197
    Top = 1297
    object qr_prod_tabprecptp_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ptp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_tabprecpro_id: TIntegerField
      DisplayLabel = 'produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_tabprectbp_codigo: TIntegerField
      DisplayLabel = 'codigo da tabela'
      FieldName = 'tbp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_prod_tabprecptp_preco: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'ptp_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
  end
  object qr_produto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from produto'
      'where  pro_id = :_id')
    SQLConnection = db_Servico
    Left = 364
    Top = 1297
    object qr_produtopro_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_produtoorp_codigo: TIntegerField
      FieldName = 'orp_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_produtopro_codigo: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'pro_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_produtopro_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'pro_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 120
    end
    object qr_produtouni_codigo: TStringField
      DisplayLabel = 'Unidade '
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qr_produtopro_preco: TFMTBCDField
      DisplayLabel = 'preco'
      FieldName = 'pro_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 23
      Size = 10
    end
    object qr_produtodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_produtopro_ativo: TStringField
      DisplayLabel = 'Ativo?'
      FieldName = 'pro_ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_produtoncm_codigo: TStringField
      DisplayLabel = 'ncm'
      FieldName = 'ncm_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object qr_produtopro_pesoliq: TFMTBCDField
      DisplayLabel = 'peso liquido'
      FieldName = 'pro_pesoliq'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_produtopro_pesobru: TFMTBCDField
      DisplayLabel = 'peso bruto'
      FieldName = 'pro_pesobru'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_produtopro_utiliza: TStringField
      DisplayLabel = 'Utiliza?'
      FieldName = 'pro_utiliza'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_produtopro_cfopF: TIntegerField
      DisplayLabel = 'cfop Fora '
      FieldName = 'pro_cfopF'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_cfopD: TIntegerField
      DisplayLabel = 'Cfop Dentro'
      FieldName = 'pro_cfopD'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_cEAN: TStringField
      DisplayLabel = 'EAN'
      FieldName = 'pro_cEAN'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_produtogrp_id: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_produtopro_sdInicial: TFMTBCDField
      DisplayLabel = 'Saldo Inicial'
      FieldName = 'pro_sdInicial'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_sdAtual: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'pro_sdAtual'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_estoque: TStringField
      DisplayLabel = 'Estoque'
      FieldName = 'pro_estoque'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_produtopro_estmin: TFMTBCDField
      DisplayLabel = 'Estoque Minimo'
      FieldName = 'pro_estmin'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_estmax: TFMTBCDField
      DisplayLabel = 'Estoque Maximo'
      FieldName = 'pro_estmax'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_servico: TStringField
      DisplayLabel = 'Servi'#231'o?'
      FieldName = 'pro_servico'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_produtopro_unical: TStringField
      FieldName = 'pro_unical'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_produtopro_precom: TFMTBCDField
      FieldName = 'pro_precom'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
    object qr_produtopro_fator: TIntegerField
      DisplayLabel = 'fator'
      FieldName = 'pro_fator'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_peso: TFMTBCDField
      DisplayLabel = 'peso'
      FieldName = 'pro_peso'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_produtopro_validade: TIntegerField
      DisplayLabel = 'validade'
      FieldName = 'pro_validade'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_refere: TStringField
      DisplayLabel = 'referencia'
      FieldName = 'pro_refere'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_produtopro_densi: TFMTBCDField
      DisplayLabel = 'Densidade'
      FieldName = 'pro_densi'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 3
    end
    object qr_produtopro_onu: TStringField
      FieldName = 'pro_onu'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object qr_produtopro_risco: TStringField
      FieldName = 'pro_risco'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_produtopro_preparo: TBlobField
      FieldName = 'pro_preparo'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_produtopro_pComissao: TFMTBCDField
      DisplayLabel = 'Comissao'
      FieldName = 'pro_pComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
    object qr_produtopro_revisao: TStringField
      DisplayLabel = 'revisao'
      FieldName = 'pro_revisao'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_produtopro_datrevisao: TSQLTimeStampField
      DisplayLabel = 'data revisao'
      FieldName = 'pro_datrevisao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_pDesco: TFMTBCDField
      DisplayLabel = 'Desconto'
      FieldName = 'pro_pDesco'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_produtopro_fatorDiv: TFMTBCDField
      DisplayLabel = 'fator Divis'#227'o'
      FieldName = 'pro_fatorDiv'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
    object qr_produtotpr_codigo: TIntegerField
      FieldName = 'tpr_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_qtdUN: TFMTBCDField
      DisplayLabel = 'qtd UN'
      FieldName = 'pro_qtdUN'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_embaUN: TStringField
      DisplayLabel = 'Embalagem UN'
      FieldName = 'pro_embaUN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_produtopro_qtdRese: TFMTBCDField
      DisplayLabel = 'qtd Reservada'
      FieldName = 'pro_qtdRese'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_sdDispo: TFMTBCDField
      DisplayLabel = 'saldo Disponivel'
      FieldName = 'pro_sdDispo'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_produtopro_obsAdicional: TBlobField
      DisplayLabel = 'obs Adicional'
      FieldName = 'pro_obsAdicional'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_produtopro_pMargem: TFMTBCDField
      DisplayLabel = 'Margem'
      FieldName = 'pro_pMargem'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_produtopro_cBarras: TStringField
      DisplayLabel = 'Barras'
      FieldName = 'pro_cBarras'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_produtopro_foto: TBlobField
      DisplayLabel = 'foto'
      FieldName = 'pro_foto'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_produtopro_qBase: TFMTBCDField
      DisplayLabel = 'Base'
      FieldName = 'pro_qBase'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_produtopro_unOrigem: TStringField
      DisplayLabel = 'un Origem'
      FieldName = 'pro_unOrigem'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_produtopro_qOrigem: TFMTBCDField
      DisplayLabel = 'Origem'
      FieldName = 'pro_qOrigem'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_produtopro_idProdEstoque: TIntegerField
      DisplayLabel = 'Id Prod Estoque'
      FieldName = 'pro_idProdEstoque'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_comple: TBlobField
      DisplayLabel = 'complemento'
      FieldName = 'pro_comple'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_produtopro_RevisaoEspe: TStringField
      DisplayLabel = 'Revisao Espe'
      FieldName = 'pro_RevisaoEspe'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_produtopro_DatRevisaoEspe: TSQLTimeStampField
      DisplayLabel = 'Data Revisao Espe'
      FieldName = 'pro_DatRevisaoEspe'
      ProviderFlags = [pfInUpdate]
    end
    object qr_produtopro_Marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'pro_Marca'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_produtopro_Fabricante: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'pro_Fabricante'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object qr_ramati: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from ramati'
      'where rat_codigo = :_id')
    SQLConnection = db_Servico
    Left = 648
    Top = 1297
    object qr_ramatirat_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'rat_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_ramatirat_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'rat_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_ramatirat_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'rat_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_ramaticontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_ramatidat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_reg_deletado: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from reg_deletado'
      'where id = :_id')
    SQLConnection = db_Servico
    Left = 738
    Top = 1369
    object qr_reg_deletadoid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_reg_deletadomotivo: TBlobField
      FieldName = 'motivo'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_reg_deletadodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_sequencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from sequencia'
      'where seq_id = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1368
    object qr_sequenciaseq_id: TIntegerField
      FieldName = 'seq_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_sequenciaseq_tabela: TStringField
      FieldName = 'seq_tabela'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_sequenciaseq_IDtabela: TIntegerField
      FieldName = 'seq_IDtabela'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_pis: TDataSetProvider
    DataSet = qr_pis
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pisBeforeUpdateRecord
    Left = 84
    Top = 1136
  end
  object dsp_plano: TDataSetProvider
    DataSet = qr_plano
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_planoBeforeUpdateRecord
    Left = 192
    Top = 1138
  end
  object dsp_prod_aliq_icms: TDataSetProvider
    DataSet = qr_prod_aliq_icms
    BeforeUpdateRecord = dsp_prod_aliq_icmsBeforeUpdateRecord
    Left = 363
    Top = 1139
  end
  object dsp_prod_comp: TDataSetProvider
    DataSet = qr_prod_comp
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_compBeforeUpdateRecord
    Left = 530
    Top = 1139
  end
  object dsp_prod_emba: TDataSetProvider
    DataSet = qr_prod_emba
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_embaBeforeUpdateRecord
    Left = 695
    Top = 1139
  end
  object dsp_prod_imp_cof: TDataSetProvider
    DataSet = qr_prod_imp_cof
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_imp_cofBeforeUpdateRecord
    Left = 126
    Top = 1216
  end
  object dsp_prod_imp_icms: TDataSetProvider
    DataSet = qr_prod_imp_icms
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_imp_icmsBeforeUpdateRecord
    Left = 322
    Top = 1216
  end
  object dsp_prod_imp_ipi: TDataSetProvider
    DataSet = qr_prod_imp_ipi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_imp_ipiBeforeUpdateRecord
    Left = 517
    Top = 1216
  end
  object dsp_prod_imp_pis: TDataSetProvider
    DataSet = qr_prod_imp_pis
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_imp_pisBeforeUpdateRecord
    Left = 704
    Top = 1216
  end
  object dsp_prod_similar: TDataSetProvider
    DataSet = qr_prod_similar
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_prod_similarBeforeUpdateRecord
    Left = 111
    Top = 1297
  end
  object dsp_prod_tabprec: TDataSetProvider
    DataSet = qr_prod_tabprec
    BeforeUpdateRecord = dsp_prod_tabprecBeforeUpdateRecord
    Left = 287
    Top = 1297
  end
  object dsp_produto: TDataSetProvider
    DataSet = qr_produto
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_produtoBeforeUpdateRecord
    Left = 427
    Top = 1297
  end
  object dsp_ramati: TDataSetProvider
    DataSet = qr_ramati
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_ramatiBeforeUpdateRecord
    Left = 705
    Top = 1298
  end
  object dsp_reg_deletado: TDataSetProvider
    DataSet = qr_reg_deletado
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_reg_deletadoBeforeUpdateRecord
    Left = 826
    Top = 1369
  end
  object dsp_sequencia: TDataSetProvider
    DataSet = qr_sequencia
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 1368
  end
  object qr_servico: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from servico'
      'where ser_id = :_id')
    SQLConnection = db_Servico
    Left = 180
    Top = 1368
    object qr_servicoser_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ser_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_servicoemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoent_id: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicostn_codigo: TIntegerField
      FieldName = 'stn_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_TipoRPS: TStringField
      DisplayLabel = 'Tipo RPS'
      FieldName = 'ser_TipoRPS'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_NumeroRPS: TIntegerField
      DisplayLabel = 'Numero RPS'
      FieldName = 'ser_NumeroRPS'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_SerieRPS: TStringField
      FieldName = 'ser_SerieRPS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_servicoser_NumeroNota: TIntegerField
      DisplayLabel = 'Numero Nota'
      FieldName = 'ser_NumeroNota'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_Datemi: TSQLTimeStampField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'ser_Datemi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_Situacao: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'ser_Situacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_SerieRPSSubs: TStringField
      DisplayLabel = 'Serie RPS Subs'
      FieldName = 'ser_SerieRPSSubs'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_NumeroNFSeSubs: TIntegerField
      DisplayLabel = 'Numero NFSe Subs'
      FieldName = 'ser_NumeroNFSeSubs'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_NumeroRPSSubs: TIntegerField
      DisplayLabel = 'Numero RPS Subs'
      FieldName = 'ser_NumeroRPSSubs'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_DataNFSeSubs: TSQLTimeStampField
      DisplayLabel = 'Data NFSe Subs'
      FieldName = 'ser_DataNFSeSubs'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_SeriePrest: TStringField
      DisplayLabel = 'Serie Prest'
      FieldName = 'ser_SeriePrest'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_servicoser_CodigoAtividade: TStringField
      DisplayLabel = 'Codigo Atividade'
      FieldName = 'ser_CodigoAtividade'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_servicoser_TipoReco: TStringField
      DisplayLabel = 'Tipo Recolhimento'
      FieldName = 'ser_TipoReco'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_MuniPrest: TIntegerField
      DisplayLabel = 'Municipio Presta'#231#227'o'
      FieldName = 'ser_MuniPrest'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_Operacao: TStringField
      DisplayLabel = 'Operacao'
      FieldName = 'ser_Operacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_Tributacao: TStringField
      DisplayLabel = 'Tributacao'
      FieldName = 'ser_Tributacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_vServico: TFMTBCDField
      DisplayLabel = 'Valor Servico'
      FieldName = 'ser_vServico'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vNota: TFMTBCDField
      DisplayLabel = 'Valor Nota'
      FieldName = 'ser_vNota'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vDeducoes: TFMTBCDField
      DisplayLabel = 'Valor Deducoes'
      FieldName = 'ser_vDeducoes'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vISS: TFMTBCDField
      DisplayLabel = 'Valor ISS'
      FieldName = 'ser_vISS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vPIS: TFMTBCDField
      DisplayLabel = 'Valor PIS'
      FieldName = 'ser_vPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vCofins: TFMTBCDField
      DisplayLabel = 'Valor Cofins'
      FieldName = 'ser_vCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vINSS: TFMTBCDField
      DisplayLabel = 'Valor INSS'
      FieldName = 'ser_vINSS'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vIR: TFMTBCDField
      DisplayLabel = 'Valor IR'
      FieldName = 'ser_vIR'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_vCSLL: TFMTBCDField
      DisplayLabel = 'Valor CSLL'
      FieldName = 'ser_vCSLL'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_servicoser_pISS: TFMTBCDField
      DisplayLabel = 'ISS'
      FieldName = 'ser_pISS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_servicoser_pPIS: TFMTBCDField
      DisplayLabel = 'PIS'
      FieldName = 'ser_pPIS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_servicoser_pCofins: TFMTBCDField
      DisplayLabel = 'Cofins'
      FieldName = 'ser_pCofins'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_servicoser_pINSS: TFMTBCDField
      DisplayLabel = 'INSS'
      FieldName = 'ser_pINSS'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_servicoser_pIR: TFMTBCDField
      DisplayLabel = 'IR'
      FieldName = 'ser_pIR'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_servicoser_pCSLL: TFMTBCDField
      DisplayLabel = 'CSLL'
      FieldName = 'ser_pCSLL'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 4
    end
    object qr_servicoser_calcPIS: TStringField
      DisplayLabel = 'calculo PIS'
      FieldName = 'ser_calcPIS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_calcCofins: TStringField
      DisplayLabel = 'calculo Cofins'
      FieldName = 'ser_calcCofins'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_calcINSS: TStringField
      DisplayLabel = 'calculo INSS'
      FieldName = 'ser_calcINSS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_calcIR: TStringField
      DisplayLabel = 'calculo IR'
      FieldName = 'ser_calcIR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_calcCSLL: TStringField
      DisplayLabel = 'calculo CSLL'
      FieldName = 'ser_calcCSLL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_descricao: TBlobField
      DisplayLabel = 'descricao'
      FieldName = 'ser_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_servicoser_MotCancel: TStringField
      DisplayLabel = 'Motivo Cancelamento'
      FieldName = 'ser_MotCancel'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object qr_servicoser_CpfCnpjInter: TStringField
      DisplayLabel = 'Cpf Cnpj Inter'
      FieldName = 'ser_CpfCnpjInter'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object qr_servicoser_dtVencto: TSQLTimeStampField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'ser_dtVencto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_servicoser_CodVerif: TStringField
      FieldName = 'ser_CodVerif'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_servicoser_LogEnvio: TBlobField
      FieldName = 'ser_LogEnvio'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_servicoser_LogCancel: TBlobField
      FieldName = 'ser_LogCancel'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_servicoser_NumeroLote: TIntegerField
      DisplayLabel = 'Numero Lote'
      FieldName = 'ser_NumeroLote'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoven_codigo: TIntegerField
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicotse_codigo: TStringField
      FieldName = 'tse_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qr_servicoser_GW_tpLancto: TStringField
      FieldName = 'ser_GW_tpLancto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_servicoser_pAprox: TFMTBCDField
      FieldName = 'ser_pAprox'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_servicoser_vTotTrib: TFMTBCDField
      FieldName = 'ser_vTotTrib'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_servicoser_pComissao: TFMTBCDField
      FieldName = 'ser_pComissao'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_servicoage_codigo: TIntegerField
      FieldName = 'age_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_servicoser_pAgencia: TFMTBCDField
      FieldName = 'ser_pAgencia'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
  end
  object qr_siafi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from siafi'
      'where sia_id = :_id')
    SQLConnection = db_Servico
    Left = 326
    Top = 1368
    object qr_siafisia_id: TIntegerField
      FieldName = 'sia_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_siafisia_codigo: TStringField
      FieldName = 'sia_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_siafisia_nome: TStringField
      FieldName = 'sia_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_siafiuf_codigo: TStringField
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_siafisia_codSiafi: TStringField
      FieldName = 'sia_codSiafi'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
  end
  object qr_simples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from simples'
      'where sim_id = :_id')
    SQLConnection = db_Servico
    Left = 440
    Top = 1368
    object qr_simplessim_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'sim_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_simplessim_recinicial: TFMTBCDField
      DisplayLabel = 'Receita inicial'
      FieldName = 'sim_recinicial'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 16
      Size = 2
    end
    object qr_simplessim_recfinal: TFMTBCDField
      DisplayLabel = 'Receita final'
      FieldName = 'sim_recfinal'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 16
      Size = 2
    end
    object qr_simplessim_icms: TFMTBCDField
      DisplayLabel = 'icms'
      FieldName = 'sim_icms'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 12
      Size = 2
    end
    object qr_simplesdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_sitdup: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from sitdup'
      'where sdp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 576
    Top = 1368
    object qr_sitdupsdp_codigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'sdp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_sitdupsdp_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'sdp_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_sitdupcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_sitdupdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_sitdupsdp_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'sdp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_sitnfe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from sitnfe'
      'where stn_codigo = :_id')
    SQLConnection = db_Servico
    Left = 24
    Top = 1456
    object qr_sitnfestn_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'stn_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_sitnfestn_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'stn_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_sitnfecontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_sitnfedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_sitnfestn_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'stn_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_sitribu: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from sitribu'
      'where str_id = :_id')
    SQLConnection = db_Servico
    Left = 152
    Top = 1456
    object qr_sitribustr_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'str_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_sitribustr_tipo: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'str_tipo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qr_sitribustr_codigo: TStringField
      DisplayLabel = 'codigo'
      FieldName = 'str_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_sitribustr_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'str_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qr_sitribucontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_sitribudat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_sitribustr_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'str_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_solicita: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from solicita'
      'where sol_id = :_id')
    SQLConnection = db_Servico
    Left = 288
    Top = 1456
    object qr_solicitasol_id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'sol_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_solicitaemp_codigo: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitasol_data: TSQLTimeStampField
      DisplayLabel = 'data'
      FieldName = 'sol_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitasol_solicitante: TStringField
      DisplayLabel = 'solicitante'
      FieldName = 'sol_solicitante'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_solicitapro_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitasol_especProd: TBlobField
      DisplayLabel = 'espec Prod'
      FieldName = 'sol_especProd'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_solicitasol_qtda: TFMTBCDField
      DisplayLabel = 'qtda'
      FieldName = 'sol_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_solicitaobr_id: TIntegerField
      DisplayLabel = 'obra'
      FieldName = 'obr_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitaped_numero: TIntegerField
      DisplayLabel = 'pedido numero'
      FieldName = 'ped_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitausu_codigo: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitasol_obs: TBlobField
      DisplayLabel = 'obs'
      FieldName = 'sol_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_solicitasol_status: TIntegerField
      DisplayLabel = 'status'
      FieldName = 'sol_status'
      ProviderFlags = [pfInUpdate]
    end
    object qr_solicitasol_block: TStringField
      DisplayLabel = 'Bloqueado?'
      FieldName = 'sol_block'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_solicitasol_check: TStringField
      FieldName = 'sol_check'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_solicitadat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_statusped: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from statusped'
      'where stp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 424
    Top = 1456
    object qr_statuspedstp_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'stp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_statuspedstp_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'stp_nome'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
  end
  object qr_tabban: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tabban'
      'where tba_id = :_id')
    SQLConnection = db_Servico
    Left = 592
    Top = 1456
    object qr_tabbantba_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'tba_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tabbantba_codigo: TStringField
      DisplayLabel = 'codigo'
      FieldName = 'tba_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qr_tabbantba_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tba_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_tabbandat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tabbantba_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tba_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_tabprec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tabprec'
      'where tbp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1552
    object qr_tabprectbp_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tbp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tabprectbp_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tbp_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_tabprectbp_ativo: TStringField
      DisplayLabel = 'ativo'
      FieldName = 'tbp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_tabpreccontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_tabprecdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_telefone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from telefone'
      'where tel_id = :_id')
    SQLConnection = db_Servico
    Left = 172
    Top = 1552
    object qr_telefonetel_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'tel_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_telefoneent_id: TIntegerField
      DisplayLabel = 'Entidade'
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_telefonetpt_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpt_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_telefonetel_ddi: TStringField
      DisplayLabel = 'ddi'
      FieldName = 'tel_ddi'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_telefonetel_ddd: TStringField
      DisplayLabel = 'ddd'
      FieldName = 'tel_ddd'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_telefonetel_numero: TStringField
      DisplayLabel = 'numero'
      FieldName = 'tel_numero'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object qr_telefonetel_contato: TStringField
      DisplayLabel = 'contato'
      FieldName = 'tel_contato'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_telefonetel_email: TStringField
      DisplayLabel = 'email'
      FieldName = 'tel_email'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_telefonetel_cargo: TStringField
      DisplayLabel = 'cargo'
      FieldName = 'tel_cargo'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_telefonedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qr_tipest: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tipest'
      'where tpe_codigo = :_id')
    SQLConnection = db_Servico
    Left = 312
    Top = 1552
    object qr_tipesttpe_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpe_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tipesttpe_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tpe_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_tipestdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tipesttpe_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tpe_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_tipestcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_tiplog: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tiplog'
      'where tpl_codigo = :_id')
    SQLConnection = db_Servico
    Left = 448
    Top = 1552
    object qr_tiplogtpl_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpl_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tiplogtpl_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tpl_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_tiplogdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tiplogtpl_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tpl_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_tipped: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tipped'
      'where tpp_codigo = :_id')
    SQLConnection = db_Servico
    Left = 584
    Top = 1552
    object qr_tippedtpp_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpp_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tippedtpp_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tpp_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_tippedcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_tippeddat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tippedtpp_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tpp_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_tippro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tippro'
      'where tpr_codigo = :_id')
    SQLConnection = db_Servico
    Left = 32
    Top = 1624
    object qr_tipprotpr_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpr_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tipprotpr_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tpr_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_tipprocontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_tipprodat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tipprotpr_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tpr_ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qr_tiptel: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tiptel'
      'where tpt_codigo = :_id')
    SQLConnection = db_Servico
    Left = 176
    Top = 1624
    object qr_tipteltpt_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'tpt_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tipteltpt_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'tpt_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_tiptelcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_tipteldat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_tipteltpt_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'tpt_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
  end
  object qr_uf: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from uf'
      'where uf_id = :_id')
    SQLConnection = db_Servico
    Left = 328
    Top = 1624
    object qr_ufuf_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'uf_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_ufuf_codigo: TStringField
      DisplayLabel = 'codigo'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qr_ufuf_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'uf_nome'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object qr_ufuf_icms: TFMTBCDField
      DisplayLabel = 'icms'
      FieldName = 'uf_icms'
      ProviderFlags = [pfInUpdate]
      Precision = 7
      Size = 2
    end
    object qr_ufuf_cUF: TIntegerField
      DisplayLabel = 'UF'
      FieldName = 'uf_cUF'
      ProviderFlags = [pfInUpdate]
    end
    object qr_ufdat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_ufuf_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'uf_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_unimed: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from unimed'
      'where uni_id = :_id')
    SQLConnection = db_Servico
    Left = 480
    Top = 1624
    object qr_unimeduni_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'uni_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_unimeduni_codigo: TStringField
      DisplayLabel = 'codigo'
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qr_unimeduni_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'uni_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_unimedcontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_unimeddat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_unimeduni_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'uni_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_usuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from usuario'
      'where usu_codigo = :_id')
    SQLConnection = db_Servico
    Left = 624
    Top = 1624
    object qr_usuariousu_codigo: TIntegerField
      DisplayLabel = 'codigo'
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_usuariousu_login: TStringField
      DisplayLabel = 'Login'
      FieldName = 'usu_login'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_usuariousu_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'usu_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_usuariousu_senha: TStringField
      DisplayLabel = 'senha'
      FieldName = 'usu_senha'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_usuariousu_datexp: TSQLTimeStampField
      FieldName = 'usu_datexp'
      ProviderFlags = [pfInUpdate]
    end
    object qr_usuariousu_adm: TStringField
      FieldName = 'usu_adm'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_usuariocontrole: TStringField
      FieldName = 'controle'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_usuariodat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_usuariousu_ativo: TStringField
      FieldName = 'usu_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_usuariousu_email: TStringField
      FieldName = 'usu_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_usuariousu_Senha_email: TStringField
      FieldName = 'usu_Senha_email'
      ProviderFlags = [pfInUpdate]
    end
    object qr_usuarioema_id: TIntegerField
      FieldName = 'ema_id'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_vende: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from vende'
      'where ven_codigo = :_id')
    SQLConnection = db_Servico
    Left = 40
    Top = 1688
    object qr_vendeven_codigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_vendeven_nome: TStringField
      DisplayLabel = 'nome'
      FieldName = 'ven_nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qr_vendeven_vendedor: TStringField
      DisplayLabel = 'vendedor'
      FieldName = 'ven_vendedor'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_vendeven_comprador: TStringField
      DisplayLabel = 'comprador'
      FieldName = 'ven_comprador'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qr_vendedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_vendeven_ativo: TStringField
      DisplayLabel = 'ativo?'
      FieldName = 'ven_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_vendeven_endereco: TStringField
      DisplayLabel = 'endereco'
      FieldName = 'ven_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_vendeven_numero: TStringField
      DisplayLabel = 'numero'
      FieldName = 'ven_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_vendeven_comple: TStringField
      DisplayLabel = 'complemento'
      FieldName = 'ven_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_vendeven_bairro: TStringField
      DisplayLabel = 'bairro'
      FieldName = 'ven_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_vendeven_cidade: TStringField
      DisplayLabel = 'cidade'
      FieldName = 'ven_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_vendeuf_codigo: TStringField
      DisplayLabel = 'uf'
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_vendeven_cep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'ven_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_vendeven_fantasia: TStringField
      DisplayLabel = 'nome fantasia'
      FieldName = 'ven_fantasia'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_vendeven_fone: TStringField
      DisplayLabel = 'fone'
      FieldName = 'ven_fone'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_vendeven_fax: TStringField
      DisplayLabel = 'fax'
      FieldName = 'ven_fax'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_vendeven_celular: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'ven_celular'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_vendeven_email: TStringField
      DisplayLabel = 'email'
      FieldName = 'ven_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_vendeusu_codigo: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_volume: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from volume'
      'where vol_id = :_id')
    SQLConnection = db_Servico
    Left = 200
    Top = 1688
    object qr_volumevol_id: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'vol_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_volumenot_id: TIntegerField
      DisplayLabel = 'nota'
      FieldName = 'not_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_volumevol_qVol: TIntegerField
      DisplayLabel = 'Qtda Volume'
      FieldName = 'vol_qVol'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_volumevol_esp: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'vol_esp'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_volumevol_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'vol_marca'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_volumevol_nVol: TStringField
      DisplayLabel = 'Numero Volume'
      FieldName = 'vol_nVol'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_volumevol_pesoL: TFMTBCDField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'vol_pesoL'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 3
    end
    object qr_volumevol_pesoB: TFMTBCDField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'vol_pesoB'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 3
    end
    object qr_volumevol_nLacre: TStringField
      DisplayLabel = 'Nro Lacre'
      FieldName = 'vol_nLacre'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_volumedat_inclusao: TSQLTimeStampField
      DisplayLabel = 'dt. inclusao'
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_servico: TDataSetProvider
    DataSet = qr_servico
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_servicoBeforeUpdateRecord
    Left = 244
    Top = 1368
  end
  object dsp_siafi: TDataSetProvider
    DataSet = qr_siafi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_siafiBeforeUpdateRecord
    Left = 376
    Top = 1368
  end
  object dsp_simples: TDataSetProvider
    DataSet = qr_simples
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_simplesBeforeUpdateRecord
    Left = 504
    Top = 1368
  end
  object dsp_sitdup: TDataSetProvider
    DataSet = qr_sitdup
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_sitdupBeforeUpdateRecord
    Left = 656
    Top = 1368
  end
  object dsp_sitnfe: TDataSetProvider
    DataSet = qr_sitnfe
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_sitnfeBeforeUpdateRecord
    Left = 88
    Top = 1456
  end
  object dsp_sitribu: TDataSetProvider
    DataSet = qr_sitribu
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_sitribuBeforeUpdateRecord
    Left = 216
    Top = 1456
  end
  object dsp_solicita: TDataSetProvider
    DataSet = qr_solicita
    BeforeUpdateRecord = dsp_solicitaBeforeUpdateRecord
    Left = 360
    Top = 1456
  end
  object dsp_statusped: TDataSetProvider
    DataSet = qr_statusped
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_statuspedBeforeUpdateRecord
    Left = 504
    Top = 1456
  end
  object dsp_tabban: TDataSetProvider
    DataSet = qr_tabban
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tabbanBeforeUpdateRecord
    Left = 668
    Top = 1456
  end
  object dsp_tabprec: TDataSetProvider
    DataSet = qr_tabprec
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tabprecBeforeUpdateRecord
    Left = 104
    Top = 1552
  end
  object dsp_telefone: TDataSetProvider
    DataSet = qr_telefone
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_telefoneBeforeUpdateRecord
    Left = 240
    Top = 1552
  end
  object dsp_tipest: TDataSetProvider
    DataSet = qr_tipest
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tipestBeforeUpdateRecord
    Left = 376
    Top = 1552
  end
  object dsp_tiplog: TDataSetProvider
    DataSet = qr_tiplog
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tiplogBeforeUpdateRecord
    Left = 504
    Top = 1552
  end
  object dsp_tipped: TDataSetProvider
    DataSet = qr_tipped
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tippedBeforeUpdateRecord
    Left = 648
    Top = 1552
  end
  object dsp_tippro: TDataSetProvider
    DataSet = qr_tippro
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tipproBeforeUpdateRecord
    Left = 96
    Top = 1624
  end
  object dsp_tiptel: TDataSetProvider
    DataSet = qr_tiptel
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tiptelBeforeUpdateRecord
    Left = 232
    Top = 1624
  end
  object dsp_uf: TDataSetProvider
    DataSet = qr_uf
    BeforeUpdateRecord = dsp_ufBeforeUpdateRecord
    Left = 408
    Top = 1624
  end
  object dsp_unimed: TDataSetProvider
    DataSet = qr_unimed
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_unimedBeforeUpdateRecord
    Left = 544
    Top = 1624
  end
  object dsp_usuario: TDataSetProvider
    DataSet = qr_usuario
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_usuarioBeforeUpdateRecord
    Left = 696
    Top = 1624
  end
  object dsp_vende: TDataSetProvider
    DataSet = qr_vende
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_vendeBeforeUpdateRecord
    Left = 104
    Top = 1688
  end
  object dsp_volume: TDataSetProvider
    DataSet = qr_volume
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_volumeBeforeUpdateRecord
    Left = 280
    Top = 1688
  end
  object cds_itemped: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_itemped'
    Left = 752
    Top = 720
  end
  object cds_pedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_pedido'
    Left = 752
    Top = 1064
  end
  object qr_pedido_pi: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pedido_pi'
      'where ped_id = :_id')
    SQLConnection = db_Servico
    Left = 40
    Top = 1757
    object qr_pedido_piped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pedido_piemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_numero: TIntegerField
      FieldName = 'ped_numero'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pedido_piped_datemi: TSQLTimeStampField
      FieldName = 'ped_datemi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_pient_id: TIntegerField
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_pDesc: TFMTBCDField
      FieldName = 'ped_pDesc'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vDesc: TFMTBCDField
      FieldName = 'ped_vDesc'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vComAgencia: TFMTBCDField
      FieldName = 'ped_vComAgencia'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vComVende: TFMTBCDField
      FieldName = 'ped_vComVende'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vBV: TFMTBCDField
      FieldName = 'ped_vBV'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vRetencao: TFMTBCDField
      FieldName = 'ped_vRetencao'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vReembolso: TFMTBCDField
      FieldName = 'ped_vReembolso'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_vLiquido: TFMTBCDField
      FieldName = 'ped_vLiquido'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_pispi_codigo: TIntegerField
      FieldName = 'spi_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_picir_codigo: TIntegerField
      FieldName = 'cir_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_formulario: TStringField
      FieldName = 'ped_formulario'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_autorizacao: TStringField
      FieldName = 'ped_autorizacao'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_pedido_piped_produto: TStringField
      FieldName = 'ped_produto'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_pedido_piped_campanha: TStringField
      FieldName = 'ped_campanha'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_pedido_piped_pBonificacao: TFMTBCDField
      FieldName = 'ped_pBonificacao'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pedido_piped_pAgencia: TFMTBCDField
      FieldName = 'ped_pAgencia'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pedido_piped_pVende: TFMTBCDField
      FieldName = 'ped_pVende'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pedido_piped_obsComercial: TBlobField
      FieldName = 'ped_obsComercial'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_pedido_piped_piAgencia: TStringField
      FieldName = 'ped_piAgencia'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_pedido_piped_descAgencia: TStringField
      FieldName = 'ped_descAgencia'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedido_piped_valor: TFMTBCDField
      FieldName = 'ped_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_pedido_piped_nparcela: TIntegerField
      FieldName = 'ped_nparcela'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_venctoIni: TSQLTimeStampField
      FieldName = 'ped_venctoIni'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piage_codigo: TIntegerField
      FieldName = 'age_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pedido_piped_permuta: TStringField
      FieldName = 'ped_permuta'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedido_piped_preReserva: TStringField
      FieldName = 'ped_preReserva'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedido_piped_situacao: TStringField
      FieldName = 'ped_situacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pedido_piped_cancel: TStringField
      FieldName = 'ped_cancel'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_pedido_pi: TDataSetProvider
    DataSet = qr_pedido_pi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pedido_piBeforeUpdateRecord
    Left = 118
    Top = 1757
  end
  object dsp_pi_programacao: TDataSetProvider
    DataSet = qr_pi_programacao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pi_programacaoBeforeUpdateRecord
    Left = 318
    Top = 1757
  end
  object qr_pi_programacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pi_programacao'
      'where prg_id = :_id')
    SQLConnection = db_Servico
    Left = 213
    Top = 1757
    object qr_pi_programacaoprg_id: TIntegerField
      FieldName = 'prg_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pi_programacaoped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pi_programacaoprg_item: TStringField
      FieldName = 'prg_item'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_pi_programacaoprg_nTitulo: TStringField
      FieldName = 'prg_nTitulo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qr_pi_programacaoprg_Titulo: TStringField
      FieldName = 'prg_Titulo'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_pi_programacaoprg_Colocacao: TStringField
      FieldName = 'prg_Colocacao'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_pi_programacaoprg_linha: TIntegerField
      FieldName = 'prg_linha'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_programacaoprg_cor: TStringField
      FieldName = 'prg_cor'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pi_programacaoprg_preco: TFMTBCDField
      FieldName = 'prg_preco'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_pi_programacaoprg_valor: TFMTBCDField
      FieldName = 'prg_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_pi_programacaocad_codigo: TIntegerField
      FieldName = 'cad_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_programacaoprg_precoTab: TFMTBCDField
      FieldName = 'prg_precoTab'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 4
    end
    object qr_pi_programacaoprg_qtda: TIntegerField
      FieldName = 'prg_qtda'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_programacaoprg_coluna: TFMTBCDField
      FieldName = 'prg_coluna'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pi_programacaoprg_medTotal: TFMTBCDField
      FieldName = 'prg_medTotal'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pi_programacaoprg_cm: TFMTBCDField
      FieldName = 'prg_cm'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_pi_programacaoprg_saldoPrg: TStringField
      FieldName = 'prg_saldoPrg'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_pi_programacaoprg_vDesc: TFMTBCDField
      FieldName = 'prg_vDesc'
      Precision = 13
      Size = 4
    end
    object qr_pi_programacaoprg_vDescTab: TFMTBCDField
      FieldName = 'prg_vDescTab'
      Precision = 13
      Size = 4
    end
    object qr_pi_programacaocir_codigo: TIntegerField
      FieldName = 'cir_codigo'
    end
  end
  object qr_pi_publicacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pi_publicacao'
      'where pub_id = :_id')
    SQLConnection = db_Servico
    Left = 424
    Top = 1756
    object qr_pi_publicacaopub_id: TIntegerField
      FieldName = 'pub_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pi_publicacaoped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pi_publicacaoprg_id: TIntegerField
      FieldName = 'prg_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_publicacaopub_data: TSQLTimeStampField
      FieldName = 'pub_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_publicacaopub_qtda: TIntegerField
      FieldName = 'pub_qtda'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_publicacaoedi_codigo: TIntegerField
      FieldName = 'edi_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_pi_publicacao: TDataSetProvider
    DataSet = qr_pi_publicacao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pi_publicacaoBeforeUpdateRecord
    Left = 514
    Top = 1757
  end
  object qr_pi_fatura: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pi_fatura'
      'where pfa_id = :_id')
    SQLConnection = db_Servico
    Left = 41
    Top = 1824
    object qr_pi_faturapfa_id: TIntegerField
      FieldName = 'pfa_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pi_faturaped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pi_faturadup_id: TIntegerField
      FieldName = 'dup_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_faturapfa_parcela: TIntegerField
      FieldName = 'pfa_parcela'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_faturapfa_vencto: TSQLTimeStampField
      FieldName = 'pfa_vencto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_faturapfa_valor: TFMTBCDField
      FieldName = 'pfa_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object qr_pi_faturapfa_cancel: TStringField
      FieldName = 'pfa_cancel'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_pi_fatura: TDataSetProvider
    DataSet = qr_pi_fatura
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pi_faturaBeforeUpdateRecord
    Left = 118
    Top = 1824
  end
  object dsp_pi_agencia: TDataSetProvider
    DataSet = qr_pi_agencia
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pi_agenciaBeforeUpdateRecord
    Left = 284
    Top = 1822
  end
  object dsp_pi_vende: TDataSetProvider
    DataSet = qr_pi_vende
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_pi_vendeBeforeUpdateRecord
    Left = 512
    Top = 1824
  end
  object qr_pi_agencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pi_agencia'
      'where pag_id = :_id')
    SQLConnection = db_Servico
    Left = 208
    Top = 1822
    object qr_pi_agenciapag_id: TIntegerField
      FieldName = 'pag_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pi_agenciaped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pi_agenciaage_codigo: TIntegerField
      FieldName = 'age_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_pi_vende: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from pi_vende'
      'where pve_id = :_id')
    SQLConnection = db_Servico
    Left = 416
    Top = 1824
    object qr_pi_vendepve_id: TIntegerField
      FieldName = 'pve_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_pi_vendeped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qr_pi_vendeven_codigo: TIntegerField
      FieldName = 'ven_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_pi_vendepve_pRateio: TFMTBCDField
      FieldName = 'pve_pRateio'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
  end
  object qr_tipass: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from tipass'
      'where tas_codigo = :_id')
    SQLConnection = db_Servico
    Left = 608
    Top = 1824
    object qr_tipasstas_codigo: TIntegerField
      FieldName = 'tas_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_tipasstas_nome: TStringField
      FieldName = 'tas_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_tipasstas_ativo: TStringField
      FieldName = 'tas_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_tipass: TDataSetProvider
    DataSet = qr_tipass
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_tipassBeforeUpdateRecord
    Left = 704
    Top = 1825
  end
  object dsp_entregador: TDataSetProvider
    DataSet = qr_entregador
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_entregadorBeforeUpdateRecord
    Left = 128
    Top = 1888
  end
  object qr_entregador: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from entregador'
      'where ent_codigo = :_id')
    SQLConnection = db_Servico
    Left = 40
    Top = 1880
    object qr_entregadorent_codigo: TIntegerField
      FieldName = 'ent_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_entregadorent_nome: TStringField
      FieldName = 'ent_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_entregadorent_ativo: TStringField
      FieldName = 'ent_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_entregadorent_endereco: TStringField
      FieldName = 'ent_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entregadorent_comple: TStringField
      FieldName = 'ent_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entregadorent_numero: TStringField
      FieldName = 'ent_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entregadorent_bairro: TStringField
      FieldName = 'ent_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entregadorent_cidade: TStringField
      FieldName = 'ent_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_entregadorent_cep: TStringField
      FieldName = 'ent_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_entregadoruf_codigo: TStringField
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_entregadorent_fone: TStringField
      FieldName = 'ent_fone'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entregadorent_celular: TStringField
      FieldName = 'ent_celular'
      ProviderFlags = [pfInUpdate]
    end
    object qr_entregadorent_precoUN: TFMTBCDField
      FieldName = 'ent_precoUN'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
    object qr_entregadorent_precoFixo: TFMTBCDField
      FieldName = 'ent_precoFixo'
      ProviderFlags = [pfInUpdate]
      Precision = 12
      Size = 2
    end
  end
  object qr_bolsao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from bolsao'
      'where bol_codigo = :_id')
    SQLConnection = db_Servico
    Left = 224
    Top = 1888
    object qr_bolsaobol_codigo: TIntegerField
      FieldName = 'bol_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_bolsaobol_nome: TStringField
      FieldName = 'bol_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_bolsaobol_ativo: TStringField
      FieldName = 'bol_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_bolsaobol_cidade: TStringField
      FieldName = 'bol_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_bolsaoent_codigo: TIntegerField
      FieldName = 'ent_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_bolsao: TDataSetProvider
    DataSet = qr_bolsao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_bolsaoBeforeUpdateRecord
    Left = 288
    Top = 1888
  end
  object dsp_circulacao: TDataSetProvider
    DataSet = qr_circulacao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_circulacaoBeforeUpdateRecord
    Left = 512
    Top = 1888
  end
  object qr_circulacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from circulacao'
      'where cir_codigo = :_id')
    SQLConnection = db_Servico
    Left = 416
    Top = 1888
    object qr_circulacaocir_codigo: TIntegerField
      FieldName = 'cir_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_circulacaocir_nome: TStringField
      FieldName = 'cir_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_circulacaocir_ativo: TStringField
      FieldName = 'cir_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_frequencia: TIntegerField
      FieldName = 'cir_frequencia'
      ProviderFlags = [pfInUpdate]
    end
    object qr_circulacaocir_seg: TStringField
      FieldName = 'cir_seg'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_ter: TStringField
      FieldName = 'cir_ter'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_qua: TStringField
      FieldName = 'cir_qua'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_qui: TStringField
      FieldName = 'cir_qui'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_sex: TStringField
      FieldName = 'cir_sex'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_sab: TStringField
      FieldName = 'cir_sab'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_circulacaocir_dom: TStringField
      FieldName = 'cir_dom'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qr_statuspi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from statuspi'
      'where spi_codigo = :_id')
    SQLConnection = db_Servico
    Left = 608
    Top = 1888
    object qr_statuspispi_codigo: TIntegerField
      FieldName = 'spi_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_statuspispi_nome: TStringField
      FieldName = 'spi_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_statuspispi_ativo: TStringField
      FieldName = 'spi_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_statuspi: TDataSetProvider
    DataSet = qr_statuspi
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_statuspiBeforeUpdateRecord
    Left = 704
    Top = 1888
  end
  object qr_caderno: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from caderno'
      'where cad_codigo = :_id')
    SQLConnection = db_Servico
    Left = 48
    Top = 1960
    object qr_cadernocad_codigo: TIntegerField
      FieldName = 'cad_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_cadernocad_nome: TStringField
      FieldName = 'cad_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_cadernocad_ativo: TStringField
      FieldName = 'cad_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_cadernocad_subcod: TIntegerField
      FieldName = 'cad_subcod'
      ProviderFlags = [pfInUpdate]
    end
    object qr_cadernocad_ordem: TIntegerField
      FieldName = 'cad_ordem'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_caderno: TDataSetProvider
    DataSet = qr_caderno
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_cadernoBeforeUpdateRecord
    Left = 128
    Top = 1960
  end
  object qr_nfsComunica: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from nfsComunica'
      'where nfc_id = :_id')
    SQLConnection = db_Servico
    Left = 616
    Top = 1760
    object qr_nfsComunicanfc_id: TIntegerField
      FieldName = 'nfc_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_nfsComunicaemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicanfc_mesano: TStringField
      FieldName = 'nfc_mesano'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qr_nfsComunicanfc_numero: TIntegerField
      FieldName = 'nfc_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicaent_id: TIntegerField
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicanat_codigo: TIntegerField
      FieldName = 'nat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicanfc_datemi: TSQLTimeStampField
      FieldName = 'nfc_datemi'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicanfc_descServico: TBlobField
      FieldName = 'nfc_descServico'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_nfsComunicanfc_vNota: TFMTBCDField
      FieldName = 'nfc_vNota'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_nfsComunicanfc_vencto: TSQLTimeStampField
      FieldName = 'nfc_vencto'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicapfa_id: TIntegerField
      FieldName = 'pfa_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_nfsComunicanfc_vDesconto: TFMTBCDField
      FieldName = 'nfc_vDesconto'
      Precision = 13
      Size = 1
    end
    object qr_nfsComunicaped_id: TIntegerField
      FieldName = 'ped_id'
    end
    object qr_nfsComunicaprg_item: TStringField
      FieldName = 'prg_item'
      FixedChar = True
      Size = 3
    end
    object qr_nfsComunicanfc_vTotal: TFMTBCDField
      FieldName = 'nfc_vTotal'
      Precision = 13
      Size = 2
    end
    object qr_nfsComunicanfc_obs: TBlobField
      FieldName = 'nfc_obs'
      Size = 1
    end
    object qr_nfsComunicaage_codigo: TIntegerField
      FieldName = 'age_codigo'
    end
    object qr_nfsComunicaven_codigo: TIntegerField
      FieldName = 'ven_codigo'
    end
    object qr_nfsComunicanfc_pAgencia: TFMTBCDField
      FieldName = 'nfc_pAgencia'
      Precision = 13
      Size = 2
    end
    object qr_nfsComunicanfc_pVende: TFMTBCDField
      FieldName = 'nfc_pVende'
      Precision = 13
      Size = 2
    end
    object qr_nfsComunicanfc_cancel: TStringField
      FieldName = 'nfc_cancel'
      FixedChar = True
      Size = 1
    end
    object qr_nfsComunicamnf_codigo: TStringField
      FieldName = 'mnf_codigo'
      FixedChar = True
      Size = 3
    end
  end
  object dsp_nfsComunica: TDataSetProvider
    DataSet = qr_nfsComunica
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_nfsComunicaBeforeUpdateRecord
    Left = 704
    Top = 1760
  end
  object qr_assinante: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from assinante'
      'where ass_codigo = :_id')
    SQLConnection = db_Servico
    Left = 224
    Top = 1952
    object qr_assinanteass_codigo: TIntegerField
      FieldName = 'ass_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_assinantetas_codigo: TIntegerField
      FieldName = 'tas_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanterat_codigo: TIntegerField
      FieldName = 'rat_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinantebol_codigo: TIntegerField
      FieldName = 'bol_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_nome: TStringField
      FieldName = 'ass_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_assinanteass_ativo: TStringField
      FieldName = 'ass_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_endereco: TStringField
      FieldName = 'ass_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_assinanteass_numero: TStringField
      FieldName = 'ass_numero'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_assinanteass_bairro: TStringField
      FieldName = 'ass_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_assinanteass_cidade: TStringField
      FieldName = 'ass_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_assinanteass_cep: TStringField
      FieldName = 'ass_cep'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object qr_assinanteuf_codigo: TStringField
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_assinanteass_fone: TStringField
      FieldName = 'ass_fone'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_celular: TStringField
      FieldName = 'ass_celular'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_comple: TStringField
      FieldName = 'ass_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_assinantedis_id: TIntegerField
      FieldName = 'dis_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinantecas_id: TIntegerField
      FieldName = 'cas_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_cnpj: TStringField
      FieldName = 'ass_cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_assinanteass_cpf: TStringField
      FieldName = 'ass_cpf'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qr_assinanteass_rg: TStringField
      FieldName = 'ass_rg'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_email: TStringField
      FieldName = 'ass_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_assinanteass_temPortaria: TStringField
      FieldName = 'ass_temPortaria'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_dtVigencia_inicio: TSQLTimeStampField
      FieldName = 'ass_dtVigencia_inicio'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_dtVigencia_fim: TSQLTimeStampField
      FieldName = 'ass_dtVigencia_fim'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_ent_ac: TStringField
      FieldName = 'ass_ent_ac'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_assinanteass_ent_endereco: TStringField
      FieldName = 'ass_ent_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_assinanteass_ent_numero: TStringField
      FieldName = 'ass_ent_numero'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_assinanteass_ent_comple: TStringField
      FieldName = 'ass_ent_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_assinanteass_ent_uf: TStringField
      FieldName = 'ass_ent_uf'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_assinanteass_ent_cidade: TStringField
      FieldName = 'ass_ent_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_assinanteass_ent_bairro: TStringField
      FieldName = 'ass_ent_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qr_assinanteass_ent_ordem: TIntegerField
      FieldName = 'ass_ent_ordem'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qSeg: TIntegerField
      FieldName = 'ass_qSeg'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qTer: TIntegerField
      FieldName = 'ass_qTer'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qQua: TIntegerField
      FieldName = 'ass_qQua'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qQui: TIntegerField
      FieldName = 'ass_qQui'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qSex: TIntegerField
      FieldName = 'ass_qSex'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qSab: TIntegerField
      FieldName = 'ass_qSab'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_qDom: TIntegerField
      FieldName = 'ass_qDom'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_roteiro: TStringField
      FieldName = 'ass_roteiro'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_acao_inc: TStringField
      FieldName = 'ass_acao_inc'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_acao_incDt: TSQLTimeStampField
      FieldName = 'ass_acao_incDt'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_acao_alt: TStringField
      FieldName = 'ass_acao_alt'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_acao_altDt: TSQLTimeStampField
      FieldName = 'ass_acao_altDt'
      ProviderFlags = [pfInUpdate]
    end
    object qr_assinanteass_acao_exc: TStringField
      FieldName = 'ass_acao_exc'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_assinanteass_acao_excDt: TSQLTimeStampField
      FieldName = 'ass_acao_excDt'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_assinante: TDataSetProvider
    DataSet = qr_assinante
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_assinanteBeforeUpdateRecord
    Left = 304
    Top = 1952
  end
  object qr_romaneio: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from romaneio'
      'where rom_id = :_id')
    SQLConnection = db_Servico
    Left = 408
    Top = 1680
    object qr_romaneiorom_id: TIntegerField
      FieldName = 'rom_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_romaneioped_id: TIntegerField
      FieldName = 'ped_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_romaneioitp_id: TIntegerField
      FieldName = 'itp_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_romaneiopro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_romaneiorom_qtda: TFMTBCDField
      FieldName = 'rom_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 4
    end
  end
  object dsp_romaneio: TDataSetProvider
    DataSet = qr_romaneio
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_romaneioBeforeUpdateRecord
    Left = 480
    Top = 1680
  end
  object dsp_agencia: TDataSetProvider
    DataSet = qr_agencia
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_agenciaBeforeUpdateRecord
    Left = 696
    Top = 1960
  end
  object qr_agencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from agencia'
      'where age_codigo = :_id')
    SQLConnection = db_Servico
    Left = 616
    Top = 1960
    object qr_agenciaage_codigo: TIntegerField
      FieldName = 'age_codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_agenciaage_ativo: TStringField
      FieldName = 'age_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_agenciaage_nome: TStringField
      FieldName = 'age_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciaage_razao: TStringField
      FieldName = 'age_razao'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciaage_cnpj: TStringField
      FieldName = 'age_cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_agenciaage_cpf: TStringField
      FieldName = 'age_cpf'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qr_agenciaage_endereco: TStringField
      FieldName = 'age_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciaage_numero: TStringField
      FieldName = 'age_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_agenciaage_comple: TStringField
      FieldName = 'age_comple'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciaage_bairro: TStringField
      FieldName = 'age_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciaage_cidade: TStringField
      FieldName = 'age_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qr_agenciauf_codigo: TStringField
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_agenciaage_cep: TStringField
      FieldName = 'age_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_agenciaage_ie: TStringField
      FieldName = 'age_ie'
      ProviderFlags = [pfInUpdate]
    end
    object qr_agenciaage_rg: TStringField
      FieldName = 'age_rg'
      ProviderFlags = [pfInUpdate]
    end
    object qr_agenciaage_homepage: TStringField
      FieldName = 'age_homepage'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_agenciaage_email: TStringField
      FieldName = 'age_email'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_agenciaage_fone: TStringField
      FieldName = 'age_fone'
      ProviderFlags = [pfInUpdate]
    end
    object qr_agenciaage_celular: TStringField
      FieldName = 'age_celular'
      ProviderFlags = [pfInUpdate]
    end
    object qr_agenciaage_contato: TStringField
      FieldName = 'age_contato'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_agenciaage_obs: TBlobField
      FieldName = 'age_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object qr_rep_legal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from rep_legal'
      'where rpl_id = :_id')
    SQLConnection = db_Servico
    Left = 48
    Top = 2032
    object qr_rep_legalrpl_id: TIntegerField
      FieldName = 'rpl_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_rep_legalent_id: TIntegerField
      FieldName = 'ent_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_rep_legalrpl_nome: TStringField
      FieldName = 'rpl_nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_rep_legalrpl_nacional: TStringField
      FieldName = 'rpl_nacional'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_rep_legalrpl_civil: TStringField
      FieldName = 'rpl_civil'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_rep_legalrpl_profissao: TStringField
      FieldName = 'rpl_profissao'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_rep_legalrpl_rg: TStringField
      FieldName = 'rpl_rg'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object qr_rep_legalrpl_cpf: TStringField
      FieldName = 'rpl_cpf'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_rep_legalrpl_endereco: TStringField
      FieldName = 'rpl_endereco'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_rep_legalrpl_cidade: TStringField
      FieldName = 'rpl_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_rep_legaluf_codigo: TStringField
      FieldName = 'uf_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qr_rep_legalrpl_cep: TStringField
      FieldName = 'rpl_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qr_rep_legalrpl_pais: TStringField
      FieldName = 'rpl_pais'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_rep_legalrpl_nascto: TSQLTimeStampField
      FieldName = 'rpl_nascto'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_rep_legal: TDataSetProvider
    DataSet = qr_rep_legal
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_rep_legalBeforeUpdateRecord
    Left = 128
    Top = 2032
  end
  object dsp_cheque: TDataSetProvider
    DataSet = qr_cheque
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_chequeBeforeUpdateRecord
    Left = 800
    Top = 152
  end
  object qr_cheque: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from cheque'
      'where chq_id = :_id')
    SQLConnection = db_Servico
    Left = 736
    Top = 152
    object qr_chequechq_id: TIntegerField
      FieldName = 'chq_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_chequedup_id: TIntegerField
      FieldName = 'dup_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequeemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequechq_data: TSQLTimeStampField
      FieldName = 'chq_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequechq_emitente: TStringField
      FieldName = 'chq_emitente'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_chequechq_cpfcnpj: TStringField
      FieldName = 'chq_cpfcnpj'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qr_chequetba_codigo: TStringField
      FieldName = 'tba_codigo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object qr_chequechq_agencia: TStringField
      FieldName = 'chq_agencia'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_chequechq_conta: TStringField
      FieldName = 'chq_conta'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_chequechq_numero: TIntegerField
      FieldName = 'chq_numero'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequechq_valor: TFMTBCDField
      FieldName = 'chq_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 13
      Size = 2
    end
    object qr_chequechq_dtDepo: TSQLTimeStampField
      FieldName = 'chq_dtDepo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequechq_destino: TStringField
      FieldName = 'chq_destino'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_chequechq_obs: TBlobField
      FieldName = 'chq_obs'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qr_chequedat_inclusao: TSQLTimeStampField
      FieldName = 'dat_inclusao'
      ProviderFlags = [pfInUpdate]
    end
    object qr_chequechq_bompara: TSQLTimeStampField
      FieldName = 'chq_bompara'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qr_update: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = db_Servico
    Left = 624
    Top = 16
  end
  object qr_display: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from display'
      'where dis_id = :_id')
    SQLConnection = db_Servico
    Left = 424
    Top = 1960
    object qr_displaydis_id: TIntegerField
      FieldName = 'dis_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_displaydis_codigo: TStringField
      FieldName = 'dis_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_displaydis_nome: TStringField
      FieldName = 'dis_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_displaydis_ativo: TStringField
      FieldName = 'dis_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_display: TDataSetProvider
    DataSet = qr_display
    Left = 512
    Top = 1960
  end
  object qr_classif_Assinante: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from classif_Assinante'
      'where cas_id = :_id')
    SQLConnection = db_Servico
    Left = 232
    Top = 2032
    object qr_classif_Assinantecas_id: TIntegerField
      FieldName = 'cas_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_classif_Assinantecas_codigo: TStringField
      FieldName = 'cas_codigo'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_classif_Assinantecas_nome: TStringField
      FieldName = 'cas_nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_classif_Assinantecas_ativo: TStringField
      FieldName = 'cas_ativo'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsp_classif_Assinante: TDataSetProvider
    DataSet = qr_classif_Assinante
    BeforeUpdateRecord = dsp_classif_AssinanteBeforeUpdateRecord
    Left = 344
    Top = 2032
  end
  object cds_geral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_geral'
    Left = 744
    Top = 16
  end
  object qr_extrato: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from extrato'
      'where ext_id = :_id')
    SQLConnection = db_Servico
    Left = 792
    Top = 384
    object qr_extratoext_id: TIntegerField
      FieldName = 'ext_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qr_extratoemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_extratoban_codigo: TIntegerField
      FieldName = 'ban_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_extratoext_codban: TIntegerField
      FieldName = 'ext_codban'
      ProviderFlags = [pfInUpdate]
    end
    object qr_extratoext_agencia: TStringField
      FieldName = 'ext_agencia'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_extratoext_conta: TStringField
      FieldName = 'ext_conta'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qr_extratoext_data: TSQLTimeStampField
      FieldName = 'ext_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_extratoext_historico: TStringField
      FieldName = 'ext_historico'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qr_extratoext_docto: TStringField
      FieldName = 'ext_docto'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qr_extratoext_valor: TFMTBCDField
      FieldName = 'ext_valor'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_extratoext_tipmov: TStringField
      FieldName = 'ext_tipmov'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qr_extratoext_idRegistro: TStringField
      FieldName = 'ext_idRegistro'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qr_extratoext_saldo: TFMTBCDField
      FieldName = 'ext_saldo'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object qr_extratoext_conciliado: TStringField
      FieldName = 'ext_conciliado'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qr_extratocon_id: TIntegerField
      FieldName = 'con_id'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_extrato: TDataSetProvider
    DataSet = qr_extrato
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_extratoBeforeUpdateRecord
    Left = 856
    Top = 384
  end
  object qr_prod_saldo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from prod_saldo'
      'where prs_id = :_id')
    SQLConnection = db_Servico
    Left = 496
    Top = 1296
    object qr_prod_saldoprs_id: TIntegerField
      FieldName = 'prs_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_prod_saldoemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_saldopro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_prod_saldoprs_sdAtual: TFMTBCDField
      FieldName = 'prs_sdAtual'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
    object qr_prod_saldoprs_sdDispo: TFMTBCDField
      FieldName = 'prs_sdDispo'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
    object qr_prod_saldoprs_qReservado: TFMTBCDField
      FieldName = 'prs_qReservado'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
  end
  object dsp_prod_saldo: TDataSetProvider
    DataSet = qr_prod_saldo
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 1296
  end
  object qr_reserva: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from reserva'
      'where res_id = :_id')
    SQLConnection = db_Servico
    Left = 448
    Top = 2032
    object qr_reservares_id: TIntegerField
      FieldName = 'res_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_reservaemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object qr_reservapro_id: TIntegerField
      FieldName = 'pro_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_reservaitp_id: TIntegerField
      FieldName = 'itp_id'
      ProviderFlags = [pfInUpdate]
    end
    object qr_reservares_qtda: TFMTBCDField
      FieldName = 'res_qtda'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 4
    end
  end
  object dsp_reserva: TDataSetProvider
    DataSet = qr_reserva
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 544
    Top = 2032
  end
  object cds_reserva: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_reserva'
    Left = 624
    Top = 2032
  end
  object cds_prod_saldo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_prod_saldo'
    Left = 704
    Top = 2032
  end
  object cds_produto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_produto'
    Left = 784
    Top = 1136
  end
  object cds_item_est: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_item_est'
    Left = 784
    Top = 2033
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 912
    Top = 8
  end
  object cds_xmlNFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_geral'
    Left = 808
    Top = 16
  end
  object cds_notafi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_geral'
    Left = 808
    Top = 72
  end
  object cds_cce: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_geral'
    Left = 752
    Top = 72
  end
  object cds_xmlNFe_Web: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_xmlNfe_Web'
    Left = 904
    Top = 144
  end
  object cds_empresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_geral'
    Left = 880
    Top = 72
  end
  object db_Web: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=21.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=21.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'Port=')
    Left = 904
    Top = 312
  end
  object dsp_xmlNfe_Web: TDataSetProvider
    DataSet = qr_xmlNfe_Web
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 904
    Top = 200
  end
  object qr_xmlNfe_Web: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = db_Web
    Left = 904
    Top = 248
  end
  object qr_conciliacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = '_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from conciliacao'
      'where con_id = :_id')
    SQLConnection = db_Servico
    Left = 760
    Top = 208
    object qr_conciliacaocon_id: TIntegerField
      FieldName = 'con_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_conciliacaocon_data: TSQLTimeStampField
      FieldName = 'con_data'
      ProviderFlags = [pfInUpdate]
    end
    object qr_conciliacaousu_codigo: TIntegerField
      FieldName = 'usu_codigo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsp_conciliacao: TDataSetProvider
    DataSet = qr_conciliacao
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dsp_chequeBeforeUpdateRecord
    Left = 816
    Top = 224
  end
end
