object MainForm: TMainForm
  Left = 0
  Top = 0
  AlphaBlendValue = 150
  Caption = #1052#1086#1085#1080#1090#1086#1088' '#1082#1086#1083#1086#1085#1085#1099
  ClientHeight = 541
  ClientWidth = 984
  Color = 2097152
  Constraints.MinHeight = 580
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clYellow
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 14
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 541
    Align = alLeft
    Color = 3342336
    Constraints.MinWidth = 136
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    object ForceInfoLabel: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 145
      Width = 138
      Height = 17
      Margins.Left = 10
      Margins.Right = 10
      Align = alTop
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Font.Quality = fqClearType
      ParentFont = False
      WordWrap = True
      OnClick = StabLabelClick
      ExplicitTop = 129
      ExplicitWidth = 4
    end
    object StabLabel2: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 123
      Width = 148
      Height = 16
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      Alignment = taCenter
      Caption = #1053#1045#1058' '#1057#1058#1040#1041
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ExplicitWidth = 60
    end
    object StabPanel: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 154
      Height = 115
      Margins.Left = 2
      Margins.Top = 4
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Color = 3342336
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object StabLabel: TLabel
        Left = 1
        Top = 29
        Width = 152
        Height = 56
        Align = alClient
        Alignment = taCenter
        Caption = '--.--'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = StabLabelClick
        ExplicitWidth = 20
        ExplicitHeight = 13
      end
      object StabModePanel: TPanel
        Left = 1
        Top = 1
        Width = 152
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 3342336
        Constraints.MinHeight = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object StabModeButtonForce: TSpeedButton
          Left = 87
          Top = 0
          Width = 40
          Height = 28
          Margins.Left = 1
          Margins.Right = 1
          Margins.Bottom = 0
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1056#1072#1079#1075#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnMouseDown = StabModeButtonForceMouseDown
        end
        object StabModeButtonNormal: TSpeedButton
          Left = 42
          Top = 0
          Width = 40
          Height = 28
          Margins.Left = 1
          Margins.Right = 1
          Margins.Bottom = 0
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1057#1090#1072#1073
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnMouseDown = StabModeButtonNormalMouseDown
        end
        object StabModeButtonStop: TSpeedButton
          Left = -4
          Top = 0
          Width = 40
          Height = 28
          Margins.Left = 1
          Margins.Right = 1
          Margins.Bottom = 0
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1042#1099#1082#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnMouseDown = StabModeButtonStopMouseDown
        end
      end
      object StabInfoPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 85
        Width = 146
        Height = 27
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alBottom
        BevelOuter = bvNone
        Caption = '~~~~~~'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object PumpPanel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 169
      Width = 148
      Height = 266
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alTop
      AutoSize = True
      Color = 3342336
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object PumpSpeedHeaderLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 56
        Width = 140
        Height = 17
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1058#1077#1084#1087' '#1084#1083'/'#1095
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Ariail'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object PumpTotalHeaderLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 111
        Width = 140
        Height = 21
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1048#1090#1086#1075#1086', '#1084#1083
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object PumpRemainHeaderLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 179
        Width = 140
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1040#1074#1090#1086
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 2
        ExplicitTop = 155
        ExplicitWidth = 146
      end
      object PumpRemainFooterLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 242
        Width = 140
        Height = 0
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = '00:00.00'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitTop = 239
      end
      object PumpModePanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 11
        Width = 140
        Height = 32
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alTop
        BevelOuter = bvNone
        Color = 3342336
        Constraints.MinHeight = 24
        ParentBackground = False
        TabOrder = 0
        object PumpStopButton: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 56
          Height = 32
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          GroupIndex = 10
          Caption = #1057#1090#1086#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnMouseDown = PumpStartButtonMouseDown
          ExplicitTop = -2
        end
        object PumpStartButton: TSpeedButton
          AlignWithMargins = True
          Left = 72
          Top = 0
          Width = 65
          Height = 32
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          GroupIndex = 10
          Caption = #1055#1091#1089#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnMouseDown = PumpStartButtonMouseDown
          ExplicitLeft = 80
          ExplicitTop = 1
          ExplicitHeight = 30
        end
      end
      object PumpSpeedPanel: TPanel
        Left = 1
        Top = 76
        Width = 146
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        Caption = '----'
        Color = 3342336
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3381759
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        OnClick = PumpSpeedPanelClick
      end
      object PumpTotalPanel: TPanel
        Left = 1
        Top = 135
        Width = 146
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = '----'
        Color = 3342336
        DoubleBuffered = True
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = PumpTotalPanelClick
      end
      object PumpRemainPanel: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 198
        Width = 146
        Height = 41
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Caption = '----'
        Color = 3342336
        DoubleBuffered = True
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = PumpRemainPanelClick
      end
      object RemainTimePanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 245
        Width = 140
        Height = 20
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        BevelEdges = [beTop]
        BevelKind = bkSoft
        BevelOuter = bvNone
        Color = 3342336
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Padding.Left = 5
        Padding.Right = 5
        ParentBackground = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object PanelService: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 476
      Width = 148
      Height = 60
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alBottom
      Color = 3342336
      ParentBackground = False
      TabOrder = 2
      object ServiceSpeedButton: TSpeedButton
        AlignWithMargins = True
        Left = 46
        Top = 7
        Width = 93
        Height = 48
        Margins.Left = 8
        Margins.Top = 6
        Margins.Right = 8
        Margins.Bottom = 4
        Align = alClient
        Glyph.Data = {
          361B0000424D361B000000000000360000002800000030000000300000000100
          180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCF8EAD786E2C857E2C8
          58EAD889FEFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFBF8EADEC141DFC349DFC247DFC44AE0C54EDEC142FEFDFCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EADEC142DFC34AE9D785FAF5E2F3E9
          BBDFC349E0C54EEAD88AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFDDDDDDD0D0D0D1D1D1D1D1D1D1D1D1D0D0D0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EADE
          C142E1C651E4CC65FFFFFFFFFFFFFFFFFFF3E8BBDFC44AE2C858FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE0F0F0F20202020202020202020
          2020171717626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFBF8EADEC142E1C755E0C550EBD98DFFFFFFFFFFFFFFFF
          FFF9F5E2DFC247E2C857FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          8787872727273333333333333333333333332E2E2E3F3F3FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EADEC142E1C755E2
          C857E1C755E0C44CFFFFFFFFFFFFFFFFFFE9D684DFC349EAD787FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B27272733333333333333333333
          33332E2E2E434343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBF8EADEC142E1C755E2C857E2C857E2C857E1C754E0C44CEBD98DE4CC
          65DFC34ADEC142FEFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9494942727273333333333333333333333332E2E2E474747FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EADEC142E1C755E2C857E2C857E2
          C857E2C857E2C857E1C755E0C550E1C651DEC143FBF8EBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F454545FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC9C9C97D7D7D3B3B3B30303033333333333333333333
          33333232323030306C6C6CB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EA
          DEC142E1C755E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754DEC1
          43FBF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A
          4A4A2424242929292C2C2CFFFFFFFFFFFFFFFFFF9292922525251F1F1F282828
          3030303333333333333333333333333333333333333232322A2A2A2323231919
          196B6B6BE4E4E4FFFFFFFBF8EADEC142E1C755E2C857E2C857E2C857E2C857E2
          C857E2C857E2C857E1C754DEC143FBF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4A4A4A2727273333333333332C2C2C353535B5B5
          B520202025252531313133333333333333333333333333333333333333333333
          33333333333333333333333333332A2A2A2C2C2CFDFEFFFDFAECDEC142E1C755
          E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754DEC143FBF8EBFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A27272733
          33333333333333333333332F2F2F252525313131333333333333333333333333
          3333333333333333333333333333333333333333333333333333332B2B2B3434
          34FFFFFFFFFDEFDEC142E1C755E2C857E2C857E2C857E2C857E2C857E2C857E2
          C857E1C754DEC143FBF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF8787872020203333333333333333333333333333333333333333
          333333333333333333333333333232322B2B2B2424242020201D1D1D1D1D1D1F
          1F1F232323292929292929333333FFFFFFFFFDEFDEC142E1C755E2C857E2C857
          E2C857E2C857E2C857E2C857E2C857E1C754DEC143FBF8EBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBB14141432323233
          33333333333333333333333333333333333333333333333131312424241D1D1D
          696969ABABABD6D6D6EDEDEDF0F0F0DFDFDFB9B9B97A7A7A3F3F3FFFFFFFFFFD
          EFDEC142E1C755E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754DE
          C143FBF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFA7A7A71717173232323333333333333333333333333333
          333333332A2A2A2121219F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFAECDEC142E1C755E2C857E2C857E2C857E2C857
          E2C857E2C857E2C857E1C754DEC143FBF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B025
          25253232323333333333333333333333332020205B5B5BFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8EADEC142E1C7
          55E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754DEC143FBF8EBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD7D7D72121213333333333333333333333331C1C
          1C888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFBF8EADEC142E1C755E2C857E2C857E2C857E2C857E2C857E2C857
          E2C857E1C754DEC143FEFAEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3131312F
          2F2F333333333333333333222222808080FFFFFFFFFFFFFFFFFFFFFFFFF9F3DC
          EBD98CE3CA60E0C54EE1C754E6D172F0E3ACF8F3DBDEC245E1C755E2C857E2C8
          57E2C857E2C857E2C857E2C857E2C857E1C754DEC143FFFDF0FCFDFFE4E4E4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBCBCBC1F1F1F3333333333333333332C2C2C494949FFFF
          FFFFFFFFFFFFFFFFFFFFE6D072DEC142E0C54FE1C653E1C755E1C754E1C651E0
          C44CDFC349E1C756E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754
          DEC143FFFDF0FFFFFF2B2B2B6C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D2D2D2D33
          3333333333323232191919FAFAFAFFFFFFFFFFFFFFFFFFE1C653E0C54EE2C857
          E2C857E2C857E2C857E2C857E2C857E2C857E2C857E2C857E2C857E2C857E2C8
          57E2C857E2C857E2C857E1C754DEC143FFFDEFFFFFFF3535352A2A2A191919FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFCFC171717323232333333333333292929787878FFFFFFFFFF
          FFFFFFFFE7D278E0C54DE2C857E2C857E2C857E2C857E2C857E2C857E2C857E2
          C857E2C857E2C857E2C857E2C857E2C857E2C857E2C857E1C754DEC143FDFAED
          FFFFFF3636362A2A2A333333222222B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B823232333333333
          33333333331B1B1BE8E8E8FFFFFFFFFFFFFAF6E5DEC040E2C856E2C857E2C857
          E2C857E0C550E0C54FE2C857E2C857E2C857E2C857E2C857E2C857E2C857E2C8
          57E2C857E1C754DEC143FBF8EBFFFFFF4242422828283333333333332A2A2A6D
          6D6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A73C3C3C
          444444464646373737313131333333333333303030333333FFFFFFFFFFFFFFFF
          FFEDDD97E0C54EE2C857E2C857E2C857DFC246EBD98CEBDA8FDFC246E2C857E2
          C857E2C857E2C857E2C857E2C857E2C857E1C755DEC245FBF8EBFFFFFFFFFFFF
          7A7A7A292929333333333333323232303030474747444444404040616161FFFF
          FFFFFFFFFFFFFFFFFFFF2929292E2E2E2E2E2E2E2E2E31313133333333333333
          33332A2A2A727272FFFFFFFFFFFFFFFFFFE5CF6DE1C652E2C857E2C857DEC144
          EDDE9BFFFFFFFFFFFFEEDF9FDEC143E2C857E2C857E2C857E2C857E2C857E2C8
          57DFC349F9F3DCFFFFFFFFFFFFFFFFFFB9B9B923232333333333333333333332
          32322E2E2E2E2E2E2E2E2E171717CFCFCFFFFFFFFFFFFFFFFFFF323232333333
          333333333333333333333333333333333333262626989898FFFFFFFFFFFFFFFF
          FFE3CA5DE1C753E2C857DEC144EDDE9BFFFFFFFFFFFFFFFFFFFFFFFFEEDF9FDE
          C143E2C857E2C857E2C857E2C857E2C857E0C44CF0E4ACFFFFFFFFFFFFFFFFFF
          DFDFDF1F1F1F333333333333333333333333333333333333333333202020D0D0
          D0FFFFFFFFFFFFFFFFFF33333333333333333333333333333333333333333333
          3333242424A9A9A9FFFFFFFFFFFFFFFFFFE4CC65E1C653DEC144EDDE9BFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFA0DEC143E2C857E2C857E2C857E2C8
          57E1C651E6D173FFFFFFFFFFFFFFFFFFF0F0F01D1D1D33333333333333333333
          3333333333333333333333202020D1D1D1FFFFFFFFFFFFFFFFFF333333333333
          333333333333333333333333333333333333252525A7A7A7FFFFFFFFFFFFFFFF
          FFE9D785DDBF3DEDDE9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFEEDFA0DFC246E2C857E2C857E2C857E1C754E1C755FFFFFFFFFFFFFFFFFF
          EDEDED1D1D1D333333333333333333333333333333333333333333202020D1D1
          D1FFFFFFFFFFFFFFFFFF31313133333333333333333333333333333333333333
          3333272727909090FFFFFFFFFFFFFFFFFFF1E6B3EBDA8FFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBDA8FE0C54FE2C857E2C8
          57E1C755E0C54EFFFFFFFFFFFFFFFFFFD6D6D620202033333333333333333333
          3333333333333333333333202020CFCFCFFFFFFFFFFFFFFFFFFF2F2F2F262626
          2727272727272D2D2D3333333333333333332B2B2B646464FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEBD98CE0C550E2C857E2C857E1C653E3CB60FFFFFFFFFFFFFFFFFF
          ABABAB2424243333333333333333333030302727272727272727270F0F0FDCDC
          DCFFFFFFFFFFFFFFFFFFE0E0E08484848B8B8B9191915A5A5A2D2D2D33333333
          3333313131232323FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDE9BDFC246E2C857E2C857E2C8
          57E0C54FEBD98DFFFFFFFFFFFFFFFFFF6868682B2B2B3333333333333030303B
          3B3B9494948B8B8B878787ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC9C9C9212121333333333333333333202020CCCCCCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          DE9BDEC144E2C857E2C857E2C857E2C857DEC142F9F3DDFFFFFFFFFFFFFFFFFF
          1D1D1D3232323333333333332828287E7E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1A32323233
          33333333332C2C2C525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDDE9BDEC144E2C857E2C857E2C857E2C857E0C5
          4EE6D172FFFFFFFFFFFFFFFFFF9F9F9F2424243333333333333333331F1F1FCA
          CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF6969692A2A2A3333333333333333331B1B1BD0D0D0FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDE9BDEC144E2
          C857E2C857E2C857E2C857E0C54DE1C754FFFFFFFFFFFFFFFFFFFFFFFF212121
          313131333333333333303030262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF19191932
          3232333333333333303030282828FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEBDA8FDDBF3DE1C653E1C753E1C652E0C54EDEC040E7D379FFFF
          FFFFFFFFFFFFFFFFFFFF5B5B5B2A2A2A333333333333333333252525939393FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF5555552C2C2C3333333333333333332A2A2A4545
          45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6B3EAD785E4CC65E3
          CA5DE5CF6DEDDD98FAF7E6FFFFFFFFFFFFFFFFFFFFFFFF888888202020333333
          333333333333313131212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E
          1E1E323232333333333333333333272727454545FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF8080801C1C1C333333333333333333333333252525B6B6B6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6262622B2B2B3333333333333333333333333333
          332A2A2A282828D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA494949222222333333333333333333
          3333333333332F2F2F353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5D5D23232333
          33333333333333333333333333333333333333333030301B1B1B525252CCCCCC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E87878781919
          192C2C2C3333333333333333333333333333333333333333332C2C2C2C2C2CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9090901D1D1D3333333333333333333333333333333333333333
          333333333333333333332C2C2C202020232323646464909090A6A6A6A9A9A998
          98987272723333331B1B1B292929323232333333333333333333333333333333
          333333333333333333333333292929464646FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB17171733333333
          3333333333333333333333333333323232333333333333333333333333333333
          3131312B2B2B2727272525252424242626262A2A2A3030303333333333333333
          3333333333333332323232323233333333333333333333333333333324242460
          6060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF8D8D8D1B1B1B3333333333333333333333332B2B2B1E1E
          1E2C2C2C32323233333333333333333333333333333333333333333333333333
          33333333333333333333333333333333333333332F2F2F212121252525323232
          3333333333333333332626264B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E1B
          1B1B333333333333232323626262FFFFFF5555551818182A2A2A323232333333
          3333333333333333333333333333333333333333333333333333333232322D2D
          2D1F1F1F323232D8D8D8AFAFAF1717173232323333332626264B4B4BFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1717171E1E1E5C5C5CFFFFFFFFFF
          FFFFFFFFDFDFDF6969691A1A1A2121212D2D2D33333333333333333333333333
          33333333333131312323231717174D4D4DBCBCBCFFFFFFFFFFFFFFFFFFA7A7A7
          1414142020204B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFACACAC909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9
          5959592D2D2D333333333333333333333333313131373737B9B9B9FCFCFCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBB878787FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91919127272733333333333333333333
          33332E2E2E464646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          8B8B8B2727273333333333333333333333332E2E2E434343FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84848426262633333333333333333333
          33332E2E2E3C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E0E0E0303030313131333333333333323232292929A7A7A7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = ServiceSpeedButtonClick
        ExplicitLeft = 1
        ExplicitTop = 16
        ExplicitWidth = 156
        ExplicitHeight = 46
      end
      object Shape1: TShape
        AlignWithMargins = True
        Left = 9
        Top = 11
        Width = 25
        Height = 38
        Margins.Left = 8
        Margins.Top = 10
        Margins.Right = 4
        Margins.Bottom = 10
        Align = alLeft
        Brush.Color = clBlack
        Shape = stRoundSquare
      end
    end
  end
  object RightPanel: TPanel
    Left = 824
    Top = 0
    Width = 160
    Height = 541
    Align = alRight
    Color = 3342336
    Constraints.MinWidth = 136
    DoubleBuffered = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    object T0Panel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 5
      Width = 148
      Height = 90
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Color = clNavy
      Constraints.MinHeight = 60
      ParentBackground = False
      TabOrder = 0
      object T0Label: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taCenter
        Anchors = [akLeft, akRight]
        AutoSize = False
        Caption = '--.--'
        Color = 3342336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = T_LabelClick
        ExplicitLeft = -3
      end
      object T0BottomPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 62
        Width = 140
        Height = 24
        Align = alBottom
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object T0BoundLabel: TLabel
          Left = 1
          Top = 1
          Width = 138
          Height = 22
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '--.--'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitLeft = 72
          ExplicitWidth = 71
        end
      end
      object T0TopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = 'T0TopPanel'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object T1Panel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 99
      Width = 148
      Height = 90
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Color = clNavy
      Constraints.MinHeight = 60
      ParentBackground = False
      TabOrder = 1
      object T1Label: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '--.--'
        Color = 3342336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = T_LabelClick
        ExplicitLeft = -3
        ExplicitTop = 32
      end
      object T1BottomPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 62
        Width = 140
        Height = 24
        Align = alBottom
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object T1BoundLabel: TLabel
          Left = 1
          Top = 1
          Width = 138
          Height = 22
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '--.--'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitLeft = 20
          ExplicitTop = 3
          ExplicitWidth = 110
        end
      end
      object T1TopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = 'T1TopPanel'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object T2Panel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 193
      Width = 148
      Height = 90
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Color = clNavy
      Constraints.MinHeight = 60
      ParentBackground = False
      TabOrder = 2
      object T2Label: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '--.--'
        Color = 3342336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = T_LabelClick
        ExplicitLeft = 2
        ExplicitTop = 28
        ExplicitWidth = 156
        ExplicitHeight = 40
      end
      object T2BottomPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 62
        Width = 140
        Height = 24
        Align = alBottom
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object T2BoundLabel: TLabel
          Left = 1
          Top = 1
          Width = 138
          Height = 22
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '--.--'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 34
          ExplicitHeight = 13
        end
      end
      object T2TopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = 'T2TopPanel'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object T3Panel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 287
      Width = 148
      Height = 90
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Color = clNavy
      Constraints.MinHeight = 60
      ParentBackground = False
      TabOrder = 3
      object T3Label: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '--.--'
        Color = 3342336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = T_LabelClick
        ExplicitLeft = 2
        ExplicitTop = 28
        ExplicitWidth = 156
        ExplicitHeight = 40
      end
      object T3BottomPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 62
        Width = 140
        Height = 24
        Align = alBottom
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object T3BoundLabel: TLabel
          Left = 1
          Top = 1
          Width = 138
          Height = 22
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '--.--'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 34
          ExplicitHeight = 13
        end
      end
      object T3TopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = 'T3TopPanel'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object ADPanel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 446
      Width = 148
      Height = 90
      Margins.Left = 5
      Margins.Top = 2
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alBottom
      Color = 3342336
      Constraints.MinHeight = 60
      ParentBackground = False
      TabOrder = 4
      object ADLabel: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '---.--'
        Color = 4194304
        EllipsisPosition = epEndEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = ADLabelClick
        ExplicitLeft = -3
        ExplicitTop = 35
      end
      object ADBottomPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 62
        Width = 140
        Height = 24
        Align = alBottom
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object ADLabelMin: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 1
          Width = 29
          Height = 22
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = '---.--'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
        object ADLabelMax: TLabel
          AlignWithMargins = True
          Left = 107
          Top = 1
          Width = 29
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          Alignment = taRightJustify
          Caption = '---.--'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
      end
      object ADTopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = #1040#1090#1084#1086#1089#1092#1077#1088#1072
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object XGZPPanel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 377
      Width = 148
      Height = 67
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alBottom
      Color = 3342336
      ParentBackground = False
      TabOrder = 5
      object XGZPLabel: TLabel
        Left = 1
        Top = 31
        Width = 146
        Height = 35
        Align = alClient
        Alignment = taCenter
        Caption = '--'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 12
        ExplicitHeight = 19
      end
      object XGZPTopPanel: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 140
        Height = 24
        Align = alTop
        Caption = #1044#1072#1074#1083#1077#1085#1080#1077
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object CenterPanel: TPanel
    Left = 160
    Top = 0
    Width = 664
    Height = 541
    Align = alClient
    Color = 3342336
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 2
    object MsgLabel: TLabel
      Left = 1
      Top = 516
      Width = 662
      Height = 24
      Align = alBottom
      Alignment = taCenter
      Color = 1114112
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      WordWrap = True
      ExplicitWidth = 6
    end
    object DBChart1: TDBChart
      Left = 1
      Top = 23
      Width = 662
      Height = 493
      Cursor = crCross
      Margins.Bottom = 0
      AutoRefresh = False
      AllowPanning = pmNone
      Border.Color = 3342336
      Border.Fill.Color = 3342336
      Border.Fill.BackColor = 3342336
      BottomWall.Visible = False
      Foot.Visible = False
      Foot.VertMargin = 0
      LeftWall.Dark3D = False
      LeftWall.Pen.Color = 3342336
      LeftWall.Pen.Style = psClear
      LeftWall.Pen.Visible = False
      LeftWall.Visible = False
      MarginBottom = 0
      MarginUnits = muPixels
      SubFoot.VertMargin = 0
      SubTitle.VertMargin = 0
      Title.Text.Strings = (
        'TDBChart')
      AxisBehind = False
      BottomAxis.Visible = False
      LeftAxis.Visible = False
      RightAxis.Visible = False
      TopAxis.Visible = False
      View3D = False
      View3DWalls = False
      Zoom.Allow = False
      OnAfterDraw = DBChart1AfterDraw
      Align = alClient
      BevelOuter = bvNone
      Color = 1114112
      TabOrder = 0
      OnMouseDown = DBChart1MouseDown
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        17
        15
        17)
      ColorPaletteIndex = 0
      object Memo1: TMemo
        Left = 1
        Top = 185
        Width = 660
        Height = 233
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Visible = False
      end
    end
    object TimeButtonsPanel: TPanel
      Left = 1
      Top = 1
      Width = 662
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      Color = 1114112
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 4
        Height = 22
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 16
      end
    end
  end
  object ComPort: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    OnAfterOpen = ComPortAfterOpen
    Left = 200
    Top = 24
  end
  object ComDataPacket: TComDataPacket
    ComPort = ComPort
    OnPacket = ComDataPacketPacket
    Left = 200
    Top = 80
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'AutoEncodeStrings=ON')
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'sqlite'
    Left = 608
    Top = 16
  end
  object ZReadOnlyQuery1: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 728
    Top = 8
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 728
    Top = 72
  end
  object ZQuery2: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 729
    Top = 129
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 304
    Top = 32
  end
  object Timer2: TTimer
    Interval = 2500
    OnTimer = Timer2Timer
    Left = 304
    Top = 88
  end
end
