
unit Unt_SM;

interface

uses
//   , DB, SqlExpr, FMTBcd,
//  Provider, DBXCommon, DBClient, DbxDatasnap, DSConnect, Variants, ,
//  IPPeerClient,
  System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  Data.DBXMySQL,  IPPeerClient, Data.DBXCommon, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  Datasnap.Provider, WideStrings, INIFiles, Variants,
  DBXDataSnap, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TSMXE7 = class(TDSServerModule)
    db_Servico: TSQLConnection;
    qr_geral: TSQLDataSet;
    dsp_geral: TDataSetProvider;
    db_ADM: TSQLConnection;
    dsp_ADM: TDSProviderConnection;
    cds_K_entidade: TClientDataSet;
    cds_k_geral: TClientDataSet;
    qr_log: TSQLQuery;
    qr_loglog_id: TIntegerField;
    qr_logtpl_codigo: TIntegerField;
    qr_logusu_codigo: TIntegerField;
    qr_loglog_data: TSQLTimeStampField;
    qr_loglog_tabela: TStringField;
    qr_loglog_IDTabela: TStringField;
    qr_loglog_descricao: TBlobField;
    qr_loglog_computer: TStringField;
    qr_loglog_username: TStringField;
    qr_loglog_ip: TStringField;
    dsp_log: TDataSetProvider;
    cds_log: TClientDataSet;
    qr_artigo: TSQLQuery;
    dsp_artigo: TDataSetProvider;
    qr_artigoart_codigo: TIntegerField;
    qr_artigoart_nome: TStringField;
    qr_artigoart_obs: TBlobField;
    qr_artigodat_inclusao: TSQLTimeStampField;
    qr_artigoart_ativo: TStringField;
    qr_anp: TSQLQuery;
    dsp_anp: TDataSetProvider;
    qr_banco: TSQLQuery;
    dsp_banco: TDataSetProvider;
    qr_cce: TSQLQuery;
    qr_cidade: TSQLQuery;
    qr_cobranca: TSQLQuery;
    qr_cofins: TSQLQuery;
    qr_comissao: TSQLQuery;
    qr_compl_orca: TSQLQuery;
    qr_conpag: TSQLQuery;
    dsp_cce: TDataSetProvider;
    dsp_cidade: TDataSetProvider;
    dsp_cobranca: TDataSetProvider;
    dsp_cofins: TDataSetProvider;
    dsp_comissao: TDataSetProvider;
    dsp_compl_orca: TDataSetProvider;
    dsp_conpag: TDataSetProvider;
    qr_conta_email: TSQLQuery;
    qr_deducao_ser: TSQLQuery;
    qr_devolucao: TSQLQuery;
    qr_duplic: TSQLQuery;
    qr_embala: TSQLQuery;
    qr_empresa: TSQLQuery;
    qr_ent_aliq_icms: TSQLQuery;
    qr_ent_imp_cof: TSQLQuery;
    qr_ent_imp_icms: TSQLQuery;
    qr_ent_imp_ipi: TSQLQuery;
    qr_ent_imp_pis: TSQLQuery;
    qr_ent_preco: TSQLQuery;
    qr_entidade: TSQLQuery;
    qr_esquema: TSQLQuery;
    dsp_conta_email: TDataSetProvider;
    dsp_deducao_ser: TDataSetProvider;
    dsp_devolucao: TDataSetProvider;
    dsp_duplic: TDataSetProvider;
    dsp_embala: TDataSetProvider;
    dsp_empresa: TDataSetProvider;
    dsp_ent_aliq_icms: TDataSetProvider;
    dsp_ent_imp_cof: TDataSetProvider;
    dsp_ent_imp_icms: TDataSetProvider;
    dsp_ent_imp_ipi: TDataSetProvider;
    dsp_ent_imp_pis: TDataSetProvider;
    dsp_ent_preco: TDataSetProvider;
    dsp_entidade: TDataSetProvider;
    dsp_esquema: TDataSetProvider;
    qr_fatura: TSQLQuery;
    qr_finaped: TSQLQuery;
    qr_form: TSQLQuery;
    qr_grupro: TSQLQuery;
    qr_habusu: TSQLQuery;
    qr_icms: TSQLQuery;
    qr_ipi: TSQLQuery;
    qr_item_cof: TSQLQuery;
    qr_item_comb: TSQLQuery;
    qr_item_di: TSQLQuery;
    dsp_fatura: TDataSetProvider;
    dsp_finaped: TDataSetProvider;
    dsp_form: TDataSetProvider;
    dsp_grupro: TDataSetProvider;
    dsp_habusu: TDataSetProvider;
    dsp_icms: TDataSetProvider;
    dsp_ipi: TDataSetProvider;
    dsp_item_cof: TDataSetProvider;
    dsp_item_comb: TDataSetProvider;
    dsp_item_di: TDataSetProvider;
    qr_item_est: TSQLQuery;
    qr_item_icms: TSQLQuery;
    qr_item_ii: TSQLQuery;
    qr_item_ipi: TSQLQuery;
    qr_item_issqn: TSQLQuery;
    qr_item_med: TSQLQuery;
    qr_item_not: TSQLQuery;
    qr_item_of: TSQLQuery;
    qr_item_pis: TSQLQuery;
    qr_item_ser: TSQLQuery;
    qr_itemped: TSQLQuery;
    qr_lote: TSQLQuery;
    qr_lote_mov: TSQLQuery;
    qr_maquina: TSQLQuery;
    qr_modbc: TSQLQuery;
    qr_modbcst: TSQLQuery;
    dsp_item_est: TDataSetProvider;
    dsp_item_icms: TDataSetProvider;
    dsp_item_ii: TDataSetProvider;
    dsp_item_ipi: TDataSetProvider;
    dsp_item_issqn: TDataSetProvider;
    dsp_item_med: TDataSetProvider;
    dsp_item_not: TDataSetProvider;
    dsp_item_of: TDataSetProvider;
    dsp_item_pis: TDataSetProvider;
    dsp_item_ser: TDataSetProvider;
    dsp_itemped: TDataSetProvider;
    dsp_lote: TDataSetProvider;
    dsp_lote_mov: TDataSetProvider;
    dsp_maquina: TDataSetProvider;
    dsp_modbc: TDataSetProvider;
    dsp_modbcst: TDataSetProvider;
    qr_modnot: TSQLQuery;
    qr_motorca: TSQLQuery;
    qr_movobra: TSQLQuery;
    qr_nat_imp_cof: TSQLQuery;
    qr_nat_imp_icms: TSQLQuery;
    qr_nat_imp_ipi: TSQLQuery;
    qr_nat_imp_pis: TSQLQuery;
    qr_natfin: TSQLQuery;
    qr_natura: TSQLQuery;
    qr_notafi: TSQLQuery;
    qr_obra: TSQLQuery;
    qr_ordfab: TSQLQuery;
    qr_oripro: TSQLQuery;
    qr_otb: TSQLQuery;
    qr_pais: TSQLQuery;
    dsp_modnot: TDataSetProvider;
    dsp_motorca: TDataSetProvider;
    dsp_movobra: TDataSetProvider;
    dsp_nat_imp_cof: TDataSetProvider;
    dsp_nat_imp_icms: TDataSetProvider;
    dsp_nat_imp_ipi: TDataSetProvider;
    dsp_nat_imp_pis: TDataSetProvider;
    dsp_natfin: TDataSetProvider;
    dsp_natura: TDataSetProvider;
    dsp_notafi: TDataSetProvider;
    dsp_obra: TDataSetProvider;
    dsp_ordfab: TDataSetProvider;
    dsp_oripro: TDataSetProvider;
    dsp_otb: TDataSetProvider;
    dsp_pais: TDataSetProvider;
    qr_pedido: TSQLQuery;
    dsp_pedido: TDataSetProvider;
    qr_pis: TSQLQuery;
    qr_plano: TSQLQuery;
    qr_prod_aliq_icms: TSQLQuery;
    qr_prod_comp: TSQLQuery;
    qr_prod_emba: TSQLQuery;
    qr_prod_imp_cof: TSQLQuery;
    qr_prod_imp_icms: TSQLQuery;
    qr_prod_imp_ipi: TSQLQuery;
    qr_prod_imp_pis: TSQLQuery;
    qr_prod_similar: TSQLQuery;
    qr_prod_tabprec: TSQLQuery;
    qr_produto: TSQLQuery;
    qr_ramati: TSQLQuery;
    qr_reg_deletado: TSQLQuery;
    qr_sequencia: TSQLQuery;
    dsp_pis: TDataSetProvider;
    dsp_plano: TDataSetProvider;
    dsp_prod_aliq_icms: TDataSetProvider;
    dsp_prod_comp: TDataSetProvider;
    dsp_prod_emba: TDataSetProvider;
    dsp_prod_imp_cof: TDataSetProvider;
    dsp_prod_imp_icms: TDataSetProvider;
    dsp_prod_imp_ipi: TDataSetProvider;
    dsp_prod_imp_pis: TDataSetProvider;
    dsp_prod_similar: TDataSetProvider;
    dsp_prod_tabprec: TDataSetProvider;
    dsp_produto: TDataSetProvider;
    dsp_ramati: TDataSetProvider;
    dsp_reg_deletado: TDataSetProvider;
    dsp_sequencia: TDataSetProvider;
    qr_servico: TSQLQuery;
    qr_siafi: TSQLQuery;
    qr_simples: TSQLQuery;
    qr_sitdup: TSQLQuery;
    qr_sitnfe: TSQLQuery;
    qr_sitribu: TSQLQuery;
    qr_solicita: TSQLQuery;
    qr_statusped: TSQLQuery;
    qr_tabban: TSQLQuery;
    qr_tabprec: TSQLQuery;
    qr_telefone: TSQLQuery;
    qr_tipest: TSQLQuery;
    qr_tiplog: TSQLQuery;
    qr_tipped: TSQLQuery;
    qr_tippro: TSQLQuery;
    qr_tiptel: TSQLQuery;
    qr_uf: TSQLQuery;
    qr_unimed: TSQLQuery;
    qr_usuario: TSQLQuery;
    qr_vende: TSQLQuery;
    qr_volume: TSQLQuery;
    dsp_servico: TDataSetProvider;
    dsp_siafi: TDataSetProvider;
    dsp_simples: TDataSetProvider;
    dsp_sitdup: TDataSetProvider;
    dsp_sitnfe: TDataSetProvider;
    dsp_sitribu: TDataSetProvider;
    dsp_solicita: TDataSetProvider;
    dsp_statusped: TDataSetProvider;
    dsp_tabban: TDataSetProvider;
    dsp_tabprec: TDataSetProvider;
    dsp_telefone: TDataSetProvider;
    dsp_tipest: TDataSetProvider;
    dsp_tiplog: TDataSetProvider;
    dsp_tipped: TDataSetProvider;
    dsp_tippro: TDataSetProvider;
    dsp_tiptel: TDataSetProvider;
    dsp_uf: TDataSetProvider;
    dsp_unimed: TDataSetProvider;
    dsp_usuario: TDataSetProvider;
    dsp_vende: TDataSetProvider;
    dsp_volume: TDataSetProvider;
    qr_anpanp_id: TIntegerField;
    qr_anpanp_codigo: TStringField;
    qr_anpanp_nome: TStringField;
    qr_anpanp_ativo: TStringField;
    qr_bancoban_codigo: TIntegerField;
    qr_bancotba_codigo: TStringField;
    qr_bancoban_nome: TStringField;
    qr_bancoban_agencia: TStringField;
    qr_bancoban_digage: TStringField;
    qr_bancoban_conta: TStringField;
    qr_bancoban_digcon: TStringField;
    qr_bancocontrole: TStringField;
    qr_bancodat_inclusao: TSQLTimeStampField;
    qr_bancoban_ativo: TStringField;
    qr_bancoban_cedNome: TStringField;
    qr_bancoban_cedCodigo: TStringField;
    qr_bancoban_especieDoc: TStringField;
    qr_bancoban_aceite: TStringField;
    qr_bancoban_carteira: TStringField;
    qr_bancoban_diasProt: TIntegerField;
    qr_bancoban_pMulta: TFMTBCDField;
    qr_bancoban_Mensagem: TBlobField;
    qr_bancoban_Instrucao1: TStringField;
    qr_bancoban_Instrucao2: TStringField;
    qr_bancoban_nossoNro: TIntegerField;
    qr_bancoban_Modalidade: TStringField;
    qr_bancoban_Convenio: TStringField;
    qr_bancoban_transmissao: TStringField;
    qr_bancoban_pJuros: TFMTBCDField;
    qr_ccecce_id: TIntegerField;
    qr_ccenot_id: TIntegerField;
    qr_ccecce_sequencia: TIntegerField;
    qr_ccecce_data: TSQLTimeStampField;
    qr_ccecce_obs: TBlobField;
    qr_ccecce_nProt: TStringField;
    qr_ccecce_XML: TBlobField;
    qr_cidadecid_id: TIntegerField;
    qr_cidadecid_codigo: TStringField;
    qr_cidadecid_nome: TStringField;
    qr_cidadeuf_codigo: TStringField;
    qr_cidadedat_inclusao: TSQLTimeStampField;
    qr_cidadecid_siafi: TStringField;
    qr_cobrancacob_id: TIntegerField;
    qr_cobrancaemp_codigo: TIntegerField;
    qr_cobrancaban_codigo: TIntegerField;
    qr_cobrancacob_data: TSQLTimeStampField;
    qr_cobrancacob_arquivo: TStringField;
    qr_cofinscof_id: TIntegerField;
    qr_cofinscof_pCOFINS: TFMTBCDField;
    qr_cofinsdat_inclusao: TSQLTimeStampField;
    qr_comissaocom_id: TIntegerField;
    qr_comissaoven_codigo: TIntegerField;
    qr_comissaocom_data: TSQLTimeStampField;
    qr_comissaocom_historico: TStringField;
    qr_comissaocom_valor: TFMTBCDField;
    qr_compl_orcacor_codigo: TIntegerField;
    qr_compl_orcacor_nome: TBlobField;
    qr_compl_orcacor_ativo: TStringField;
    qr_compl_orcadat_inclusao: TSQLTimeStampField;
    qr_conpagcpg_id: TIntegerField;
    qr_conpagnot_id: TIntegerField;
    qr_conpagcpg_dias: TIntegerField;
    qr_conpagdat_inclusao: TSQLTimeStampField;
    qr_conpagped_id: TIntegerField;
    qr_conpagcpg_qtdpar: TIntegerField;
    qr_conpagsdp_codigo: TIntegerField;
    qr_conpagcpg_vencto: TSQLTimeStampField;
    qr_conpagcpg_valor: TFMTBCDField;
    qr_conta_emailema_id: TIntegerField;
    qr_conta_emailema_nome: TStringField;
    qr_conta_emailema_usu_email: TStringField;
    qr_conta_emailema_smtp: TStringField;
    qr_conta_emailema_pop3: TStringField;
    qr_conta_emailema_porta: TIntegerField;
    qr_conta_emailema_usu_login: TStringField;
    qr_conta_emailema_senha: TStringField;
    qr_conta_emailema_autentica: TStringField;
    qr_conta_emailema_tsl: TIntegerField;
    qr_conta_emailema_ssl: TStringField;
    qr_conta_emailema_metodo: TIntegerField;
    qr_deducao_serded_id: TIntegerField;
    qr_deducao_serser_id: TIntegerField;
    qr_deducao_serded_Deducao: TStringField;
    qr_deducao_serded_Tipo: TStringField;
    qr_deducao_serded_vTotal: TFMTBCDField;
    qr_deducao_serded_pDeduzir: TFMTBCDField;
    qr_deducao_serded_vDeduzir: TFMTBCDField;
    qr_deducao_serdat_inclusao: TSQLTimeStampField;
    qr_devolucaodev_id: TIntegerField;
    qr_devolucaoemp_codigo: TIntegerField;
    qr_devolucaodev_ano: TIntegerField;
    qr_devolucaodev_mes: TStringField;
    qr_devolucaodev_valor: TFMTBCDField;
    qr_devolucaodev_destinatario: TStringField;
    qr_devolucaodev_nroNota: TStringField;
    qr_devolucaodev_dtNota: TSQLTimeStampField;
    qr_devolucaodev_obs: TBlobField;
    qr_devolucaodat_inclusao: TSQLTimeStampField;
    qr_duplicdup_id: TIntegerField;
    qr_duplicnot_id: TIntegerField;
    qr_duplicdup_numero: TStringField;
    qr_duplicdup_parcela: TIntegerField;
    qr_duplicdup_vencto: TSQLTimeStampField;
    qr_duplicdup_valor: TFMTBCDField;
    qr_duplicdat_inclusao: TSQLTimeStampField;
    qr_duplicser_id: TIntegerField;
    qr_duplicemp_codigo: TIntegerField;
    qr_duplicent_id: TIntegerField;
    qr_duplicpla_id: TIntegerField;
    qr_duplicdup_tipo: TStringField;
    qr_duplicban_codigo: TIntegerField;
    qr_duplicsdp_codigo: TIntegerField;
    qr_duplicnaf_codigo: TIntegerField;
    qr_duplicdup_datemi: TSQLTimeStampField;
    qr_duplicdup_datpag: TSQLTimeStampField;
    qr_duplicdup_valpag: TFMTBCDField;
    qr_duplicdup_valjur: TFMTBCDField;
    qr_duplicdup_valdes: TFMTBCDField;
    qr_duplicdup_valdev: TFMTBCDField;
    qr_duplicdup_saldo: TFMTBCDField;
    qr_duplicdup_obs: TBlobField;
    qr_duplicdup_numchq: TIntegerField;
    qr_duplicdup_dtCompe: TSQLTimeStampField;
    qr_duplicdup_ctacor: TStringField;
    qr_duplicdup_salatu: TFMTBCDField;
    qr_duplicore_codigo: TStringField;
    qr_duplicdup_ocoRetorno: TStringField;
    qr_duplicdup_ocoNome: TStringField;
    qr_dupliccob_id: TIntegerField;
    qr_duplicdup_nossoNro: TIntegerField;
    qr_duplicdup_cancel: TStringField;
    qr_embalaemb_id: TIntegerField;
    qr_embalaemb_codigo: TStringField;
    qr_embalaemb_nome: TStringField;
    qr_embalaemb_ativo: TStringField;
    qr_embaladat_inclusao: TSQLTimeStampField;
    qr_empresaemp_codigo: TIntegerField;
    qr_empresaemp_nome: TStringField;
    qr_empresaemp_razao: TStringField;
    qr_empresaemp_endereco: TStringField;
    qr_empresaemp_numero: TStringField;
    qr_empresaemp_comple: TStringField;
    qr_empresaemp_bairro: TStringField;
    qr_empresaemp_cidade: TStringField;
    qr_empresacid_codigo: TStringField;
    qr_empresauf_codigo: TStringField;
    qr_empresapai_codigo: TIntegerField;
    qr_empresaemp_cep: TStringField;
    qr_empresaemp_cnpj: TStringField;
    qr_empresaemp_ie: TStringField;
    qr_empresaemp_ie_st: TStringField;
    qr_empresaemp_im: TStringField;
    qr_empresaemp_cnae: TStringField;
    qr_empresaemp_regtrib: TIntegerField;
    qr_empresaemp_email: TStringField;
    qr_empresaemp_homepage: TStringField;
    qr_empresaemp_fone: TStringField;
    qr_empresaemp_fax: TStringField;
    qr_empresaemp_nfe: TStringField;
    qr_empresadat_inclusao: TSQLTimeStampField;
    qr_empresaemp_ativo: TStringField;
    qr_empresaemp_simples: TStringField;
    qr_empresanat_codigo: TIntegerField;
    qr_empresaemp_tpAmb: TIntegerField;
    qr_empresaemp_qCom: TIntegerField;
    qr_empresaemp_vUnCom: TIntegerField;
    qr_empresaemp_tpIMP: TIntegerField;
    qr_empresaemp_serie: TStringField;
    qr_empresaemp_serieDPEC: TStringField;
    qr_empresaemp_ultnota: TIntegerField;
    qr_empresaemp_smtp: TStringField;
    qr_empresaemp_porta: TIntegerField;
    qr_empresaemp_usu_email: TStringField;
    qr_empresaemp_usu_login: TStringField;
    qr_empresaemp_senha_email: TStringField;
    qr_empresaemp_aute_email: TStringField;
    qr_empresaemp_imprimirSaida: TStringField;
    qr_empresaemp_CerNumSerie: TStringField;
    qr_empresaemp_TpEnvioEmail: TStringField;
    qr_empresaemp_chaveAcesso: TStringField;
    qr_empresaemp_dtValidade: TSQLTimeStampField;
    qr_empresaemp_bkpAuto: TStringField;
    qr_empresaemp_dtValidaCert: TSQLTimeStampField;
    qr_empresaemp_logo: TStringField;
    qr_empresaemp_pop3: TStringField;
    qr_empresaemp_tamFonteCodpro: TIntegerField;
    qr_empresaemp_tsl: TIntegerField;
    qr_empresaemp_ssl: TStringField;
    qr_empresaemp_metodo: TIntegerField;
    qr_empresaemp_entEnde: TStringField;
    qr_empresaemp_entNume: TStringField;
    qr_empresaemp_entComp: TStringField;
    qr_empresaemp_entBair: TStringField;
    qr_empresaemp_entCida: TStringField;
    qr_empresaemp_entUF: TStringField;
    qr_empresaemp_entCep: TStringField;
    qr_empresaemp_cobEnde: TStringField;
    qr_empresaemp_cobNume: TStringField;
    qr_empresaemp_cobComp: TStringField;
    qr_empresaemp_cobBair: TStringField;
    qr_empresaemp_cobCida: TStringField;
    qr_empresaemp_cobUF: TStringField;
    qr_empresaemp_cobCep: TStringField;
    qr_empresaemp_cnaeP: TStringField;
    qr_empresaemp_cnaeS: TStringField;
    qr_empresaemp_pISS: TFMTBCDField;
    qr_empresaemp_pPIS: TFMTBCDField;
    qr_empresaemp_pCofins: TFMTBCDField;
    qr_empresaemp_pCSLL: TFMTBCDField;
    qr_empresaemp_pINSS: TFMTBCDField;
    qr_empresaemp_pIR: TFMTBCDField;
    qr_empresaemp_dtEstoque: TSQLTimeStampField;
    qr_empresaemp_emailACBr: TStringField;
    qr_empresaemp_PctAcesso: TIntegerField;
    qr_empresacid_siafi: TStringField;
    qr_empresaemp_block_Ped: TStringField;
    qr_empresaemp_Ocultar_prod: TStringField;
    qr_empresaemp_obsPedven: TBlobField;
    qr_empresaemp_obsPedcom: TBlobField;
    qr_empresaemp_Ocultar_ProNomeNFe: TStringField;
    qr_empresaemp_diasBlockFin: TIntegerField;
    qr_empresaemp_validade: TStringField;
    qr_empresaemp_blockPedCompra: TStringField;
    qr_empresaemp_blockPedVenda: TStringField;
    qr_empresasdp_codigo: TIntegerField;
    qr_empresaban_codigo: TIntegerField;
    qr_empresaemp_ReservaProd: TStringField;
    qr_empresaemp_DiasReserva: TIntegerField;
    qr_empresaemp_Ocultar_ProNomeOF: TStringField;
    qr_empresaemp_Ocultar_Rodape: TStringField;
    qr_empresaemp_precoTab: TIntegerField;
    qr_empresaemp_blockPrintPedido: TStringField;
    qr_empresaemp_tpBoleto: TIntegerField;
    qr_ent_aliq_icmsicm_id: TIntegerField;
    qr_ent_aliq_icmsent_id: TIntegerField;
    qr_ent_aliq_icmsicm_ufOrig: TStringField;
    qr_ent_aliq_icmsicm_ufDest: TStringField;
    qr_ent_aliq_icmsicm_pICMS: TFMTBCDField;
    qr_ent_aliq_icmsicm_pICMSFrete: TFMTBCDField;
    qr_ent_aliq_icmsicm_pDifere: TFMTBCDField;
    qr_ent_aliq_icmsicm_pICMSST: TFMTBCDField;
    qr_ent_aliq_icmsicm_pBC: TFMTBCDField;
    qr_ent_aliq_icmsicm_pRedBC: TFMTBCDField;
    qr_ent_aliq_icmsicm_vPauta: TFMTBCDField;
    qr_ent_aliq_icmsicm_pBCST: TFMTBCDField;
    qr_ent_aliq_icmsicm_pRedBCST: TFMTBCDField;
    qr_ent_aliq_icmsicm_pIVA: TFMTBCDField;
    qr_ent_aliq_icmsicm_vPautaST: TFMTBCDField;
    qr_ent_aliq_icmsicm_pOperaPro: TFMTBCDField;
    qr_ent_aliq_icmsdat_inclusao: TSQLTimeStampField;
    qr_ent_imp_cofcof_id: TIntegerField;
    qr_ent_imp_cofent_id: TIntegerField;
    qr_ent_imp_cofcof_cst: TStringField;
    qr_ent_imp_cofcof_esquema: TIntegerField;
    qr_ent_imp_cofcof_cstST: TStringField;
    qr_ent_imp_cofcof_esquemaST: TIntegerField;
    qr_ent_imp_cofcof_tpAliq: TIntegerField;
    qr_ent_imp_cofdat_inclusao: TSQLTimeStampField;
    qr_ent_imp_icmsicm_id: TIntegerField;
    qr_ent_imp_icmsent_id: TIntegerField;
    qr_ent_imp_icmsicm_cst: TStringField;
    qr_ent_imp_icmsicm_modBC: TIntegerField;
    qr_ent_imp_icmsicm_modBCST: TIntegerField;
    qr_ent_imp_icmsicm_esquema: TIntegerField;
    qr_ent_imp_icmsicm_esquemaST: TIntegerField;
    qr_ent_imp_icmsicm_tpAliq: TIntegerField;
    qr_ent_imp_icmsdat_inclusao: TSQLTimeStampField;
    qr_ent_imp_icmsicm_csosn: TStringField;
    qr_ent_imp_ipiipi_id: TIntegerField;
    qr_ent_imp_ipient_id: TIntegerField;
    qr_ent_imp_ipiipi_cst: TStringField;
    qr_ent_imp_ipiipi_esquema: TIntegerField;
    qr_ent_imp_ipiipi_tpAliq: TIntegerField;
    qr_ent_imp_ipidat_inclusao: TSQLTimeStampField;
    qr_ent_imp_pispis_id: TIntegerField;
    qr_ent_imp_pisent_id: TIntegerField;
    qr_ent_imp_pispis_cst: TStringField;
    qr_ent_imp_pispis_esquema: TIntegerField;
    qr_ent_imp_pispis_cstST: TStringField;
    qr_ent_imp_pispis_esquemaST: TIntegerField;
    qr_ent_imp_pispis_tpAliq: TIntegerField;
    qr_ent_imp_pisdat_inclusao: TSQLTimeStampField;
    qr_ent_precoepr_id: TIntegerField;
    qr_ent_precoent_id: TIntegerField;
    qr_ent_precopro_id: TIntegerField;
    qr_ent_precoepr_preco: TFMTBCDField;
    qr_ent_precodat_inclusao: TSQLTimeStampField;
    qr_entidadeent_id: TIntegerField;
    qr_entidadeent_nome: TStringField;
    qr_entidadeent_razao: TStringField;
    qr_entidadeent_endereco: TStringField;
    qr_entidadeent_numero: TStringField;
    qr_entidadeent_comple: TStringField;
    qr_entidadeent_bairro: TStringField;
    qr_entidadeent_cidade: TStringField;
    qr_entidadeent_cep: TStringField;
    qr_entidadecid_codigo: TStringField;
    qr_entidadepai_codigo: TIntegerField;
    qr_entidadeuf_codigo: TStringField;
    qr_entidadeent_cnpj: TStringField;
    qr_entidadeent_cpf: TStringField;
    qr_entidadeent_ie: TStringField;
    qr_entidadeent_rg: TStringField;
    qr_entidadeent_im: TStringField;
    qr_entidadeent_suframa: TStringField;
    qr_entidadeent_homepage: TStringField;
    qr_entidadeent_email: TStringField;
    qr_entidadeent_cliente: TStringField;
    qr_entidadeent_forne: TStringField;
    qr_entidadeent_transp: TStringField;
    qr_entidadeent_fone: TStringField;
    qr_entidadedat_inclusao: TSQLTimeStampField;
    qr_entidadeent_ativo: TStringField;
    qr_entidadeven_codigo: TIntegerField;
    qr_entidadeent_entEnde: TStringField;
    qr_entidadeent_entNume: TStringField;
    qr_entidadeent_entComp: TStringField;
    qr_entidadeent_entBair: TStringField;
    qr_entidadeent_entCida: TStringField;
    qr_entidadeent_entUF: TStringField;
    qr_entidadeent_entCep: TStringField;
    qr_entidadeent_cobEnde: TStringField;
    qr_entidadeent_cobNume: TStringField;
    qr_entidadeent_cobComp: TStringField;
    qr_entidadeent_cobBair: TStringField;
    qr_entidadeent_cobCida: TStringField;
    qr_entidadeent_cobUF: TStringField;
    qr_entidadeent_cobCep: TStringField;
    qr_entidadeent_bcNome: TStringField;
    qr_entidadeent_bcConta: TStringField;
    qr_entidadeent_bcAgencia: TStringField;
    qr_entidadeent_block: TStringField;
    qr_entidaderat_codigo: TIntegerField;
    qr_entidadeent_idTransp: TIntegerField;
    qr_entidadeent_simples: TStringField;
    qr_entidadeent_frete: TIntegerField;
    qr_entidadeent_contato: TStringField;
    qr_entidadeent_email_com: TStringField;
    qr_entidadeent_obs: TBlobField;
    qr_entidadeent_conFinal: TStringField;
    qr_entidadeent_contrICMS: TStringField;
    qr_entidadeent_entHorario: TStringField;
    qr_entidadeent_conpag: TStringField;
    qr_entidadeent_DiasEntrega: TIntegerField;
    qr_entidadetbp_codigo: TIntegerField;
    qr_entidadeent_limite: TFMTBCDField;
    qr_esquemaesq_codigo: TIntegerField;
    qr_esquemaesq_nome: TStringField;
    qr_faturafat_id: TIntegerField;
    qr_faturaemp_codigo: TIntegerField;
    qr_faturafat_ano: TStringField;
    qr_faturafat_mes: TStringField;
    qr_faturafat_valor: TFMTBCDField;
    qr_faturacontrole: TStringField;
    qr_faturadat_inclusao: TSQLTimeStampField;
    qr_faturafat_vlCancelada: TFMTBCDField;
    qr_faturafat_vlDevolucao: TFMTBCDField;
    qr_finapedfip_codigo: TIntegerField;
    qr_finapedfip_nome: TStringField;
    qr_finapedcontrole: TStringField;
    qr_finapeddat_inclusao: TSQLTimeStampField;
    qr_finapedfip_ativo: TStringField;
    qr_finapedfip_compra: TStringField;
    qr_finapedfip_venda: TStringField;
    qr_finapedfip_servico: TStringField;
    qr_formfrm_id: TIntegerField;
    qr_formfrm_modulo: TStringField;
    qr_formfrm_form: TStringField;
    qr_formfrm_nome: TStringField;
    qr_formfrm_executar: TStringField;
    qr_formfrm_incluir: TStringField;
    qr_formfrm_editar: TStringField;
    qr_formfrm_excluir: TStringField;
    qr_formfrm_visualizar: TStringField;
    qr_formfrm_imprimir: TStringField;
    qr_gruprogrp_id: TIntegerField;
    qr_gruprogrp_codigo: TStringField;
    qr_gruprogrp_nome: TStringField;
    qr_gruprocontrole: TStringField;
    qr_gruprodat_inclusao: TSQLTimeStampField;
    qr_gruprogrp_ativo: TStringField;
    qr_habusuhab_id: TIntegerField;
    qr_habusufrm_id: TIntegerField;
    qr_habusuemp_codigo: TIntegerField;
    qr_habusuusu_codigo: TIntegerField;
    qr_habusuhab_executar: TStringField;
    qr_habusuhab_incluir: TStringField;
    qr_habusuhab_editar: TStringField;
    qr_habusuhab_excluir: TStringField;
    qr_habusuhab_visualizar: TStringField;
    qr_habusuhab_imprimir: TStringField;
    qr_habusudat_inclusao: TSQLTimeStampField;
    qr_icmsicm_id: TIntegerField;
    qr_icmsicm_ufOrig: TStringField;
    qr_icmsicm_ufDest: TStringField;
    qr_icmsicm_pICMS: TFMTBCDField;
    qr_icmsicm_pICMSFrete: TFMTBCDField;
    qr_icmsicm_pDifere: TFMTBCDField;
    qr_icmsicm_pICMSST: TFMTBCDField;
    qr_icmsicm_pBC: TFMTBCDField;
    qr_icmsicm_pRedBC: TFMTBCDField;
    qr_icmsicm_vPauta: TFMTBCDField;
    qr_icmsicm_pBCST: TFMTBCDField;
    qr_icmsicm_pRedBCST: TFMTBCDField;
    qr_icmsicm_pIVA: TFMTBCDField;
    qr_icmsicm_vPautaST: TFMTBCDField;
    qr_icmsicm_pOperaPro: TFMTBCDField;
    qr_icmsicm_ativo: TStringField;
    qr_icmsdat_inclusao: TSQLTimeStampField;
    qr_ipiipi_id: TIntegerField;
    qr_ipincm_codigo: TStringField;
    qr_ipiipi_pIPI: TFMTBCDField;
    qr_ipiipi_pBC: TFMTBCDField;
    qr_ipiipi_ativo: TStringField;
    qr_ipidat_inclusao: TSQLTimeStampField;
    qr_ipiipi_pIBPT_Nac: TFMTBCDField;
    qr_ipiipi_pIBPT_Imp: TFMTBCDField;
    qr_item_cofcof_id: TIntegerField;
    qr_item_cofite_id: TIntegerField;
    qr_item_cofnot_id: TIntegerField;
    qr_item_cofcof_cst: TStringField;
    qr_item_cofcof_vBC: TFMTBCDField;
    qr_item_cofcof_pCofins: TFMTBCDField;
    qr_item_cofcof_vCofins: TFMTBCDField;
    qr_item_cofcof_vBCProd: TFMTBCDField;
    qr_item_cofcof_vAliqProd: TFMTBCDField;
    qr_item_cofcof_qBCProd: TFMTBCDField;
    qr_item_cofcof_vBCST: TFMTBCDField;
    qr_item_cofcof_pBCST: TFMTBCDField;
    qr_item_cofcof_pCofinsST: TFMTBCDField;
    qr_item_cofcof_qBCProdST: TFMTBCDField;
    qr_item_cofcof_vAliqProdST: TFMTBCDField;
    qr_item_cofcof_vCofinsST: TFMTBCDField;
    qr_item_cofite_atualiza: TStringField;
    qr_item_cofdat_inclusao: TSQLTimeStampField;
    qr_item_combico_id: TIntegerField;
    qr_item_combite_id: TIntegerField;
    qr_item_combnot_id: TIntegerField;
    qr_item_combanp_codigo: TStringField;
    qr_item_combico_codif: TStringField;
    qr_item_combico_qTemp: TFMTBCDField;
    qr_item_combico_UFCons: TStringField;
    qr_item_combico_qBCProd: TFMTBCDField;
    qr_item_combico_vAliqProd: TFMTBCDField;
    qr_item_combico_vCide: TFMTBCDField;
    qr_item_diidi_id: TIntegerField;
    qr_item_diite_id: TIntegerField;
    qr_item_dinot_id: TIntegerField;
    qr_item_diidi_nDI: TStringField;
    qr_item_diidi_dDI: TSQLTimeStampField;
    qr_item_diidi_xLocDesemb: TStringField;
    qr_item_diidi_UFDesemb: TStringField;
    qr_item_diidi_dDesemb: TSQLTimeStampField;
    qr_item_diidi_cExportador: TStringField;
    qr_item_diidi_nAdicao: TIntegerField;
    qr_item_diidi_nSeqAdi: TIntegerField;
    qr_item_diidi_cFabricante: TStringField;
    qr_item_diidi_vDescDI: TFMTBCDField;
    qr_item_didat_inclusao: TSQLTimeStampField;
    qr_item_esties_id: TIntegerField;
    qr_item_esties_data: TSQLTimeStampField;
    qr_item_estite_id: TIntegerField;
    qr_item_estnot_id: TIntegerField;
    qr_item_esttpe_codigo: TIntegerField;
    qr_item_estpro_id: TIntegerField;
    qr_item_estuni_codigo: TStringField;
    qr_item_esties_qtda: TFMTBCDField;
    qr_item_esties_tipo: TStringField;
    qr_item_esties_docto: TStringField;
    qr_item_esties_historico: TStringField;
    qr_item_estdat_inclusao: TSQLTimeStampField;
    qr_item_estven_codigo: TIntegerField;
    qr_item_estorf_id: TIntegerField;
    qr_item_estiof_id: TIntegerField;
    qr_item_estped_id: TIntegerField;
    qr_item_esties_numreq: TIntegerField;
    qr_item_estobr_id: TIntegerField;
    qr_item_icmsicm_id: TIntegerField;
    qr_item_icmsite_id: TIntegerField;
    qr_item_icmsnot_id: TIntegerField;
    qr_item_icmsicm_cst: TStringField;
    qr_item_icmsicm_modBC: TIntegerField;
    qr_item_icmsicm_pRedBC: TFMTBCDField;
    qr_item_icmsicm_vBC: TFMTBCDField;
    qr_item_icmsicm_pBC: TFMTBCDField;
    qr_item_icmsicm_pICMS: TFMTBCDField;
    qr_item_icmsicm_vICMS: TFMTBCDField;
    qr_item_icmsicm_modBCST: TIntegerField;
    qr_item_icmsicm_pIVA: TFMTBCDField;
    qr_item_icmsicm_pRedBCST: TFMTBCDField;
    qr_item_icmsicm_vBCST: TFMTBCDField;
    qr_item_icmsicm_pBCST: TFMTBCDField;
    qr_item_icmsicm_pICMSST: TFMTBCDField;
    qr_item_icmsicm_vICMSST: TFMTBCDField;
    qr_item_icmsicm_vPauta: TFMTBCDField;
    qr_item_icmsicm_pOperaPro: TFMTBCDField;
    qr_item_icmsicm_vPautaST: TFMTBCDField;
    qr_item_icmsite_atualiza: TStringField;
    qr_item_icmsdat_inclusao: TSQLTimeStampField;
    qr_item_icmsicm_csosn: TStringField;
    qr_item_icmsicm_pCredSN: TFMTBCDField;
    qr_item_icmsicm_vCredICMSSN: TFMTBCDField;
    qr_item_iiiim_id: TIntegerField;
    qr_item_iiite_id: TIntegerField;
    qr_item_iinot_id: TIntegerField;
    qr_item_iiiim_vBC: TFMTBCDField;
    qr_item_iiiim_vDespAdu: TFMTBCDField;
    qr_item_iiiim_vII: TFMTBCDField;
    qr_item_iiiim_vIOF: TFMTBCDField;
    qr_item_iiite_atualiza: TStringField;
    qr_item_iidat_inclusao: TSQLTimeStampField;
    qr_item_iiiim_vIPI: TFMTBCDField;
    qr_item_iiiim_vTaxa: TFMTBCDField;
    qr_item_iiiim_vPis: TFMTBCDField;
    qr_item_iiiim_vCofins: TFMTBCDField;
    qr_item_ipiipi_id: TIntegerField;
    qr_item_ipiite_id: TIntegerField;
    qr_item_ipinot_id: TIntegerField;
    qr_item_ipiipi_clEnq: TStringField;
    qr_item_ipiipi_CNPJProd: TStringField;
    qr_item_ipiipi_cSelo: TStringField;
    qr_item_ipiipi_qSelo: TIntegerField;
    qr_item_ipiipi_cEnq: TStringField;
    qr_item_ipiipi_cst: TStringField;
    qr_item_ipiipi_vBC: TFMTBCDField;
    qr_item_ipiipi_pBC: TFMTBCDField;
    qr_item_ipiipi_qUnid: TFMTBCDField;
    qr_item_ipiipi_vUnid: TFMTBCDField;
    qr_item_ipiipi_pIPI: TFMTBCDField;
    qr_item_ipiipi_vIPI: TFMTBCDField;
    qr_item_ipiite_atualiza: TStringField;
    qr_item_ipidat_inclusao: TSQLTimeStampField;
    qr_item_issqniss_id: TIntegerField;
    qr_item_issqnite_id: TIntegerField;
    qr_item_issqnnot_id: TIntegerField;
    qr_item_issqniss_vBC: TFMTBCDField;
    qr_item_issqniss_vAliq: TFMTBCDField;
    qr_item_issqniss_vISSQN: TFMTBCDField;
    qr_item_issqniss_cMunFG: TIntegerField;
    qr_item_issqniss_cListServ: TIntegerField;
    qr_item_issqnite_atualiza: TStringField;
    qr_item_issqndat_inclusao: TSQLTimeStampField;
    qr_item_medime_id: TIntegerField;
    qr_item_medite_id: TIntegerField;
    qr_item_mednot_id: TIntegerField;
    qr_item_medime_nLote: TStringField;
    qr_item_medime_qLote: TFMTBCDField;
    qr_item_medime_dFab: TSQLTimeStampField;
    qr_item_medime_dVal: TSQLTimeStampField;
    qr_item_medime_vPMC: TFMTBCDField;
    qr_item_meddat_inclusao: TSQLTimeStampField;
    qr_item_notite_id: TIntegerField;
    qr_item_notnot_id: TIntegerField;
    qr_item_notpro_id: TIntegerField;
    qr_item_notite_comple: TBlobField;
    qr_item_notncm_codigo: TStringField;
    qr_item_notite_extipi: TStringField;
    qr_item_notnat_codigo: TIntegerField;
    qr_item_notuni_codigo: TStringField;
    qr_item_notite_qtda: TFMTBCDField;
    qr_item_notite_preco: TFMTBCDField;
    qr_item_notite_vProd: TFMTBCDField;
    qr_item_notite_vFrete: TFMTBCDField;
    qr_item_notite_vSeg: TFMTBCDField;
    qr_item_notite_vDesc: TFMTBCDField;
    qr_item_notite_vOutro: TFMTBCDField;
    qr_item_notite_IndTot: TIntegerField;
    qr_item_notite_vLucro: TFMTBCDField;
    qr_item_notdat_inclusao: TSQLTimeStampField;
    qr_item_notite_xPed: TStringField;
    qr_item_notite_nItemPed: TIntegerField;
    qr_item_notped_id: TIntegerField;
    qr_item_notitp_item: TIntegerField;
    qr_item_notite_pComissao: TFMTBCDField;
    qr_item_notite_vComissao: TFMTBCDField;
    qr_item_notobr_id: TIntegerField;
    qr_item_notite_vTotTrib: TFMTBCDField;
    qr_item_ofiof_id: TIntegerField;
    qr_item_oforf_id: TIntegerField;
    qr_item_ofiof_item: TIntegerField;
    qr_item_ofpro_id: TIntegerField;
    qr_item_ofiof_qtda: TFMTBCDField;
    qr_item_ofiof_lote: TStringField;
    qr_item_ofiof_pH: TStringField;
    qr_item_ofiof_tempo: TStringField;
    qr_item_ofiof_qtdre: TFMTBCDField;
    qr_item_ofiof_perda: TFMTBCDField;
    qr_item_pispis_id: TIntegerField;
    qr_item_pisite_id: TIntegerField;
    qr_item_pisnot_id: TIntegerField;
    qr_item_pispis_cst: TStringField;
    qr_item_pispis_vBC: TFMTBCDField;
    qr_item_pispis_pPIS: TFMTBCDField;
    qr_item_pispis_vPIS: TFMTBCDField;
    qr_item_pispis_qBCProd: TFMTBCDField;
    qr_item_pispis_vAliqProd: TFMTBCDField;
    qr_item_pispis_vBCST: TFMTBCDField;
    qr_item_pispis_pPISST: TFMTBCDField;
    qr_item_pispis_qBCProdST: TFMTBCDField;
    qr_item_pispis_vAliqProdST: TFMTBCDField;
    qr_item_pispis_vPISST: TFMTBCDField;
    qr_item_pisite_atualiza: TStringField;
    qr_item_pisdat_inclusao: TSQLTimeStampField;
    qr_item_serise_id: TIntegerField;
    qr_item_serser_id: TIntegerField;
    qr_item_serpro_id: TIntegerField;
    qr_item_serise_qtda: TFMTBCDField;
    qr_item_serise_vUnit: TFMTBCDField;
    qr_item_serise_vTotal: TFMTBCDField;
    qr_item_serise_Tributa: TStringField;
    qr_item_serdat_inclusao: TSQLTimeStampField;
    qr_item_serped_id: TIntegerField;
    qr_item_seritp_item: TIntegerField;
    qr_itempeditp_id: TIntegerField;
    qr_itempedped_id: TIntegerField;
    qr_itempedrem_id: TIntegerField;
    qr_itempeditp_item: TIntegerField;
    qr_itempeditp_posetm: TIntegerField;
    qr_itempedstp_codigo: TIntegerField;
    qr_itempedpro_id: TIntegerField;
    qr_itempedpem_id: TIntegerField;
    qr_itempeditp_comple: TBlobField;
    qr_itempeditp_qtda: TFMTBCDField;
    qr_itempeditp_preco: TFMTBCDField;
    qr_itempeditp_valmer: TFMTBCDField;
    qr_itempeditp_ipi: TFMTBCDField;
    qr_itempeditp_valipi: TFMTBCDField;
    qr_itempeditp_valtot: TFMTBCDField;
    qr_itempeditp_prazo_pcp: TSQLTimeStampField;
    qr_itempeditp_prazo_comp: TSQLTimeStampField;
    qr_itempeditp_cancel: TStringField;
    qr_itempeditp_compri: TIntegerField;
    qr_itempeditp_largura: TIntegerField;
    qr_itempeditp_estcom: TStringField;
    qr_itempedusu_codigo: TIntegerField;
    qr_itempedemp_codigo: TIntegerField;
    qr_itempeditp_pComissao: TFMTBCDField;
    qr_itempeddat_inclusao: TSQLTimeStampField;
    qr_itempeditp_vComissao: TFMTBCDField;
    qr_itempeditp_pzEntrega: TSQLTimeStampField;
    qr_itempeditp_vST: TFMTBCDField;
    qr_itempeditp_vDesco: TFMTBCDField;
    qr_itempeditp_pDesco: TFMTBCDField;
    qr_itempeditp_vFrete: TFMTBCDField;
    qr_itempeditp_vSeg: TFMTBCDField;
    qr_itempeditp_vDespe: TFMTBCDField;
    qr_itempeditp_codOF: TIntegerField;
    qr_itempeditp_caracte: TBlobField;
    qr_itempedobr_id: TIntegerField;
    qr_itempeditp_reserva: TStringField;
    qr_itempeditp_faturar: TStringField;
    qr_itempedsol_id: TIntegerField;
    qr_itempeditp_preco_tab: TFMTBCDField;
    qr_itempeditp_pDescoPreco: TFMTBCDField;
    qr_itempeditp_vDescoPreco: TFMTBCDField;
    qr_lotelot_id: TIntegerField;
    qr_loteitp_id: TIntegerField;
    qr_lotelot_qtda: TFMTBCDField;
    qr_lotelot_lote: TStringField;
    qr_lotelot_dtFabricacao: TSQLTimeStampField;
    qr_lotelot_dtValidade: TSQLTimeStampField;
    qr_lotelot_laudo: TStringField;
    qr_lotedat_inclusao: TSQLTimeStampField;
    qr_loteite_id: TIntegerField;
    qr_lotepro_id: TIntegerField;
    qr_loteorf_id: TIntegerField;
    qr_lote_movltm_id: TIntegerField;
    qr_lote_movlot_id: TIntegerField;
    qr_lote_movitp_id: TIntegerField;
    qr_lote_movite_id: TIntegerField;
    qr_lote_movltm_qtda: TFMTBCDField;
    qr_lote_movltm_tipo: TStringField;
    qr_lote_movdat_inclusao: TSQLTimeStampField;
    qr_lote_moviof_id: TIntegerField;
    qr_maquinamaq_id: TIntegerField;
    qr_maquinamaq_codigo: TStringField;
    qr_maquinamaq_nome: TStringField;
    qr_maquinamaq_ativo: TStringField;
    qr_maquinacontrole: TStringField;
    qr_maquinadat_inclusao: TSQLTimeStampField;
    qr_modbcmod_codigo: TIntegerField;
    qr_modbcmod_nome: TStringField;
    qr_modbcstmod_codigo: TIntegerField;
    qr_modbcstmod_nome: TStringField;
    qr_modnotmnf_id: TIntegerField;
    qr_modnotmnf_codigo: TStringField;
    qr_modnotmnf_nome: TStringField;
    qr_modnotcontrole: TStringField;
    qr_modnotdat_inclusao: TSQLTimeStampField;
    qr_modnotmnf_ativo: TStringField;
    qr_modnotmnf_modelo: TStringField;
    qr_motorcamot_codigo: TIntegerField;
    qr_motorcamot_nome: TStringField;
    qr_motorcamot_ativo: TStringField;
    qr_motorcacontrole: TStringField;
    qr_motorcadat_inclusao: TSQLTimeStampField;
    qr_movobramob_id: TIntegerField;
    qr_movobraemp_codigo: TIntegerField;
    qr_movobraobr_id: TIntegerField;
    qr_movobranot_id: TIntegerField;
    qr_movobradup_id: TIntegerField;
    qr_movobrapla_id: TIntegerField;
    qr_movobrapro_id: TIntegerField;
    qr_movobramob_data: TSQLTimeStampField;
    qr_movobramob_quantidade: TFMTBCDField;
    qr_movobramob_preco: TFMTBCDField;
    qr_movobramob_valor: TFMTBCDField;
    qr_movobramob_tipo: TStringField;
    qr_movobramob_obs: TBlobField;
    qr_movobramob_docto: TStringField;
    qr_movobradat_inclusao: TSQLTimeStampField;
    qr_nat_imp_cofcof_id: TIntegerField;
    qr_nat_imp_cofnat_codigo: TIntegerField;
    qr_nat_imp_cofcof_cst: TStringField;
    qr_nat_imp_cofcof_esquema: TIntegerField;
    qr_nat_imp_cofcof_cstST: TStringField;
    qr_nat_imp_cofcof_esquemaST: TIntegerField;
    qr_nat_imp_cofcof_tpAliq: TIntegerField;
    qr_nat_imp_cofdat_inclusao: TSQLTimeStampField;
    qr_nat_imp_cofemp_codigo: TIntegerField;
    qr_nat_imp_icmsicm_id: TIntegerField;
    qr_nat_imp_icmsnat_codigo: TIntegerField;
    qr_nat_imp_icmsicm_cst: TStringField;
    qr_nat_imp_icmsicm_modBC: TIntegerField;
    qr_nat_imp_icmsicm_modBCST: TIntegerField;
    qr_nat_imp_icmsicm_esquema: TIntegerField;
    qr_nat_imp_icmsicm_esquemaST: TIntegerField;
    qr_nat_imp_icmsicm_tpAliq: TIntegerField;
    qr_nat_imp_icmsdat_inclusao: TSQLTimeStampField;
    qr_nat_imp_icmsicm_csosn: TStringField;
    qr_nat_imp_icmsemp_codigo: TIntegerField;
    qr_nat_imp_ipiipi_id: TIntegerField;
    qr_nat_imp_ipinat_codigo: TIntegerField;
    qr_nat_imp_ipiipi_cst: TStringField;
    qr_nat_imp_ipiipi_esquema: TIntegerField;
    qr_nat_imp_ipiipi_tpAliq: TIntegerField;
    qr_nat_imp_ipidat_inclusao: TSQLTimeStampField;
    qr_nat_imp_ipiemp_codigo: TIntegerField;
    qr_nat_imp_pispis_id: TIntegerField;
    qr_nat_imp_pisnat_codigo: TIntegerField;
    qr_nat_imp_pispis_cst: TStringField;
    qr_nat_imp_pispis_esquema: TIntegerField;
    qr_nat_imp_pispis_cstST: TStringField;
    qr_nat_imp_pispis_esquemaST: TIntegerField;
    qr_nat_imp_pispis_tpAliq: TIntegerField;
    qr_nat_imp_pisdat_inclusao: TSQLTimeStampField;
    qr_nat_imp_pisemp_codigo: TIntegerField;
    qr_natfinnaf_codigo: TIntegerField;
    qr_natfinnaf_nome: TStringField;
    qr_natfinnaf_ctarec: TStringField;
    qr_natfinnaf_ctapag: TStringField;
    qr_natfincontrole: TStringField;
    qr_natfindat_inclusao: TSQLTimeStampField;
    qr_natfinnaf_ativo: TStringField;
    qr_naturanat_codigo: TIntegerField;
    qr_naturanat_nome: TStringField;
    qr_naturanat_cfop: TStringField;
    qr_naturanat_obs: TBlobField;
    qr_naturanat_somaFat: TStringField;
    qr_naturanat_uso: TStringField;
    qr_naturadat_inclusao: TSQLTimeStampField;
    qr_naturanat_ativo: TStringField;
    qr_naturanat_calculaST: TStringField;
    qr_naturanat_permiteSN: TStringField;
    qr_naturanat_opEntrada: TIntegerField;
    qr_notafinot_id: TIntegerField;
    qr_notafiemp_codigo: TIntegerField;
    qr_notafient_id: TIntegerField;
    qr_notafinat_codigo: TIntegerField;
    qr_notafistn_codigo: TIntegerField;
    qr_notafinot_tpEmis: TIntegerField;
    qr_notafinot_finNFe: TIntegerField;
    qr_notafinot_transp: TIntegerField;
    qr_notafinot_entrega: TIntegerField;
    qr_notafinot_retirada: TIntegerField;
    qr_notafinot_modFrete: TIntegerField;
    qr_notafinot_modelo: TStringField;
    qr_notafinot_serie: TStringField;
    qr_notafinot_numero: TIntegerField;
    qr_notafiart_codigo: TIntegerField;
    qr_notafinot_datemi: TSQLTimeStampField;
    qr_notafinot_datdup: TSQLTimeStampField;
    qr_notafinot_refNFe: TStringField;
    qr_notafinot_datsai: TSQLTimeStampField;
    qr_notafinot_entsai: TStringField;
    qr_notafinot_vBC: TFMTBCDField;
    qr_notafinot_vIcms: TFMTBCDField;
    qr_notafinot_vBCST: TFMTBCDField;
    qr_notafinot_vST: TFMTBCDField;
    qr_notafinot_vProd: TFMTBCDField;
    qr_notafinot_vFrete: TFMTBCDField;
    qr_notafinot_vSeg: TFMTBCDField;
    qr_notafinot_vDesc: TFMTBCDField;
    qr_notafinot_vII: TFMTBCDField;
    qr_notafinot_vIPI: TFMTBCDField;
    qr_notafinot_vPIS: TFMTBCDField;
    qr_notafinot_vCofins: TFMTBCDField;
    qr_notafinot_vOutro: TFMTBCDField;
    qr_notafinot_vNF: TFMTBCDField;
    qr_notafinot_vServ: TFMTBCDField;
    qr_notafinot_vBCISS: TFMTBCDField;
    qr_notafinot_vISS: TFMTBCDField;
    qr_notafinot_vServPIS: TFMTBCDField;
    qr_notafinot_vServCofins: TFMTBCDField;
    qr_notafinot_vRetPIS: TFMTBCDField;
    qr_notafinot_vRetCofins: TFMTBCDField;
    qr_notafinot_vRetCSLL: TFMTBCDField;
    qr_notafinot_vBCIrrf: TFMTBCDField;
    qr_notafinot_vIrrf: TFMTBCDField;
    qr_notafinot_vBCRetPrev: TFMTBCDField;
    qr_notafinot_vRetPrev: TFMTBCDField;
    qr_notafinot_vEntrada: TFMTBCDField;
    qr_notafinot_avista: TStringField;
    qr_notafinot_obs: TBlobField;
    qr_notafinot_obsSimples: TBlobField;
    qr_notafinot_nFat: TStringField;
    qr_notafinot_vOrig: TFMTBCDField;
    qr_notafinot_vDescFat: TFMTBCDField;
    qr_notafinot_vLiq: TFMTBCDField;
    qr_notafinot_veicPlaca: TStringField;
    qr_notafinot_veicUF: TStringField;
    qr_notafinot_nProt: TStringField;
    qr_notafinot_chNFe: TStringField;
    qr_notafidat_inclusao: TSQLTimeStampField;
    qr_notafinot_msgAuto: TStringField;
    qr_notafinot_atualizaVal: TStringField;
    qr_notafinot_envioXML: TStringField;
    qr_notafinot_tpAmb: TIntegerField;
    qr_notafinot_XMLKiron: TStringField;
    qr_notafinot_pCredSN: TFMTBCDField;
    qr_notafinot_vCredICMSSN: TFMTBCDField;
    qr_notafinot_ChaveCompl: TStringField;
    qr_notafinot_xLocEmbarq: TStringField;
    qr_notafinot_UFEmbarq: TStringField;
    qr_notafinot_proprio: TStringField;
    qr_notafinot_datlan: TSQLTimeStampField;
    qr_notafimnf_codigo: TStringField;
    qr_notafinot_estoque: TStringField;
    qr_notafiven_codigo: TIntegerField;
    qr_notafinot_vbConsumidor: TStringField;
    qr_notafinot_vbNome: TStringField;
    qr_notafinot_vbContato: TStringField;
    qr_notafinot_desc_conpag: TStringField;
    qr_notafinot_dtColeta: TSQLTimeStampField;
    qr_notafinot_xmlNFe: TBlobField;
    qr_notafinot_cfopAuto: TStringField;
    qr_notafinot_xmlWS: TStringField;
    qr_notafinot_vTotTrib: TFMTBCDField;
    qr_obraobr_id: TIntegerField;
    qr_obraemp_codigo: TIntegerField;
    qr_obraent_id: TIntegerField;
    qr_obraobr_status: TStringField;
    qr_obraobr_data: TSQLTimeStampField;
    qr_obraobr_dtInicio: TSQLTimeStampField;
    qr_obraobr_dtFim: TSQLTimeStampField;
    qr_obraobr_Servico: TBlobField;
    qr_obraobr_detalhe: TBlobField;
    qr_obraobr_vEstimado: TFMTBCDField;
    qr_obraobr_tmpEstimado: TStringField;
    qr_obraobr_obs: TBlobField;
    qr_obraobr_endereco: TStringField;
    qr_obraobr_numero: TStringField;
    qr_obraobr_comple: TStringField;
    qr_obraobr_bairro: TStringField;
    qr_obraobr_cidade: TStringField;
    qr_obraobr_cep: TStringField;
    qr_obrauf_codigo: TStringField;
    qr_obraobr_fone: TStringField;
    qr_obraobr_contato: TStringField;
    qr_obraobr_email: TStringField;
    qr_obradat_inclusao: TSQLTimeStampField;
    qr_obraobr_vVenda: TFMTBCDField;
    qr_ordfaborf_id: TIntegerField;
    qr_ordfabemp_codigo: TIntegerField;
    qr_ordfaborf_data: TSQLTimeStampField;
    qr_ordfabped_id: TIntegerField;
    qr_ordfabitp_item: TIntegerField;
    qr_ordfabpro_id: TIntegerField;
    qr_ordfaborf_qtda: TFMTBCDField;
    qr_ordfaborf_qtdaprod: TFMTBCDField;
    qr_ordfaborf_prazo: TSQLTimeStampField;
    qr_ordfaborf_revisao: TStringField;
    qr_ordfaborf_dtRevi: TSQLTimeStampField;
    qr_ordfaborf_pH: TStringField;
    qr_ordfaborf_tempo: TStringField;
    qr_ordfaborf_pedcli: TStringField;
    qr_ordfaborf_datfab: TSQLTimeStampField;
    qr_ordfabdat_inclusao: TSQLTimeStampField;
    qr_ordfabmaq_id: TIntegerField;
    qr_ordfaborf_obs: TBlobField;
    qr_oriproorp_codigo: TIntegerField;
    qr_oriproorp_nome: TStringField;
    qr_oriprodat_inclusao: TSQLTimeStampField;
    qr_oriproorp_ativo: TStringField;
    qr_otbotb_id: TIntegerField;
    qr_otbemp_codigo: TIntegerField;
    qr_otbotb_ano: TStringField;
    qr_otbotb_vFatura01: TFMTBCDField;
    qr_otbotb_vFatura02: TFMTBCDField;
    qr_otbotb_vFatura03: TFMTBCDField;
    qr_otbotb_vFatura04: TFMTBCDField;
    qr_otbotb_vFatura05: TFMTBCDField;
    qr_otbotb_vFatura06: TFMTBCDField;
    qr_otbotb_vFatura07: TFMTBCDField;
    qr_otbotb_vFatura08: TFMTBCDField;
    qr_otbotb_vFatura09: TFMTBCDField;
    qr_otbotb_vFatura10: TFMTBCDField;
    qr_otbotb_vFatura11: TFMTBCDField;
    qr_otbotb_vFatura12: TFMTBCDField;
    qr_otbotb_media: TFMTBCDField;
    qr_otbdat_inclusao: TSQLTimeStampField;
    qr_paispai_codigo: TIntegerField;
    qr_paispai_nome: TStringField;
    qr_paisdat_inclusao: TSQLTimeStampField;
    qr_paispai_ativo: TStringField;
    qr_pedidoped_id: TIntegerField;
    qr_pedidoemp_codigo: TIntegerField;
    qr_pedidoent_id: TIntegerField;
    qr_pedidotpp_codigo: TIntegerField;
    qr_pedidoven_codigo: TIntegerField;
    qr_pedidofip_codigo: TIntegerField;
    qr_pedidosdp_codigo: TIntegerField;
    qr_pedidoban_codigo: TIntegerField;
    qr_pedidoped_tipo: TStringField;
    qr_pedidoped_transp: TIntegerField;
    qr_pedidoped_numero: TIntegerField;
    qr_pedidoped_datemi: TSQLTimeStampField;
    qr_pedidoped_valmer: TFMTBCDField;
    qr_pedidoped_valipi: TFMTBCDField;
    qr_pedidoped_valdesc: TFMTBCDField;
    qr_pedidoped_valdesp: TIntegerField;
    qr_pedidoped_valtot: TFMTBCDField;
    qr_pedidoped_frete: TIntegerField;
    qr_pedidoped_cancel: TStringField;
    qr_pedidoped_pedcli: TStringField;
    qr_pedidodat_inclusao: TSQLTimeStampField;
    qr_pedidoped_datdup: TSQLTimeStampField;
    qr_pedidoped_vEntrada: TFMTBCDField;
    qr_pedidoped_aVista: TStringField;
    qr_pedidostp_codigo: TIntegerField;
    qr_pedidoped_obs: TBlobField;
    qr_pedidoped_pzEntrega: TSQLTimeStampField;
    qr_pedidoped_dtEntregue: TSQLTimeStampField;
    qr_pedidoped_pzProducao: TSQLTimeStampField;
    qr_pedidoped_dtProducao: TSQLTimeStampField;
    qr_pedidoped_entEnde: TStringField;
    qr_pedidoped_entNume: TStringField;
    qr_pedidoped_entComp: TStringField;
    qr_pedidoped_entBair: TStringField;
    qr_pedidoped_entCida: TStringField;
    qr_pedidoped_entUF: TStringField;
    qr_pedidoped_entCep: TStringField;
    qr_pedidoped_vST: TFMTBCDField;
    qr_pedidoped_block: TStringField;
    qr_pedidoped_vFrete: TFMTBCDField;
    qr_pedidoped_vSeg: TFMTBCDField;
    qr_pedidoped_desc_conpag: TStringField;
    qr_pedidoped_orcNumero: TIntegerField;
    qr_pedidoped_orcNome: TStringField;
    qr_pedidoped_orcFone: TStringField;
    qr_pedidoped_orcEmail: TStringField;
    qr_pedidoped_orcContato: TStringField;
    qr_pedidoped_orcPedido: TStringField;
    qr_pedidoped_email_enviado: TSQLTimeStampField;
    qr_pedidoped_entHorario: TStringField;
    qr_pedidoped_validade: TStringField;
    qr_pedidoped_descPrazo: TStringField;
    qr_pedidomot_codigo: TIntegerField;
    qr_pedidoped_usu_block: TIntegerField;
    qr_pedidoped_numeroRC: TStringField;
    qr_pispis_id: TIntegerField;
    qr_pispis_pPIS: TFMTBCDField;
    qr_pisdat_inclusao: TSQLTimeStampField;
    qr_planopla_id: TIntegerField;
    qr_planopla_codigo: TStringField;
    qr_planopla_nome: TStringField;
    qr_planopla_tipo: TStringField;
    qr_planodat_inclusao: TSQLTimeStampField;
    qr_planopla_ativo: TStringField;
    qr_planopla_despVar: TStringField;
    qr_prod_aliq_icmsicm_id: TIntegerField;
    qr_prod_aliq_icmspro_id: TIntegerField;
    qr_prod_aliq_icmsicm_ufOrig: TStringField;
    qr_prod_aliq_icmsicm_ufDest: TStringField;
    qr_prod_aliq_icmsicm_pICMS: TFMTBCDField;
    qr_prod_aliq_icmsicm_pICMSFrete: TFMTBCDField;
    qr_prod_aliq_icmsicm_pDifere: TFMTBCDField;
    qr_prod_aliq_icmsicm_pICMSST: TFMTBCDField;
    qr_prod_aliq_icmsicm_pBC: TFMTBCDField;
    qr_prod_aliq_icmsicm_pRedBC: TFMTBCDField;
    qr_prod_aliq_icmsicm_vPauta: TFMTBCDField;
    qr_prod_aliq_icmsicm_pBCST: TFMTBCDField;
    qr_prod_aliq_icmsicm_pRedBCST: TFMTBCDField;
    qr_prod_aliq_icmsicm_pIVA: TFMTBCDField;
    qr_prod_aliq_icmsicm_vPautaST: TFMTBCDField;
    qr_prod_aliq_icmsicm_pOperaPro: TFMTBCDField;
    qr_prod_aliq_icmsdat_inclusao: TSQLTimeStampField;
    qr_prod_aliq_icmsicm_pBCSN: TFMTBCDField;
    qr_prod_aliq_icmsicm_pRedBCSN: TFMTBCDField;
    qr_prod_aliq_icmsicm_pBCSTSN: TFMTBCDField;
    qr_prod_aliq_icmsicm_pRedBCSTSN: TFMTBCDField;
    qr_prod_aliq_icmsnat_codigo: TIntegerField;
    qr_prod_aliq_icmsemp_codigo: TIntegerField;
    qr_prod_aliq_icmsicm_pICMSIntra: TFMTBCDField;
    qr_prod_aliq_icmsicm_conFinalDest: TStringField;
    qr_prod_aliq_icmsicm_simplesDest: TStringField;
    qr_prod_aliq_icmsicm_contrICMS: TStringField;
    qr_prod_aliq_icmsicm_cst_icms: TStringField;
    qr_prod_aliq_icmsicm_cst_ipi: TStringField;
    qr_prod_aliq_icmsicm_cst_pis: TStringField;
    qr_prod_aliq_icmsicm_cst_cof: TStringField;
    qr_prod_aliq_icmsicm_csosn: TStringField;
    qr_prod_aliq_icmsicm_pIVAAjustado: TFMTBCDField;
    qr_prod_aliq_icmsicm_pIVARedSN: TFMTBCDField;
    qr_prod_comppco_id: TIntegerField;
    qr_prod_comppco_item: TIntegerField;
    qr_prod_comppro_id: TIntegerField;
    qr_prod_comppco_matpri: TIntegerField;
    qr_prod_comppco_qtda: TFMTBCDField;
    qr_prod_embapem_id: TIntegerField;
    qr_prod_embapro_id: TIntegerField;
    qr_prod_embaemb_codigo: TStringField;
    qr_prod_embauni_codigo: TStringField;
    qr_prod_embapem_qtda: TFMTBCDField;
    qr_prod_embapem_preven: TFMTBCDField;
    qr_prod_embapem_pesliq: TFMTBCDField;
    qr_prod_embapem_pesbru: TFMTBCDField;
    qr_prod_imp_cofcof_id: TIntegerField;
    qr_prod_imp_cofpro_id: TIntegerField;
    qr_prod_imp_cofcof_cst: TStringField;
    qr_prod_imp_cofcof_esquema: TIntegerField;
    qr_prod_imp_cofcof_cstST: TStringField;
    qr_prod_imp_cofcof_esquemaST: TIntegerField;
    qr_prod_imp_cofcof_tpAliq: TIntegerField;
    qr_prod_imp_cofdat_inclusao: TSQLTimeStampField;
    qr_prod_imp_icmsicm_id: TIntegerField;
    qr_prod_imp_icmspro_id: TIntegerField;
    qr_prod_imp_icmsicm_cst: TStringField;
    qr_prod_imp_icmsicm_modBC: TIntegerField;
    qr_prod_imp_icmsicm_modBCST: TIntegerField;
    qr_prod_imp_icmsicm_esquema: TIntegerField;
    qr_prod_imp_icmsicm_esquemaST: TIntegerField;
    qr_prod_imp_icmsicm_tpAliq: TIntegerField;
    qr_prod_imp_icmsdat_inclusao: TSQLTimeStampField;
    qr_prod_imp_icmsicm_csosn: TStringField;
    qr_prod_tabprecptp_id: TIntegerField;
    qr_prod_tabprecpro_id: TIntegerField;
    qr_prod_tabprectbp_codigo: TIntegerField;
    qr_prod_tabprecptp_preco: TFMTBCDField;
    qr_prod_imp_ipiipi_id: TIntegerField;
    qr_prod_imp_ipipro_id: TIntegerField;
    qr_prod_imp_ipiipi_cst: TStringField;
    qr_prod_imp_ipiipi_esquema: TIntegerField;
    qr_prod_imp_ipiipi_tpAliq: TIntegerField;
    qr_prod_imp_ipidat_inclusao: TSQLTimeStampField;
    qr_prod_imp_pispis_id: TIntegerField;
    qr_prod_imp_pispro_id: TIntegerField;
    qr_prod_imp_pispis_cst: TStringField;
    qr_prod_imp_pispis_esquema: TIntegerField;
    qr_prod_imp_pispis_cstST: TStringField;
    qr_prod_imp_pispis_esquemaST: TIntegerField;
    qr_prod_imp_pispis_tpAliq: TIntegerField;
    qr_prod_imp_pisdat_inclusao: TSQLTimeStampField;
    qr_prod_similarprs_id: TIntegerField;
    qr_prod_similarpro_id: TIntegerField;
    qr_prod_similarent_cnpj: TStringField;
    qr_prod_similarent_nome: TStringField;
    qr_prod_similarprs_codigo: TStringField;
    qr_prod_similarprs_cBarras: TStringField;
    qr_prod_similarprs_nome: TStringField;
    qr_prod_similarncm_codigo: TStringField;
    qr_prod_similaruni_codigo: TStringField;
    qr_prod_similarprs_preco: TFMTBCDField;
    qr_prod_similardat_inclusao: TSQLTimeStampField;
    qr_produtopro_id: TIntegerField;
    qr_produtoorp_codigo: TIntegerField;
    qr_produtopro_codigo: TStringField;
    qr_produtopro_nome: TStringField;
    qr_produtouni_codigo: TStringField;
    qr_produtopro_preco: TFMTBCDField;
    qr_produtodat_inclusao: TSQLTimeStampField;
    qr_produtopro_ativo: TStringField;
    qr_produtoncm_codigo: TStringField;
    qr_produtopro_pesoliq: TFMTBCDField;
    qr_produtopro_pesobru: TFMTBCDField;
    qr_produtopro_utiliza: TStringField;
    qr_produtopro_cfopF: TIntegerField;
    qr_produtopro_cfopD: TIntegerField;
    qr_produtopro_cEAN: TStringField;
    qr_produtogrp_id: TIntegerField;
    qr_produtopro_sdInicial: TFMTBCDField;
    qr_produtopro_sdAtual: TFMTBCDField;
    qr_produtopro_estoque: TStringField;
    qr_produtopro_estmin: TFMTBCDField;
    qr_produtopro_estmax: TFMTBCDField;
    qr_produtopro_servico: TStringField;
    qr_produtopro_unical: TStringField;
    qr_produtopro_precom: TFMTBCDField;
    qr_produtopro_fator: TIntegerField;
    qr_produtopro_peso: TFMTBCDField;
    qr_produtopro_validade: TIntegerField;
    qr_produtopro_refere: TStringField;
    qr_produtopro_densi: TFMTBCDField;
    qr_produtopro_onu: TStringField;
    qr_produtopro_risco: TStringField;
    qr_produtopro_preparo: TBlobField;
    qr_produtopro_pComissao: TFMTBCDField;
    qr_produtopro_revisao: TStringField;
    qr_produtopro_datrevisao: TSQLTimeStampField;
    qr_produtopro_pDesco: TFMTBCDField;
    qr_produtopro_fatorDiv: TFMTBCDField;
    qr_produtotpr_codigo: TIntegerField;
    qr_produtopro_qtdUN: TFMTBCDField;
    qr_produtopro_embaUN: TStringField;
    qr_produtopro_qtdRese: TFMTBCDField;
    qr_produtopro_sdDispo: TFMTBCDField;
    qr_produtopro_obsAdicional: TBlobField;
    qr_produtopro_pMargem: TFMTBCDField;
    qr_produtopro_cBarras: TStringField;
    qr_produtopro_foto: TBlobField;
    qr_produtopro_qBase: TFMTBCDField;
    qr_produtopro_unOrigem: TStringField;
    qr_produtopro_qOrigem: TFMTBCDField;
    qr_produtopro_idProdEstoque: TIntegerField;
    qr_produtopro_comple: TBlobField;
    qr_produtopro_RevisaoEspe: TStringField;
    qr_produtopro_DatRevisaoEspe: TSQLTimeStampField;
    qr_produtopro_Marca: TStringField;
    qr_produtopro_Fabricante: TStringField;
    qr_ramatirat_codigo: TIntegerField;
    qr_ramatirat_nome: TStringField;
    qr_ramatirat_ativo: TStringField;
    qr_ramaticontrole: TStringField;
    qr_ramatidat_inclusao: TSQLTimeStampField;
    qr_reg_deletadoid: TIntegerField;
    qr_reg_deletadomotivo: TBlobField;
    qr_reg_deletadodat_inclusao: TSQLTimeStampField;
    qr_sequenciaseq_id: TIntegerField;
    qr_sequenciaseq_tabela: TStringField;
    qr_sequenciaseq_IDtabela: TIntegerField;
    qr_servicoser_id: TIntegerField;
    qr_servicoemp_codigo: TIntegerField;
    qr_servicoent_id: TIntegerField;
    qr_servicostn_codigo: TIntegerField;
    qr_servicoser_TipoRPS: TStringField;
    qr_servicoser_NumeroRPS: TIntegerField;
    qr_servicoser_SerieRPS: TStringField;
    qr_servicoser_NumeroNota: TIntegerField;
    qr_servicoser_Datemi: TSQLTimeStampField;
    qr_servicoser_Situacao: TStringField;
    qr_servicoser_SerieRPSSubs: TStringField;
    qr_servicoser_NumeroNFSeSubs: TIntegerField;
    qr_servicoser_NumeroRPSSubs: TIntegerField;
    qr_servicoser_DataNFSeSubs: TSQLTimeStampField;
    qr_servicoser_SeriePrest: TStringField;
    qr_servicoser_CodigoAtividade: TStringField;
    qr_servicoser_TipoReco: TStringField;
    qr_servicoser_MuniPrest: TIntegerField;
    qr_servicoser_Operacao: TStringField;
    qr_servicoser_Tributacao: TStringField;
    qr_servicoser_vServico: TFMTBCDField;
    qr_servicoser_vNota: TFMTBCDField;
    qr_servicoser_vDeducoes: TFMTBCDField;
    qr_servicoser_vISS: TFMTBCDField;
    qr_servicoser_vPIS: TFMTBCDField;
    qr_servicoser_vCofins: TFMTBCDField;
    qr_servicoser_vINSS: TFMTBCDField;
    qr_servicoser_vIR: TFMTBCDField;
    qr_servicoser_vCSLL: TFMTBCDField;
    qr_servicoser_pISS: TFMTBCDField;
    qr_servicoser_pPIS: TFMTBCDField;
    qr_servicoser_pCofins: TFMTBCDField;
    qr_servicoser_pINSS: TFMTBCDField;
    qr_servicoser_pIR: TFMTBCDField;
    qr_servicoser_pCSLL: TFMTBCDField;
    qr_servicoser_calcPIS: TStringField;
    qr_servicoser_calcCofins: TStringField;
    qr_servicoser_calcINSS: TStringField;
    qr_servicoser_calcIR: TStringField;
    qr_servicoser_calcCSLL: TStringField;
    qr_servicoser_descricao: TBlobField;
    qr_servicoser_MotCancel: TStringField;
    qr_servicoser_CpfCnpjInter: TStringField;
    qr_servicoser_dtVencto: TSQLTimeStampField;
    qr_servicodat_inclusao: TSQLTimeStampField;
    qr_servicoser_CodVerif: TStringField;
    qr_servicoser_LogEnvio: TBlobField;
    qr_servicoser_LogCancel: TBlobField;
    qr_servicoser_NumeroLote: TIntegerField;
    qr_siafisia_id: TIntegerField;
    qr_siafisia_codigo: TStringField;
    qr_siafisia_nome: TStringField;
    qr_siafiuf_codigo: TStringField;
    qr_siafisia_codSiafi: TStringField;
    qr_simplessim_id: TIntegerField;
    qr_simplessim_recinicial: TFMTBCDField;
    qr_simplessim_recfinal: TFMTBCDField;
    qr_simplessim_icms: TFMTBCDField;
    qr_simplesdat_inclusao: TSQLTimeStampField;
    qr_sitdupsdp_codigo: TIntegerField;
    qr_sitdupsdp_nome: TStringField;
    qr_sitdupcontrole: TStringField;
    qr_sitdupdat_inclusao: TSQLTimeStampField;
    qr_sitdupsdp_ativo: TStringField;
    qr_sitnfestn_codigo: TIntegerField;
    qr_sitnfestn_nome: TStringField;
    qr_sitnfecontrole: TStringField;
    qr_sitnfedat_inclusao: TSQLTimeStampField;
    qr_sitnfestn_ativo: TStringField;
    qr_sitribustr_id: TIntegerField;
    qr_sitribustr_tipo: TStringField;
    qr_sitribustr_codigo: TStringField;
    qr_sitribustr_nome: TStringField;
    qr_sitribucontrole: TStringField;
    qr_sitribudat_inclusao: TSQLTimeStampField;
    qr_sitribustr_ativo: TStringField;
    qr_solicitasol_id: TIntegerField;
    qr_solicitaemp_codigo: TIntegerField;
    qr_solicitasol_data: TSQLTimeStampField;
    qr_solicitasol_solicitante: TStringField;
    qr_solicitapro_id: TIntegerField;
    qr_solicitasol_especProd: TBlobField;
    qr_solicitasol_qtda: TFMTBCDField;
    qr_solicitaobr_id: TIntegerField;
    qr_solicitaped_numero: TIntegerField;
    qr_solicitausu_codigo: TIntegerField;
    qr_solicitasol_obs: TBlobField;
    qr_solicitasol_status: TIntegerField;
    qr_solicitasol_block: TStringField;
    qr_solicitasol_check: TStringField;
    qr_solicitadat_inclusao: TSQLTimeStampField;
    qr_statuspedstp_codigo: TIntegerField;
    qr_statuspedstp_nome: TStringField;
    qr_tabbantba_id: TIntegerField;
    qr_tabbantba_codigo: TStringField;
    qr_tabbantba_nome: TStringField;
    qr_tabbandat_inclusao: TSQLTimeStampField;
    qr_tabbantba_ativo: TStringField;
    qr_tabprectbp_codigo: TIntegerField;
    qr_tabprectbp_nome: TStringField;
    qr_tabprectbp_ativo: TStringField;
    qr_tabpreccontrole: TStringField;
    qr_tabprecdat_inclusao: TSQLTimeStampField;
    qr_telefonetel_id: TIntegerField;
    qr_telefoneent_id: TIntegerField;
    qr_telefonetpt_codigo: TIntegerField;
    qr_telefonetel_ddi: TStringField;
    qr_telefonetel_ddd: TStringField;
    qr_telefonetel_numero: TStringField;
    qr_telefonetel_contato: TStringField;
    qr_telefonetel_email: TStringField;
    qr_telefonetel_cargo: TStringField;
    qr_telefonedat_inclusao: TSQLTimeStampField;
    qr_tipesttpe_codigo: TIntegerField;
    qr_tipesttpe_nome: TStringField;
    qr_tipestdat_inclusao: TSQLTimeStampField;
    qr_tipesttpe_ativo: TStringField;
    qr_tipestcontrole: TStringField;
    qr_tiplogtpl_codigo: TIntegerField;
    qr_tiplogtpl_nome: TStringField;
    qr_tiplogdat_inclusao: TSQLTimeStampField;
    qr_tiplogtpl_ativo: TStringField;
    qr_tippedtpp_codigo: TIntegerField;
    qr_tippedtpp_nome: TStringField;
    qr_tippedcontrole: TStringField;
    qr_tippeddat_inclusao: TSQLTimeStampField;
    qr_tippedtpp_ativo: TStringField;
    qr_tipprotpr_codigo: TIntegerField;
    qr_tipprotpr_nome: TStringField;
    qr_tipprocontrole: TStringField;
    qr_tipprodat_inclusao: TSQLTimeStampField;
    qr_tipprotpr_ativo: TStringField;
    qr_tipteltpt_codigo: TIntegerField;
    qr_tipteltpt_nome: TStringField;
    qr_tiptelcontrole: TStringField;
    qr_tipteldat_inclusao: TSQLTimeStampField;
    qr_tipteltpt_ativo: TStringField;
    qr_ufuf_id: TIntegerField;
    qr_ufuf_codigo: TStringField;
    qr_ufuf_nome: TStringField;
    qr_ufuf_icms: TFMTBCDField;
    qr_ufuf_cUF: TIntegerField;
    qr_ufdat_inclusao: TSQLTimeStampField;
    qr_ufuf_ativo: TStringField;
    qr_unimeduni_id: TIntegerField;
    qr_unimeduni_codigo: TStringField;
    qr_unimeduni_nome: TStringField;
    qr_unimedcontrole: TStringField;
    qr_unimeddat_inclusao: TSQLTimeStampField;
    qr_unimeduni_ativo: TStringField;
    qr_usuariousu_codigo: TIntegerField;
    qr_usuariousu_login: TStringField;
    qr_usuariousu_nome: TStringField;
    qr_usuariousu_senha: TStringField;
    qr_usuariousu_datexp: TSQLTimeStampField;
    qr_usuariousu_adm: TStringField;
    qr_usuariocontrole: TStringField;
    qr_usuariodat_inclusao: TSQLTimeStampField;
    qr_usuariousu_ativo: TStringField;
    qr_usuariousu_email: TStringField;
    qr_usuariousu_Senha_email: TStringField;
    qr_usuarioema_id: TIntegerField;
    qr_vendeven_codigo: TIntegerField;
    qr_vendeven_nome: TStringField;
    qr_vendeven_vendedor: TStringField;
    qr_vendeven_comprador: TStringField;
    qr_vendedat_inclusao: TSQLTimeStampField;
    qr_vendeven_ativo: TStringField;
    qr_vendeven_endereco: TStringField;
    qr_vendeven_numero: TStringField;
    qr_vendeven_comple: TStringField;
    qr_vendeven_bairro: TStringField;
    qr_vendeven_cidade: TStringField;
    qr_vendeuf_codigo: TStringField;
    qr_vendeven_cep: TStringField;
    qr_vendeven_fantasia: TStringField;
    qr_vendeven_fone: TStringField;
    qr_vendeven_fax: TStringField;
    qr_vendeven_celular: TStringField;
    qr_vendeven_email: TStringField;
    qr_vendeusu_codigo: TIntegerField;
    qr_volumevol_id: TIntegerField;
    qr_volumenot_id: TIntegerField;
    qr_volumevol_qVol: TIntegerField;
    qr_volumevol_esp: TStringField;
    qr_volumevol_marca: TStringField;
    qr_volumevol_nVol: TStringField;
    qr_volumevol_pesoL: TFMTBCDField;
    qr_volumevol_pesoB: TFMTBCDField;
    qr_volumevol_nLacre: TStringField;
    qr_volumedat_inclusao: TSQLTimeStampField;
    cds_itemped: TClientDataSet;
    cds_pedido: TClientDataSet;
    qr_entidadereg_codigo: TIntegerField;
    qr_entidadefip_codigo: TIntegerField;
    qr_entidadeent_blockFin: TStringField;
    qr_pedido_pi: TSQLQuery;
    qr_pedido_piped_id: TIntegerField;
    qr_pedido_piemp_codigo: TIntegerField;
    qr_pedido_piped_numero: TIntegerField;
    qr_pedido_piped_datemi: TSQLTimeStampField;
    qr_pedido_pient_id: TIntegerField;
    qr_pedido_piped_pDesc: TFMTBCDField;
    qr_pedido_piped_vDesc: TFMTBCDField;
    qr_pedido_piped_vComAgencia: TFMTBCDField;
    qr_pedido_piped_vComVende: TFMTBCDField;
    qr_pedido_piped_vBV: TFMTBCDField;
    qr_pedido_piped_vRetencao: TFMTBCDField;
    qr_pedido_piped_vReembolso: TFMTBCDField;
    qr_pedido_piped_vLiquido: TFMTBCDField;
    dsp_pedido_pi: TDataSetProvider;
    dsp_pi_programacao: TDataSetProvider;
    qr_pi_programacao: TSQLQuery;
    qr_pi_programacaoprg_id: TIntegerField;
    qr_pi_programacaoped_id: TIntegerField;
    qr_pi_programacaoprg_item: TStringField;
    qr_pi_programacaoprg_nTitulo: TStringField;
    qr_pi_programacaoprg_Titulo: TStringField;
    qr_pi_programacaoprg_Colocacao: TStringField;
    qr_pi_programacaoprg_linha: TIntegerField;
    qr_pi_programacaoprg_cor: TStringField;
    qr_pi_programacaoprg_preco: TFMTBCDField;
    qr_pi_programacaoprg_valor: TFMTBCDField;
    qr_pi_publicacao: TSQLQuery;
    qr_pi_publicacaopub_id: TIntegerField;
    qr_pi_publicacaoped_id: TIntegerField;
    qr_pi_publicacaoprg_id: TIntegerField;
    qr_pi_publicacaopub_data: TSQLTimeStampField;
    qr_pi_publicacaopub_qtda: TIntegerField;
    dsp_pi_publicacao: TDataSetProvider;
    qr_pi_fatura: TSQLQuery;
    qr_pi_faturapfa_id: TIntegerField;
    qr_pi_faturaped_id: TIntegerField;
    qr_pi_faturadup_id: TIntegerField;
    qr_pi_faturapfa_parcela: TIntegerField;
    qr_pi_faturapfa_vencto: TSQLTimeStampField;
    qr_pi_faturapfa_valor: TFMTBCDField;
    dsp_pi_fatura: TDataSetProvider;
    dsp_pi_agencia: TDataSetProvider;
    dsp_pi_vende: TDataSetProvider;
    qr_pi_agencia: TSQLQuery;
    qr_pi_agenciapag_id: TIntegerField;
    qr_pi_agenciaped_id: TIntegerField;
    qr_pi_agenciaage_codigo: TIntegerField;
    qr_pi_vende: TSQLQuery;
    qr_pi_vendepve_id: TIntegerField;
    qr_pi_vendeped_id: TIntegerField;
    qr_pi_vendeven_codigo: TIntegerField;
    qr_tipass: TSQLQuery;
    qr_tipasstas_codigo: TIntegerField;
    qr_tipasstas_nome: TStringField;
    qr_tipasstas_ativo: TStringField;
    dsp_tipass: TDataSetProvider;
    dsp_entregador: TDataSetProvider;
    qr_entregador: TSQLQuery;
    qr_entregadorent_codigo: TIntegerField;
    qr_entregadorent_nome: TStringField;
    qr_entregadorent_ativo: TStringField;
    qr_entregadorent_endereco: TStringField;
    qr_entregadorent_comple: TStringField;
    qr_entregadorent_numero: TStringField;
    qr_entregadorent_bairro: TStringField;
    qr_entregadorent_cidade: TStringField;
    qr_entregadorent_cep: TStringField;
    qr_entregadoruf_codigo: TStringField;
    qr_entregadorent_fone: TStringField;
    qr_entregadorent_celular: TStringField;
    qr_bolsao: TSQLQuery;
    dsp_bolsao: TDataSetProvider;
    qr_bolsaobol_codigo: TIntegerField;
    qr_bolsaobol_nome: TStringField;
    qr_bolsaobol_ativo: TStringField;
    qr_bolsaobol_cidade: TStringField;
    qr_bolsaoent_codigo: TIntegerField;
    qr_entregadorent_precoUN: TFMTBCDField;
    qr_entregadorent_precoFixo: TFMTBCDField;
    dsp_circulacao: TDataSetProvider;
    qr_circulacao: TSQLQuery;
    qr_circulacaocir_codigo: TIntegerField;
    qr_circulacaocir_nome: TStringField;
    qr_circulacaocir_ativo: TStringField;
    qr_circulacaocir_frequencia: TIntegerField;
    qr_circulacaocir_seg: TStringField;
    qr_circulacaocir_ter: TStringField;
    qr_circulacaocir_qua: TStringField;
    qr_circulacaocir_qui: TStringField;
    qr_circulacaocir_sex: TStringField;
    qr_circulacaocir_sab: TStringField;
    qr_circulacaocir_dom: TStringField;
    qr_statuspi: TSQLQuery;
    qr_statuspispi_codigo: TIntegerField;
    qr_statuspispi_nome: TStringField;
    qr_statuspispi_ativo: TStringField;
    dsp_statuspi: TDataSetProvider;
    qr_pedido_pispi_codigo: TIntegerField;
    qr_pedido_picir_codigo: TIntegerField;
    qr_caderno: TSQLQuery;
    qr_cadernocad_codigo: TIntegerField;
    qr_cadernocad_nome: TStringField;
    qr_cadernocad_ativo: TStringField;
    dsp_caderno: TDataSetProvider;
    qr_pi_programacaocad_codigo: TIntegerField;
    qr_pedido_piped_formulario: TStringField;
    qr_pedido_piped_autorizacao: TStringField;
    qr_pedido_piped_produto: TStringField;
    qr_pedido_piped_campanha: TStringField;
    qr_pedido_piped_pBonificacao: TFMTBCDField;
    qr_pedido_piped_pAgencia: TFMTBCDField;
    qr_pedido_piped_pVende: TFMTBCDField;
    qr_pedido_piped_obsComercial: TBlobField;
    qr_pedido_piped_piAgencia: TStringField;
    qr_pedido_piped_descAgencia: TStringField;
    qr_pedido_piped_valor: TFMTBCDField;
    qr_pedido_piped_nparcela: TIntegerField;
    qr_pedido_piped_venctoIni: TSQLTimeStampField;
    qr_nfsComunica: TSQLQuery;
    qr_nfsComunicanfc_id: TIntegerField;
    qr_nfsComunicaemp_codigo: TIntegerField;
    qr_nfsComunicanfc_mesano: TStringField;
    qr_nfsComunicanfc_numero: TIntegerField;
    qr_nfsComunicaent_id: TIntegerField;
    qr_nfsComunicanat_codigo: TIntegerField;
    qr_nfsComunicanfc_datemi: TSQLTimeStampField;
    qr_nfsComunicanfc_descServico: TBlobField;
    qr_nfsComunicanfc_vNota: TFMTBCDField;
    dsp_nfsComunica: TDataSetProvider;
    qr_nfsComunicanfc_vencto: TSQLTimeStampField;
    qr_nfsComunicapfa_id: TIntegerField;
    qr_assinante: TSQLQuery;
    qr_assinanteass_codigo: TIntegerField;
    qr_assinantetas_codigo: TIntegerField;
    qr_assinanterat_codigo: TIntegerField;
    qr_assinantebol_codigo: TIntegerField;
    qr_assinanteass_nome: TStringField;
    qr_assinanteass_ativo: TStringField;
    qr_assinanteass_endereco: TStringField;
    qr_assinanteass_numero: TStringField;
    qr_assinanteass_bairro: TStringField;
    qr_assinanteass_cidade: TStringField;
    qr_assinanteass_cep: TStringField;
    qr_assinanteuf_codigo: TStringField;
    qr_assinanteass_fone: TStringField;
    qr_assinanteass_celular: TStringField;
    dsp_assinante: TDataSetProvider;
    qr_assinanteass_comple: TStringField;
    qr_romaneio: TSQLQuery;
    qr_romaneiorom_id: TIntegerField;
    qr_romaneioped_id: TIntegerField;
    qr_romaneioitp_id: TIntegerField;
    qr_romaneiopro_id: TIntegerField;
    qr_romaneiorom_qtda: TFMTBCDField;
    dsp_romaneio: TDataSetProvider;
    qr_pedido_piage_codigo: TIntegerField;
    qr_pi_vendepve_pRateio: TFMTBCDField;
    qr_empresaemp_licitaOBS: TBlobField;
    qr_empresaemp_licitaNorma: TBlobField;
    qr_empresaemp_licitaCond: TBlobField;
    qr_empresaemp_PrintMarcaPedido: TStringField;
    qr_empresaemp_pathProdAnexo: TStringField;
    qr_empresaemp_CalculaVolume: TStringField;
    qr_empresaemp_PrintConpagPed: TStringField;
    qr_empresaemp_qCasaDecPed: TIntegerField;
    qr_empresaemp_EmbalaPedido: TStringField;
    qr_empresaemp_SegUnimed: TStringField;
    qr_itempeditp_licitaItem: TIntegerField;
    qr_itempeditp_vale: TStringField;
    qr_itempedped_idOri: TIntegerField;
    qr_itempeditp_itemOri: TIntegerField;
    qr_itempeditp_fatVale: TStringField;
    qr_itempeditp_qtda2: TFMTBCDField;
    qr_itempeduni_codigo2: TStringField;
    qr_itempeditp_preco2: TFMTBCDField;
    dsp_agencia: TDataSetProvider;
    qr_agencia: TSQLQuery;
    qr_agenciaage_codigo: TIntegerField;
    qr_agenciaage_ativo: TStringField;
    qr_agenciaage_nome: TStringField;
    qr_agenciaage_razao: TStringField;
    qr_agenciaage_cnpj: TStringField;
    qr_agenciaage_cpf: TStringField;
    qr_agenciaage_endereco: TStringField;
    qr_agenciaage_numero: TStringField;
    qr_agenciaage_comple: TStringField;
    qr_agenciaage_bairro: TStringField;
    qr_agenciaage_cidade: TStringField;
    qr_agenciauf_codigo: TStringField;
    qr_agenciaage_cep: TStringField;
    qr_agenciaage_ie: TStringField;
    qr_agenciaage_rg: TStringField;
    qr_agenciaage_homepage: TStringField;
    qr_agenciaage_email: TStringField;
    qr_agenciaage_fone: TStringField;
    qr_agenciaage_celular: TStringField;
    qr_agenciaage_contato: TStringField;
    qr_agenciaage_obs: TBlobField;
    qr_rep_legal: TSQLQuery;
    qr_rep_legalrpl_id: TIntegerField;
    qr_rep_legalent_id: TIntegerField;
    qr_rep_legalrpl_nome: TStringField;
    qr_rep_legalrpl_nacional: TStringField;
    qr_rep_legalrpl_civil: TStringField;
    qr_rep_legalrpl_profissao: TStringField;
    qr_rep_legalrpl_rg: TStringField;
    qr_rep_legalrpl_cpf: TStringField;
    qr_rep_legalrpl_endereco: TStringField;
    qr_rep_legalrpl_cidade: TStringField;
    qr_rep_legaluf_codigo: TStringField;
    qr_rep_legalrpl_cep: TStringField;
    qr_rep_legalrpl_pais: TStringField;
    qr_rep_legalrpl_nascto: TSQLTimeStampField;
    dsp_rep_legal: TDataSetProvider;
    dsp_cheque: TDataSetProvider;
    qr_cheque: TSQLQuery;
    qr_chequechq_id: TIntegerField;
    qr_chequedup_id: TIntegerField;
    qr_chequeemp_codigo: TIntegerField;
    qr_chequechq_data: TSQLTimeStampField;
    qr_chequechq_emitente: TStringField;
    qr_chequechq_cpfcnpj: TStringField;
    qr_chequetba_codigo: TStringField;
    qr_chequechq_agencia: TStringField;
    qr_chequechq_conta: TStringField;
    qr_chequechq_numero: TIntegerField;
    qr_chequechq_valor: TFMTBCDField;
    qr_chequechq_dtDepo: TSQLTimeStampField;
    qr_chequechq_destino: TStringField;
    qr_chequechq_obs: TBlobField;
    qr_chequedat_inclusao: TSQLTimeStampField;
    qr_chequechq_bompara: TSQLTimeStampField;
    qr_nfsComunicanfc_vDesconto: TFMTBCDField;
    qr_nfsComunicaped_id: TIntegerField;
    qr_nfsComunicaprg_item: TStringField;
    qr_nfsComunicanfc_vTotal: TFMTBCDField;
    qr_nfsComunicanfc_obs: TBlobField;
    qr_nfsComunicaage_codigo: TIntegerField;
    qr_nfsComunicaven_codigo: TIntegerField;
    qr_nfsComunicanfc_pAgencia: TFMTBCDField;
    qr_nfsComunicanfc_pVende: TFMTBCDField;
    qr_nfsComunicanfc_cancel: TStringField;
    qr_nfsComunicamnf_codigo: TStringField;
    qr_update: TSQLQuery;
    qr_pi_programacaoprg_precoTab: TFMTBCDField;
    qr_pi_programacaoprg_qtda: TIntegerField;
    qr_pi_programacaoprg_coluna: TFMTBCDField;
    qr_pi_programacaoprg_medTotal: TFMTBCDField;
    qr_pi_programacaoprg_cm: TFMTBCDField;
    qr_pedido_piped_permuta: TStringField;
    qr_pedido_piped_preReserva: TStringField;
    qr_pi_programacaoprg_saldoPrg: TStringField;
    qr_duplicnfc_id: TIntegerField;
    qr_pedido_piped_situacao: TStringField;
    qr_pedido_piped_cancel: TStringField;
    qr_pi_publicacaoedi_codigo: TIntegerField;
    qr_pi_programacaoprg_vDesc: TFMTBCDField;
    qr_pi_programacaoprg_vDescTab: TFMTBCDField;
    qr_assinantedis_id: TIntegerField;
    qr_assinantecas_id: TIntegerField;
    qr_assinanteass_cnpj: TStringField;
    qr_assinanteass_cpf: TStringField;
    qr_assinanteass_rg: TStringField;
    qr_assinanteass_email: TStringField;
    qr_assinanteass_temPortaria: TStringField;
    qr_assinanteass_dtVigencia_inicio: TSQLTimeStampField;
    qr_assinanteass_dtVigencia_fim: TSQLTimeStampField;
    qr_display: TSQLQuery;
    qr_displaydis_id: TIntegerField;
    qr_displaydis_codigo: TStringField;
    qr_displaydis_nome: TStringField;
    qr_displaydis_ativo: TStringField;
    dsp_display: TDataSetProvider;
    qr_classif_Assinante: TSQLQuery;
    qr_classif_Assinantecas_id: TIntegerField;
    qr_classif_Assinantecas_codigo: TStringField;
    qr_classif_Assinantecas_nome: TStringField;
    qr_classif_Assinantecas_ativo: TStringField;
    dsp_classif_Assinante: TDataSetProvider;
    cds_geral: TClientDataSet;
    qr_extrato: TSQLQuery;
    qr_extratoext_id: TIntegerField;
    qr_extratoemp_codigo: TIntegerField;
    qr_extratoban_codigo: TIntegerField;
    qr_extratoext_codban: TIntegerField;
    qr_extratoext_agencia: TStringField;
    qr_extratoext_conta: TStringField;
    qr_extratoext_data: TSQLTimeStampField;
    qr_extratoext_historico: TStringField;
    qr_extratoext_docto: TStringField;
    qr_extratoext_valor: TFMTBCDField;
    qr_extratoext_tipmov: TStringField;
    qr_extratoext_idRegistro: TStringField;
    dsp_extrato: TDataSetProvider;
    qr_extratoext_saldo: TFMTBCDField;
    qr_duplicext_id: TIntegerField;
    qr_extratoext_conciliado: TStringField;
    qr_bancoban_BancoGeraNossoNro: TStringField;
    qr_bancoban_tpProtesto: TStringField;
    qr_prod_saldo: TSQLQuery;
    qr_prod_saldoprs_id: TIntegerField;
    qr_prod_saldoemp_codigo: TIntegerField;
    qr_prod_saldopro_id: TIntegerField;
    qr_prod_saldoprs_sdAtual: TFMTBCDField;
    qr_prod_saldoprs_sdDispo: TFMTBCDField;
    qr_prod_saldoprs_qReservado: TFMTBCDField;
    dsp_prod_saldo: TDataSetProvider;
    qr_empresaemp_RibbonStyle: TIntegerField;
    qr_empresaemp_imgMenu: TBlobField;
    qr_empresaemp_LimiteCred: TStringField;
    qr_empresaemp_padraoNFSe: TStringField;
    qr_servicoven_codigo: TIntegerField;
    qr_servicotse_codigo: TStringField;
    qr_servicoser_GW_tpLancto: TStringField;
    qr_reserva: TSQLQuery;
    dsp_reserva: TDataSetProvider;
    qr_reservares_id: TIntegerField;
    qr_reservaemp_codigo: TIntegerField;
    qr_reservapro_id: TIntegerField;
    qr_reservaitp_id: TIntegerField;
    qr_reservares_qtda: TFMTBCDField;
    cds_reserva: TClientDataSet;
    cds_prod_saldo: TClientDataSet;
    cds_produto: TClientDataSet;
    cds_item_est: TClientDataSet;
    qr_pi_faturapfa_cancel: TStringField;
    qr_servicoser_pAprox: TFMTBCDField;
    qr_servicoser_vTotTrib: TFMTBCDField;
    qr_servicoser_pComissao: TFMTBCDField;
    qr_assinanteass_ent_ac: TStringField;
    qr_assinanteass_ent_endereco: TStringField;
    qr_assinanteass_ent_numero: TStringField;
    qr_assinanteass_ent_comple: TStringField;
    qr_assinanteass_ent_uf: TStringField;
    qr_assinanteass_ent_cidade: TStringField;
    qr_assinanteass_ent_bairro: TStringField;
    qr_assinanteass_ent_ordem: TIntegerField;
    qr_assinanteass_qSeg: TIntegerField;
    qr_assinanteass_qTer: TIntegerField;
    qr_assinanteass_qQua: TIntegerField;
    qr_assinanteass_qQui: TIntegerField;
    qr_assinanteass_qSex: TIntegerField;
    qr_assinanteass_qSab: TIntegerField;
    qr_assinanteass_qDom: TIntegerField;
    qr_assinanteass_roteiro: TStringField;
    qr_assinanteass_acao_inc: TStringField;
    qr_assinanteass_acao_incDt: TSQLTimeStampField;
    qr_assinanteass_acao_alt: TStringField;
    qr_assinanteass_acao_altDt: TSQLTimeStampField;
    qr_assinanteass_acao_exc: TStringField;
    qr_assinanteass_acao_excDt: TSQLTimeStampField;
    qr_entidadeage_codigo: TIntegerField;
    qr_cadernocad_subcod: TIntegerField;
    qr_cadernocad_ordem: TIntegerField;
    qr_duplicdup_vIOF: TFMTBCDField;
    qr_duplicdup_vTarifa: TFMTBCDField;
    qr_duplicdup_vLiquido: TFMTBCDField;
    qr_duplicdup_descontado: TStringField;
    qr_duplicdup_dtDesconto: TSQLTimeStampField;
    IdHTTP1: TIdHTTP;
    cds_xmlNFe: TClientDataSet;
    cds_notafi: TClientDataSet;
    cds_cce: TClientDataSet;
    cds_xmlNFe_Web: TClientDataSet;
    cds_empresa: TClientDataSet;
    db_Web: TSQLConnection;
    dsp_xmlNfe_Web: TDataSetProvider;
    qr_xmlNfe_Web: TSQLQuery;
    qr_servicoage_codigo: TIntegerField;
    qr_servicoser_pAgencia: TFMTBCDField;
    qr_conciliacao: TSQLQuery;
    dsp_conciliacao: TDataSetProvider;
    qr_conciliacaocon_id: TIntegerField;
    qr_conciliacaocon_data: TSQLTimeStampField;
    qr_conciliacaousu_codigo: TIntegerField;
    qr_dupliccon_id: TIntegerField;
    qr_extratocon_id: TIntegerField;
    qr_pi_programacaocir_codigo: TIntegerField;
    qr_duplicdup_idPulsar: TIntegerField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure dsp_artigoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_duplicBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_anpBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_bancoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_cceBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_cidadeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_cobrancaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_cofinsBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_comissaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_compl_orcaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_conpagBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_conta_emailBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_deducao_serBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_devolucaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_embalaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_empresaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_ent_aliq_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_ent_imp_cofBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_ent_imp_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_ent_imp_ipiBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_ent_imp_pisBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_ent_precoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_entidadeBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_esquemaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_faturaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_finapedBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_formBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_gruproBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_habusuBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_icmsBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_ipiBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_item_cofBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_combBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_diBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_item_estBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_iiBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_item_ipiBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_issqnBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_medBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_notBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_ofBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_item_pisBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_item_serBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_itempedBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_loteBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_lote_movBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_maquinaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_modbcBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_modbcstBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_modnotBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_motorcaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_movobraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_nat_imp_cofBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_nat_imp_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_nat_imp_ipiBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_nat_imp_pisBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_natfinBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_naturaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_notafiBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_obraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_ordfabBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_oriproBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_otbBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_paisBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_pedidoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_pisBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_planoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_prod_aliq_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_compBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_embaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_imp_cofBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_imp_icmsBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_imp_ipiBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_imp_pisBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_similarBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_prod_tabprecBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_produtoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_ramatiBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_reg_deletadoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_servicoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_siafiBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_simplesBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_sitdupBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_sitnfeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_sitribuBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_solicitaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_statuspedBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_tabbanBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_tabprecBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_telefoneBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_tipestBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_tiplogBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_tippedBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_tipproBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_tiptelBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_ufBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_unimedBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_usuarioBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_vendeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_volumeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_romaneioBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pedido_piBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pi_programacaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pi_publicacaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_nfsComunicaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pi_faturaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pi_agenciaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_pi_vendeBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_tipassBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_entregadorBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_bolsaoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_circulacaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_statuspiBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_cadernoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_assinanteBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_chequeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_duplicAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dsp_extratoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dsp_rep_legalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_classif_AssinanteBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dsp_agenciaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    { Private declarations }
    Procedure GravarLog(pDelta: TCustomClientDataSet; pSourceDS: TDataSet;
                        pUpDateKind: TUpdateKind);
   public
    { Public declarations }

    pUSU_Nome, pLoginComputer, pLog_IP,pComputer: String;

    trans: TTransactionDesc;
     {$METHODINFO ON}

       Function  DB_Sequencia(pTabela: String): Integer;
       Procedure StartTransaction();
       Procedure Commit();
       Procedure RollBack();
       Function DatSis(): TDAteTime;
    {$METHODINFO OFF}

    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure Log_ini(pConteudo: String);
    Function  ParametrosConfigWeb(): Boolean;
  end;

