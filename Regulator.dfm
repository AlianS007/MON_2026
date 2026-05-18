object RegulatorForm: TRegulatorForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1091#1083#1103#1090#1086#1088' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103
  ClientHeight = 370
  ClientWidth = 334
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 318
    Height = 97
    Caption = #1071#1095#1077#1081#1082#1080' '#1087#1072#1084#1103#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object ButtonM0: TButton
      Left = 15
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnMouseDown = ButtonM_MouseDown
    end
    object ButtonM1: TButton
      Left = 67
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnMouseDown = ButtonM_MouseDown
    end
    object ButtonM2: TButton
      Left = 115
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnMouseDown = ButtonM_MouseDown
    end
    object ButtonM3: TButton
      Left = 163
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnMouseDown = ButtonM_MouseDown
    end
    object ButtonM4: TButton
      Left = 211
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnMouseDown = ButtonM_MouseDown
    end
    object ButtonM5: TButton
      Left = 259
      Top = 32
      Width = 46
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnMouseDown = ButtonM_MouseDown
    end
    object StaticText1: TStaticText
      Left = 6
      Top = 72
      Width = 316
      Height = 18
      Caption = #1055#1088#1072#1074#1099#1081' '#1082#1083#1080#1082' '#1079#1072#1087#1080#1096#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1087#1086#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 109
    Width = 318
    Height = 117
    Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1094#1077#1083#1077#1074#1086#1075#1086' '#1079#1085#1072#1095#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object SpeedButtonUp: TSpeedButton
      Left = 215
      Top = 25
      Width = 23
      Height = 20
      Caption = '+'
      OnClick = SpeedButtonUpClick
    end
    object SpeedButtonDn: TSpeedButton
      Left = 215
      Top = 45
      Width = 23
      Height = 20
      Caption = '-'
      OnClick = SpeedButtonDnClick
    end
    object TargetEdit: TEdit
      Left = 84
      Top = 25
      Width = 115
      Height = 40
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnKeyPress = TargetEditKeyPress
    end
    object TrackBar1: TTrackBar
      Left = 14
      Top = 77
      Width = 300
      Height = 37
      Ctl3D = True
      LineSize = 10
      Max = 2500
      ParentCtl3D = False
      PageSize = 10
      Frequency = 200
      PositionToolTip = ptTop
      SelEnd = 2500
      TabOrder = 1
      OnChange = TrackBar1Change
    end
    object ZeroButton: TButton
      Left = 24
      Top = 25
      Width = 49
      Height = 40
      Caption = '0'
      TabOrder = 2
      OnClick = ZeroButtonClick
    end
    object MaxButton: TButton
      Left = 249
      Top = 25
      Width = 49
      Height = 40
      Caption = 'Max'
      TabOrder = 3
      OnClick = MaxButtonClick
    end
  end
  object RegulatorOk: TBitBtn
    Left = 27
    Top = 330
    Width = 86
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtnApplyClick
  end
  object RegulatorCancel: TBitBtn
    Left = 217
    Top = 330
    Width = 84
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtnApply: TBitBtn
    Left = 123
    Top = 330
    Width = 86
    Height = 25
    Caption = '&'#1055#1088#1080#1084#1077#1085#1080#1090#1100
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtnApplyClick
  end
  object GroupBoxForceControl: TGroupBox
    Left = 8
    Top = 229
    Width = 318
    Height = 82
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1088#1072#1079#1075#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object Label1: TLabel
      Left = 115
      Top = 26
      Width = 37
      Height = 14
      Caption = #1044#1072#1090#1095#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 118
      Top = 57
      Width = 29
      Height = 14
      Caption = #1055#1086#1088#1086#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ForceControlCheckBox: TCheckBox
      Left = 16
      Top = 34
      Width = 73
      Height = 32
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
    end
    object SensorsNameComboBox: TComboBox
      Left = 172
      Top = 21
      Width = 121
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ForceBoundEdit: TEdit
      Left = 172
      Top = 51
      Width = 121
      Height = 26
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'ForceBoundEdit'
      OnKeyPress = ForceBoundEditKeyPress
    end
  end
end
