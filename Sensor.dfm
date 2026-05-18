object SensorForm: TSensorForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SensorForm'
  ClientHeight = 302
  ClientWidth = 334
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnActivate = FormShow
  OnShow = FormShow
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 318
    Height = 53
    Caption = #1048#1084#1103' '#1076#1083#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1085#1072' '#1101#1082#1088#1072#1085#1077
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object EditName: TEdit
      Left = 16
      Top = 22
      Width = 282
      Height = 26
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '~~~~'
    end
  end
  object SensorOk: TBitBtn
    Left = 56
    Top = 270
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object SensorCancel: TBitBtn
    Left = 208
    Top = 270
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 58
    Width = 318
    Height = 86
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1088#1086#1075#1072' '#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1103
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object LabelCurrentT: TLabel
      Left = 33
      Top = 41
      Width = 80
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = '----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 52
      Top = 22
      Width = 42
      Height = 14
      Alignment = taCenter
      Caption = #1058#1077#1082#1091#1097#1077#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label3: TLabel
      Left = 219
      Top = 21
      Width = 29
      Height = 14
      Alignment = taCenter
      Caption = #1055#1086#1088#1086#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object EditMargin: TEdit
      Left = 183
      Top = 40
      Width = 97
      Height = 40
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '--.--'
      OnKeyPress = EditMarginKeyPress
    end
    object ButtonCopyT: TButton
      Left = 126
      Top = 41
      Width = 51
      Height = 35
      Caption = '>>> +0.125'
      TabOrder = 1
      WordWrap = True
      OnClick = ButtonCopyTClick
    end
    object Button1: TButton
      Left = 286
      Top = 22
      Width = 25
      Height = 25
      Caption = '+'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 286
      Top = 55
      Width = 25
      Height = 25
      Caption = '-'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 148
    Width = 318
    Height = 78
    Caption = #1056#1077#1072#1082#1094#1080#1080' '#1085#1072' '#1087#1088#1077#1074#1099#1096#1077#1085#1080#1077' '#1087#1086#1088#1086#1075#1072
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object CheckBoxReactionOn: TCheckBox
      Left = 16
      Top = 36
      Width = 97
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBoxReactionOnClick
    end
    object CheckBoxSound: TCheckBox
      Left = 175
      Top = 18
      Width = 123
      Height = 17
      Caption = #1047#1074#1091#1082#1086#1074#1086#1081' '#1089#1080#1075#1085#1072#1083
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CheckBoxPumpStop: TCheckBox
      Left = 175
      Top = 36
      Width = 123
      Height = 17
      Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1089#1086#1089
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object CheckBoxHeaterOff: TCheckBox
      Left = 175
      Top = 55
      Width = 123
      Height = 17
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1085#1072#1075#1088#1077#1074
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 228
    Width = 318
    Height = 36
    TabOrder = 5
  end
end
