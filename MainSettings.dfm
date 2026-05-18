object mainSettingsForm: TmainSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 492
  ClientWidth = 334
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 16
  object BitBtn1: TBitBtn
    Left = 48
    Top = 456
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 456
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 71
    Width = 317
    Height = 145
    Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1076#1072#1090#1095#1080#1082#1086#1074' '#1080' '#1075#1088#1072#1092#1080#1082#1086#1074
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object T0ColorShape: TShape
      Left = 265
      Top = 23
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = T0ColorShapeMouseDown
    end
    object T1ColorShape: TShape
      Left = 265
      Top = 41
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = T1ColorShapeMouseDown
    end
    object T2ColorShape: TShape
      Left = 265
      Top = 59
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = T2ColorShapeMouseDown
    end
    object T3ColorShape: TShape
      Left = 265
      Top = 77
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = T3ColorShapeMouseDown
    end
    object ADColorShape: TShape
      Left = 265
      Top = 95
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = ADColorShapeMouseDown
    end
    object XGZPColorShape: TShape
      Left = 265
      Top = 114
      Width = 22
      Height = 18
      Shape = stRoundSquare
      OnMouseDown = XGZPColorShapeMouseDown
    end
    object SensorVisibleCheckBox0: TCheckBox
      Left = 32
      Top = 23
      Width = 83
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' '#1058'0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = SensorVisibleCheckBox0Click
    end
    object SensorVisibleCheckBox1: TCheckBox
      Tag = 1
      Left = 32
      Top = 41
      Width = 83
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' '#1058'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = SensorVisibleCheckBox1Click
    end
    object SensorVisibleCheckBox2: TCheckBox
      Tag = 2
      Left = 32
      Top = 59
      Width = 83
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' '#1058'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = SensorVisibleCheckBox2Click
    end
    object SensorVisibleCheckBox3: TCheckBox
      Tag = 3
      Left = 32
      Top = 77
      Width = 83
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' '#1058'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SensorVisibleCheckBox3Click
    end
    object GrafVisibleCheckBox0: TCheckBox
      Left = 152
      Top = 23
      Width = 83
      Height = 17
      Caption = #1043#1088#1072#1092#1080#1082' '#1058'0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = GrafVisibleCheckBox0Click
    end
    object GrafVisibleCheckBox1: TCheckBox
      Left = 152
      Top = 41
      Width = 83
      Height = 17
      Caption = #1043#1088#1072#1092#1080#1082' '#1058'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = GrafVisibleCheckBox1Click
    end
    object GrafVisibleCheckBox2: TCheckBox
      Left = 152
      Top = 59
      Width = 83
      Height = 17
      Caption = #1043#1088#1072#1092#1080#1082' '#1058'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = GrafVisibleCheckBox2Click
    end
    object GrafVisibleCheckBox3: TCheckBox
      Left = 152
      Top = 77
      Width = 83
      Height = 17
      Caption = #1043#1088#1072#1092#1080#1082' '#1058'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = GrafVisibleCheckBox3Click
    end
    object AtmoGrafVisibleCheckBox: TCheckBox
      Tag = 3
      Left = 32
      Top = 95
      Width = 139
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' BMP180'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    object PressureGrafVisibleCheckBox: TCheckBox
      Tag = 3
      Left = 32
      Top = 113
      Width = 139
      Height = 17
      Caption = #1044#1072#1090#1095#1080#1082' XGZP6857'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = PressureGrafVisibleCheckBoxClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 317
    Height = 62
    Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1080' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 39
      Top = 21
      Width = 145
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1099#1081' '#1087#1086#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ComComboBox: TComComboBox
      Left = 220
      Top = 24
      Width = 77
      Height = 24
      ComPort = MainForm.ComPort
      ComProperty = cpPort
      Text = 'COM1'
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
    end
    object SaveDataCheckBox: TCheckBox
      Left = 11
      Top = 38
      Width = 188
      Height = 21
      Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1072#1081#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = SaveDataCheckBoxClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 222
    Width = 317
    Height = 75
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1072#1075#1088#1077#1074#1072#1090#1077#1083#1103
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object StaticText1: TStaticText
      Left = 21
      Top = 24
      Width = 167
      Height = 20
      Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1072#1103' '#1084#1086#1097#1085#1086#1089#1090#1100' '#1074#1072#1090#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 21
      Top = 45
      Width = 150
      Height = 20
      Caption = '   '#1087#1088#1080' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1080' '#1074#1086#1083#1100#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditNominalPower: TEdit
      Left = 198
      Top = 20
      Width = 89
      Height = 24
      Alignment = taCenter
      AutoSize = False
      TabOrder = 2
      Text = '~~~~'
      OnKeyPress = EditNominalPowerKeyPress
    end
    object EditNominalVoltage: TEdit
      Left = 198
      Top = 45
      Width = 89
      Height = 24
      Alignment = taCenter
      AutoSize = False
      TabOrder = 3
      Text = '~~~'
      OnKeyPress = EditNominalVoltageKeyPress
    end
    object HeaterSettingsEnableCheckBox: TCheckBox
      Left = 298
      Top = 11
      Width = 16
      Height = 17
      TabOrder = 4
      OnClick = HeaterSettingsEnableCheckBoxClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 300
    Width = 317
    Height = 77
    Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '#1085#1072#1089#1086#1089#1072
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    object Label100mlCount: TLabel
      Left = 198
      Top = 17
      Width = 89
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '1000000'
    end
    object StaticText3: TStaticText
      Left = 21
      Top = 17
      Width = 159
      Height = 20
      Caption = #1064#1072#1075#1086#1074' '#1085#1072' 100 '#1084#1083' '#1090#1077#1082#1091#1097#1077#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText4: TStaticText
      Left = 21
      Top = 37
      Width = 168
      Height = 20
      Caption = #1064#1072#1075#1086#1074' '#1085#1072' 100 '#1084#1083' '#1078#1077#1083#1072#1077#1084#1086#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox100mlEnabled: TCheckBox
      Left = 298
      Top = 10
      Width = 16
      Height = 17
      TabOrder = 2
      OnClick = CheckBox100mlEnabledClick
    end
    object Edit100mlCount: TEdit
      Left = 198
      Top = 33
      Width = 89
      Height = 24
      Alignment = taCenter
      AutoSize = False
      TabOrder = 3
      Text = '~~~~'
      OnKeyPress = Edit100mlCountKeyPress
    end
    object Save100mlCheckBox: TCheckBox
      Left = 21
      Top = 57
      Width = 228
      Height = 17
      Alignment = taLeftJustify
      Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1074' EEPROM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object GroupBoxSounds: TGroupBox
    Left = 8
    Top = 377
    Width = 318
    Height = 72
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1074#1091#1082#1086#1074
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    object CheckBoxSoundsOn: TCheckBox
      Left = 32
      Top = 30
      Width = 97
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBoxSoundsOnClick
    end
    object CheckBoxDisconnect: TCheckBox
      Left = 190
      Top = 11
      Width = 97
      Height = 17
      Caption = #1055#1086#1090#1077#1088#1103' '#1089#1074#1103#1079#1080
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = CheckBoxDisconnectClick
    end
    object CheckBoxOverheat: TCheckBox
      Left = 190
      Top = 30
      Width = 97
      Height = 17
      Caption = #1055#1077#1088#1077#1075#1088#1077#1074
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBoxOverheatClick
    end
    object CheckBoxAutostop: TCheckBox
      Left = 190
      Top = 48
      Width = 97
      Height = 17
      Caption = #1040#1074#1090#1086#1089#1090#1086#1087
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBoxAutostopClick
    end
  end
  object ColorDialog1: TColorDialog
    Color = clCream
    Left = 8
    Top = 120
  end
end