var
  SMXE7: TSMXE7;

implementation
{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils, Vcl.dialogs, Unt_SC;

function TSMXE7.EchoString(Value: string): string;
begin
  Result := Value;
end;


function TSMXE7.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TSMXE7.Commit;
begin
    db_Servico.Commit(Trans);
end;

function TSMXE7.DatSis: TDAteTime;
begin
    result := Now();
end;

function TSMXE7.DB_Sequencia(pTabela: String): Integer;
var
  _qx: TSQLQuery;
begin
   Try
      _Qx:=TSQLQuery.create(self);
     _qx.SQLConnection := db_Servico;
     _qx.sql.Text := ' select seq_IDTabela from sequencia '+
                     ' where seq_tabela = '+QuotedStr(ptabela);
     _Qx.open;
     if _qx.RecordCount = 0 then begin
        _Qx.close;
        _qx.sql.Text := ' insert into sequencia '+
                        ' (seq_tabela,seq_IDTabela) '+
                        ' values('+QuotedStr(pTabela)+',1)';
        _Qx.execsql;
        Result := 1;
     end else begin
        Result := _qx.FieldByName('seq_IDTabela').AsInteger + 1;
        _Qx.close;
        _qx.sql.Text := ' update sequencia '+
                        ' set seq_IDTabela = '+inttostr(Result)+
                        ' Where seq_tabela = '+QuotedStr(pTabela);
        _Qx.execsql;
     end;

     FreeAndNil(_Qx);
   except
     raise;
     FreeAndNil(_Qx);
   end;
end;

procedure TSMXE7.dsp_agenciaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_anpBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_artigoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin

      GravarLog(DeltaDS, SourceDS, UpdateKind);
 end;

procedure TSMXE7.dsp_assinanteBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_bancoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_bolsaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_cadernoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_cceBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_chequeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_cidadeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_circulacaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_classif_AssinanteBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_cobrancaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_cofinsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_comissaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_compl_orcaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_conpagBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_conta_emailBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_deducao_serBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_devolucaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_duplicAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
        qr_update.Close;
      qr_update.CommandText :=
        ' update duplic '+
        ' set dup_saldo = (dup_valor - dup_valpag - dup_valdes - dup_valdev) '+
        ' where dup_id = ' + qr_duplic.Params[0].Asstring;
      qr_update.ExecSQL();

end;

procedure TSMXE7.dsp_duplicBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
    _dup_saldo : Double;

begin
      //Pra funciona esta rotina, todos os campos requeridos tem que estar FALSE

{     Showmessage('Valor: '  + formatfloat('##,###,##0.00', DeltaDS.FieldByName('dup_valor').NewValue)  + #13 +
                  'Pago:  '  + DeltaDS.FieldByName('dup_valpag').Asstring);
            //      'Saldo: '  + floattostr( _dup_saldo ));


      _dup_saldo :=
           ( SourceDS.FieldByName('dup_valor').value -
           ( SourceDS.FieldByName('dup_valpag').value +
             SourceDS.FieldByName('dup_valdes').value +
             SourceDS.FieldByName('dup_valdev').value));

      DeltaDS.Edit();
      DeltaDS.FieldByName('dup_saldo').value := _dup_saldo;
      DeltaDS.post();
}
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_embalaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_empresaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_entidadeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_entregadorBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_aliq_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_imp_cofBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_imp_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_imp_ipiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_imp_pisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ent_precoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_esquemaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_extratoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_faturaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_finapedBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_formBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_gruproBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_habusuBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ipiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_itempedBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_cofBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_combBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_diBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_estBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_iiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_ipiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_issqnBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_medBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_notBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_ofBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_pisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_item_serBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_loteBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_lote_movBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_maquinaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_modbcBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_modbcstBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_modnotBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_motorcaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_movobraBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_natfinBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_naturaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_nat_imp_cofBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_nat_imp_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_nat_imp_ipiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_nat_imp_pisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_nfsComunicaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_notafiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_obraBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ordfabBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_oriproBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_otbBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_paisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pedidoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pedido_piBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pi_agenciaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pi_faturaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pi_programacaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pi_publicacaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_pi_vendeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_planoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_produtoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_aliq_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_compBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_embaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_imp_cofBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_imp_icmsBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_imp_ipiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_imp_pisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_similarBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_prod_tabprecBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ramatiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_reg_deletadoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_rep_legalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);

