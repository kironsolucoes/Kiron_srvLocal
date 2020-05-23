object SC: TSC
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'Kiron Local (v1.35)'
  AfterInstall = ServiceAfterInstall
  OnStart = ServiceStart
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    AutoStart = False
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 3309
    Server = DSServer1
    Filters = <>
    KeepAliveEnablement = kaDisabled
    Left = 96
    Top = 73
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    Left = 207
    Top = 80
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 328
    Top = 16
  end
  object Timer2: TTimer
    Interval = 60000
    OnTimer = Timer2Timer
    Left = 328
    Top = 80
  end
end