end;

procedure TSMXE7.dsp_romaneioBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_servicoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_siafiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_simplesBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_sitdupBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_sitnfeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_sitribuBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_solicitaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_statuspedBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_statuspiBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tabbanBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tabprecBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_telefoneBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tipassBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tipestBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tiplogBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tippedBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tipproBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_tiptelBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_ufBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_unimedBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_usuarioBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_vendeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.dsp_volumeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
      GravarLog(DeltaDS, SourceDS, UpdateKind);
end;

procedure TSMXE7.DSServerModuleCreate(Sender: TObject);
var
  _ini: Tinifile;
begin
    db_Servico.Connected := false;
    _Ini := TIniFile.Create(ExtractFilePath( ParamStr(0) )+'\config.ini');
    db_Servico.Params.Values['HostName']  := 'Localhost';
    db_Servico.Params.Values['Database']  := _ini.ReadString('MYSQL','DataBase','');
    db_Servico.Params.Values['User_Name'] := _ini.ReadString('MYSQL','User','');
    db_Servico.Params.Values['Password']  := _ini.ReadString('MYSQL','Password','');
    db_Servico.Params.Values['Port']      := _ini.ReadString('MYSQL','Port','');
    _ini.Free;

    trans.IsolationLevel := xilREADCOMMITTED;
end;

Procedure TSMXE7.GravarLog(pDelta: TCustomClientDataSet; pSourceDS: TDataSet; pUpDateKind: TUpdateKind);
var
    i,_usu_codigo, _tpl_codigo: integer;
    _log_Descricao, _log_tabela : WideString;
    _qx: TSQLQuery;
begin
      //Dica apfterPostClientDataSet
      // (DataSet as TCustomClientDataSet).applyupdates(0);

      _tpl_codigo := 0;
      Case pUpDateKind of
            ukInsert: _tpl_codigo := 1;
            ukModify: _tpl_codigo := 2;
            ukDelete: _tpl_codigo := 3;
      end;
      _log_tabela := Data.DB.IProviderSupport(TCustomClientDataSet(pSourceDS)).PSGetTableName;


      _log_Descricao := '';
      for i := 0 to pDelta.FieldCount - 1 do begin
        if pDelta.Fields[i].IsBlob then continue; //Todo campo blob dá erro na corel ????????????????
        if _Tpl_codigo = 2 then begin //(alteracao)
           If(not VarIsClear(pDelta.Fields[i].NewValue)) then Begin
              _log_Descricao := _log_Descricao +
//                  'Campo: >> '+pDelta.Fields[i].DisplayLabel + '  (' + pDelta.Fields[i].FieldName + ')  << '+#13+
                  'Campo: >> ' +
                    pSourceDS.FieldByName( pDelta.Fields[i].FieldName ).DisplayLabel +
                    '  (' +
                    pDelta.Fields[i].FieldName + ')  << '+#13+
                  ' Antigo: '+   vartoStr(pDelta.Fields[i].OldValue) +#13+
                  ' Alterado: '+ vartoStr(pDelta.Fields[i].value)+#13;
           end;
        end else begin
            _log_Descricao := _log_Descricao +
                  'Campo: '+pDelta.Fields[i].DisplayLabel +
                  '   >> '+vartoStr(pDelta.Fields[i].value)+#13;
        end;
      end;
      if _log_descricao = ''  then exit;

      //Localiza Usuario
      _qx:=TSQLQuery.create(self);
      _qx.SQLConnection := db_Servico;
      _qx.sql.Text :=
         ' select usu_codigo from usuario '+
         ' where usu_login = ' + QuotedStr(SMXE7.pUSU_Nome);
      _qx.Open;
      _usu_codigo := 1;
      if _qx.RecordCount > 0 then
         _usu_codigo := _qx.FieldByName('usu_codigo').AsInteger;
      _qx.Free;

      cds_log.close;
      cds_log.Params[0].AsInteger := 0;
      cds_log.Open;
      cds_log.append;
      cds_log.fieldbyname('log_id').AsInteger := DB_sequencia('log');
      cds_log.fieldbyname('tpl_codigo').AsInteger := _Tpl_codigo;
      cds_log.fieldbyname('usu_codigo').AsInteger := _Usu_codigo;
      cds_log.fieldbyname('log_data').Asdatetime  := now();
      cds_log.fieldbyname('log_tabela').Asstring := _Log_Tabela;
      cds_log.fieldbyname('log_IDtabela').Asinteger := pDelta.Fields[0].OldValue;
      cds_log.fieldbyname('log_Descricao').Asstring := _log_descricao;
      cds_log.fieldbyname('log_computer').Asstring := SMXE7.pComputer;
      cds_log.fieldbyname('log_username').Asstring := SMXE7.pLoginComputer;
      cds_log.fieldbyname('log_ip').Asstring       := SMXE7.pLog_IP;
      cds_log.Post;
      cds_log.ApplyUpdates(0);
end;

procedure TSMXE7.Log_ini(pConteudo: String);
var
  _ini: Tinifile;
begin
    _Ini := TIniFile.Create(ExtractFilePath( ParamStr(0) )+'\config.ini');
    _ini.WriteString('LOG' ,formatdatetime('dd.mm.yy hh.mm.sss', now()),pConteudo);
    _ini.Free;

end;


function TSMXE7.ParametrosConfigWeb: Boolean;
var
   lURL : String;
   lResponse : TStringStream;
   ini : TIniFile;
   str: TSTringList;
   host: String;
   arq: String;
begin
    Result := false;
    lResponse := TStringStream.Create('');
    str := TStringList.create;
    try
       lURL := 'http://www.kiron.net.br/NFe/Config.txt';
       try
          idHttp1.Get(lURL, lResponse);
       except
          exit;

       end;
       lResponse.Position := 0;
       { Exemplo de uso do response : carregar o conteúdo num RichEdit : }
       str.LoadFromStream(lResponse);
       arq := ExtractFilePath(ParamStr(0))+'\xCon.txt';
       str.SaveToFile(arq);
       ini := TiniFile.Create(arq);

       db_ADM.Params.Values['HostName'] := ini.ReadString('Servidor2','HostName','');
       db_ADM.Params.Values['Port']     := '3309';

       db_Web.Close;
       db_web.Params.Values['HostName'] := ini.ReadString('Servidor','HostName','');
       db_web.Params.Values['Database'] := ini.ReadString('Servidor','Database','');
       db_web.Params.Values['User_Name'] := ini.ReadString('Servidor','UserName','');
       db_web.Params.Values['Password'] := ini.ReadString('Servidor','Password','');
       db_web.Params.Values['Port']     := ini.ReadString('Servidor','Port','');

       //FTP
{       pFTP_Host     := ini.ReadString('FTP','Host','');
       pFTP_User     := ini.ReadString('FTP','User','');
       pFTP_Password := ini.ReadString('FTP','Password','');
       pFTP_Port     := ini.ReadString('FTP','Port','');
}
       if FileExists(arq) then
          DeleteFile(pChar(arq));
     finally
        lResponse.Free();
        str.Free;
        ini.Free;
        Result := True;
     end;

end;

procedure TSMXE7.RollBack;
begin
    db_Servico.Rollback(Trans);
end;

procedure TSMXE7.StartTransaction;
begin
   db_Servico.StartTransaction(Trans);
end;
end.


{ Observações Importantes:
  - procedimento para StartTransaction ( commit manual )
      cds_entidade.post;
      db_ADM.StartTransaction;
      cds_entidade.applyupdate(0);
      db_ADM.Commit;
  - procedimento SEM StartTransaction ( commit automático )
      cds_entidade.post;
      cds_entidade.applyupdate(0);
}

