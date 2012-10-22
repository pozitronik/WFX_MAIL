object FWX_MAIL_PROP: TFWX_MAIL_PROP
  Left = 224
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Mail for Total Commander v 1.0a2'
  ClientHeight = 480
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBtnText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 453
    Width = 107
    Height = 13
    AutoSize = False
    Caption = #169' 2007 P. Dubrovsky '
    Enabled = False
  end
  object MCMAIN: TPageControl
    Left = 0
    Top = 1
    Width = 527
    Height = 446
    ActivePage = TSOPTIONS
    TabOrder = 0
    object TSMBOX: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1095#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object LUnsaved: TLabel
        Left = 296
        Top = 389
        Width = 136
        Height = 13
        Alignment = taRightJustify
        Caption = 'You have unsaved changes!'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object LPassAlert: TLabel
        Left = 208
        Top = 130
        Width = 311
        Height = 13
        AutoSize = False
        Caption = #1042#1085#1080#1084#1072#1085#1080#1077'! '#1061#1088#1072#1085#1080#1090#1100' '#1079#1076#1077#1089#1100' '#1087#1072#1088#1086#1083#1100' '#1085#1077#1073#1077#1079#1086#1087#1072#1089#1085#1086'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object GBMailBoxList: TGroupBox
        Left = 1
        Top = 0
        Width = 203
        Height = 273
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1095#1090#1086#1074#1099#1093' '#1103#1097#1080#1082#1086#1074
        TabOrder = 0
        object LBMBList: TListBox
          Left = 2
          Top = 15
          Width = 199
          Height = 224
          Align = alTop
          ItemHeight = 13
          PopupMenu = PMMBList
          TabOrder = 0
          OnClick = LBMBListClick
          OnDblClick = LBMBListDblClick
          OnDrawItem = LBMBListDrawItem
          OnKeyDown = LBMBListKeyDown
          ExplicitTop = 14
        end
        object BMBAdd: TButton
          Left = 3
          Top = 244
          Width = 97
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 1
          OnClick = BMBAddClick
          OnKeyDown = BMBAddKeyDown
        end
        object BMBDel: TButton
          Left = 102
          Top = 244
          Width = 97
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = BMBDelClick
          OnKeyDown = BMBAddKeyDown
        end
      end
      object GBGetMail: TGroupBox
        Left = 206
        Top = 0
        Width = 314
        Height = 126
        Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1087#1086#1095#1090#1099
        TabOrder = 1
        object LServer: TLabel
          Left = 8
          Top = 16
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1057#1077#1088#1074#1077#1088' ['#1087#1086#1088#1090']:'
        end
        object LUser: TLabel
          Left = 8
          Top = 43
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
        end
        object LPass: TLabel
          Left = 8
          Top = 70
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1055#1072#1088#1086#1083#1100':'
        end
        object Label1: TLabel
          Left = 264
          Top = 16
          Width = 4
          Height = 13
          Caption = ':'
        end
        object CBPOPAuth: TLabel
          Left = 8
          Top = 97
          Width = 130
          Height = 13
          AutoSize = False
          Caption = 'POP3-'#1072#1091#1090#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103':'
        end
        object EServer: TEdit
          Left = 144
          Top = 16
          Width = 119
          Height = 21
          TabOrder = 0
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object EUser: TEdit
          Left = 144
          Top = 43
          Width = 167
          Height = 21
          TabOrder = 1
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object EPass: TEdit
          Left = 144
          Top = 70
          Width = 167
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object EPort: TEdit
          Left = 269
          Top = 16
          Width = 42
          Height = 21
          TabOrder = 3
          Text = '110'
          OnKeyDown = BMBAddKeyDown
          OnKeyPress = EPortKeyPress
          OnKeyUp = EServerKeyUp
        end
        object CBPOP3Auth: TComboBox
          Left = 144
          Top = 97
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          OnChange = CBSMTPAuthChange
          OnKeyDown = BMBAddKeyDown
          Items.Strings = (
            'UserPass'
            'APOP')
        end
      end
      object GBSendmail: TGroupBox
        Left = 206
        Top = 146
        Width = 314
        Height = 127
        Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1087#1086#1095#1090#1099
        TabOrder = 2
        object LSMTPServer: TLabel
          Left = 8
          Top = 16
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1057#1077#1088#1074#1077#1088' ['#1087#1086#1088#1090']:'
        end
        object Label3: TLabel
          Left = 264
          Top = 16
          Width = 4
          Height = 13
          Caption = ':'
        end
        object LSMTPAuth: TLabel
          Left = 8
          Top = 44
          Width = 120
          Height = 13
          Caption = 'SMTP-'#1072#1091#1090#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103':'
        end
        object LSMTPPass: TLabel
          Left = 8
          Top = 98
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1055#1072#1088#1086#1083#1100':'
          Enabled = False
        end
        object LSMTPUser: TLabel
          Left = 8
          Top = 71
          Width = 130
          Height = 13
          AutoSize = False
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
          Enabled = False
        end
        object ESMTPServ: TEdit
          Left = 144
          Top = 17
          Width = 119
          Height = 21
          TabOrder = 0
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object ESMTPPort: TEdit
          Left = 269
          Top = 17
          Width = 42
          Height = 21
          TabOrder = 1
          Text = '25'
          OnKeyDown = BMBAddKeyDown
          OnKeyPress = EPortKeyPress
          OnKeyUp = EServerKeyUp
        end
        object CBSMTPAuth: TComboBox
          Left = 144
          Top = 44
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = CBSMTPAuthChange
          OnKeyDown = BMBAddKeyDown
          Items.Strings = (
            #1054#1090#1082#1083#1102#1095#1077#1085#1072
            'POP3 '#1087#1088#1077#1078#1076#1077' SMTP'
            #1055#1086' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1084' POP3'
            #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080)
        end
        object ESMTPPass: TEdit
          Left = 144
          Top = 98
          Width = 167
          Height = 21
          Enabled = False
          PasswordChar = '*'
          TabOrder = 3
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object ESMTPUSER: TEdit
          Left = 144
          Top = 71
          Width = 167
          Height = 21
          Enabled = False
          TabOrder = 4
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
      end
      object GBUserInfo: TGroupBox
        Left = 1
        Top = 313
        Width = 518
        Height = 72
        Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        TabOrder = 3
        object LFIO: TLabel
          Left = 8
          Top = 19
          Width = 80
          Height = 13
          AutoSize = False
          Caption = #1060#1048#1054':'
        end
        object LEmail: TLabel
          Left = 8
          Top = 46
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'E-mail:'
        end
        object LOrganization: TLabel
          Left = 270
          Top = 46
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
        end
        object EFIO: TEdit
          Left = 94
          Top = 19
          Width = 421
          Height = 21
          TabOrder = 0
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object EEmail: TEdit
          Left = 94
          Top = 46
          Width = 167
          Height = 21
          TabOrder = 1
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
        object EOrganization: TEdit
          Left = 348
          Top = 46
          Width = 167
          Height = 21
          TabOrder = 2
          OnKeyDown = BMBAddKeyDown
          OnKeyUp = EServerKeyUp
        end
      end
      object BApply: TButton
        Left = 438
        Top = 389
        Width = 81
        Height = 25
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        Enabled = False
        TabOrder = 4
        OnClick = BApplyClick
        OnKeyDown = BMBAddKeyDown
      end
      object CBMBDefault: TCheckBox
        Left = 3
        Top = 279
        Width = 197
        Height = 34
        Caption = 'Use this mailbox by default'
        TabOrder = 5
        WordWrap = True
        OnClick = CBMBDefaultClick
      end
      object RGConnection: TRadioGroup
        Left = 206
        Top = 272
        Width = 314
        Height = 41
        Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
        TabOrder = 6
      end
      object CBTLS: TCheckBox
        Left = 214
        Top = 290
        Width = 303
        Height = 17
        Caption = #1041#1077#1079#1086#1087#1072#1089#1085#1086#1077' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077' (TLS)'
        TabOrder = 7
        OnClick = CBTLSClick
        OnKeyDown = BMBAddKeyDown
      end
    end
    object TSOPTIONS: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1083#1072#1075#1080#1085#1072
      ImageIndex = 1
      object GBLang: TGroupBox
        Left = 0
        Top = 0
        Width = 519
        Height = 98
        Align = alTop
        Caption = #1071#1079#1099#1082' '#1087#1083#1072#1075#1080#1085#1072
        TabOrder = 0
        object LngSelect: TListBox
          Left = 2
          Top = 15
          Width = 515
          Height = 81
          Align = alClient
          ExtendedSelect = False
          ItemHeight = 13
          TabOrder = 0
          OnClick = LngSelectClick
          OnKeyDown = LngSelectKeyDown
        end
      end
      object GNAltEnterSel: TGroupBox
        Left = 261
        Top = 349
        Width = 258
        Height = 45
        Caption = 'Alt+Enter '#1085#1072' '#1087#1080#1089#1100#1084#1077' '#1079#1072#1087#1091#1089#1082#1072#1077#1090':'
        TabOrder = 1
        object CBAltEnter: TComboBox
          Left = 2
          Top = 15
          Width = 254
          Height = 21
          Align = alClient
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnKeyDown = LngSelectKeyDown
          Items.Strings = (
            #1042#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
            #1042'c'#1090#1088#1086#1077#1085#1085#1099#1081' '#1082#1083#1080#1077#1085#1090' ('#1086#1090#1074#1077#1090' '#1085#1072' '#1087#1080#1089#1100#1084#1086')')
        end
      end
      object GBEnterSel: TGroupBox
        Left = 0
        Top = 349
        Width = 258
        Height = 45
        Caption = 'Enter '#1085#1072' '#1087#1080#1089#1100#1084#1077' '#1079#1072#1087#1091#1089#1082#1072#1077#1090':'
        TabOrder = 2
        object CBEnter: TComboBox
          Left = 2
          Top = 15
          Width = 254
          Height = 21
          Align = alClient
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnKeyDown = LngSelectKeyDown
          Items.Strings = (
            #1042#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
            #1042'c'#1090#1088#1086#1077#1085#1085#1099#1081' '#1082#1083#1080#1077#1085#1090' ('#1086#1090#1074#1077#1090' '#1085#1072' '#1087#1080#1089#1100#1084#1086')'
            #1055#1088#1086#1075#1088#1072#1084#1084#1091', '#1072#1089#1089#1086#1094#1080#1080#1088#1086#1074#1072#1085#1085#1091#1102' '#1089' *.eml')
        end
      end
      object CBCacheMessages: TCheckBox
        Left = 261
        Top = 398
        Width = 255
        Height = 17
        Caption = #1050#1077#1096#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1087#1080#1088#1091#1077#1084#1099#1077' '#1087#1080#1089#1100#1084#1072
        TabOrder = 3
        OnKeyDown = LngSelectKeyDown
      end
      object GBConnection: TGroupBox
        Left = 0
        Top = 307
        Width = 519
        Height = 40
        Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1081
        TabOrder = 4
        object LTimeout: TLabel
          Left = 7
          Top = 20
          Width = 373
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1058#1072#1081#1084#1072#1091#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' ('#1089#1077#1082'):'
        end
        object SEConnectionTimeout: TSpinEdit
          Left = 385
          Top = 11
          Width = 130
          Height = 22
          MaxValue = 600
          MinValue = 1
          TabOrder = 0
          Value = 10
        end
      end
      object CBClearHeadersCache: TCheckBox
        Left = 0
        Top = 398
        Width = 255
        Height = 17
        Caption = 'Clear headers cache on disconnect'
        TabOrder = 5
        OnKeyDown = LngSelectKeyDown
      end
      object GBSendProperties: TGroupBox
        Left = 0
        Top = 99
        Width = 519
        Height = 133
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1087#1080#1089#1077#1084
        TabOrder = 6
        object CBUseBlat: TCheckBox
          Left = 8
          Top = 18
          Width = 497
          Height = 17
          Caption = 
            #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' Blat '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1087#1080#1089#1077#1084' ('#1074' '#1089#1083#1091#1095#1072#1077' '#1087#1088#1086#1073#1083#1077#1084' '#1074#1089#1090#1088#1086#1077#1085#1085#1086 +
            #1075#1086' '#1082#1083#1080#1077#1085#1090#1072')'
          TabOrder = 0
          OnKeyDown = LngSelectKeyDown
        end
        object LEBlatPath: TLabeledEdit
          Left = 8
          Top = 57
          Width = 424
          Height = 21
          EditLabel.Width = 81
          EditLabel.Height = 13
          EditLabel.Caption = #1055#1091#1090#1100' '#1082' blat.exe:'
          TabOrder = 1
          OnKeyDown = LngSelectKeyDown
        end
        object BBSelectBlatPath: TBitBtn
          Left = 438
          Top = 57
          Width = 75
          Height = 21
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 2
          OnClick = BBSelectBlatPathClick
          OnKeyDown = LngSelectKeyDown
        end
        object LEBlatParams: TLabeledEdit
          Left = 8
          Top = 101
          Width = 505
          Height = 21
          EditLabel.Width = 268
          EditLabel.Height = 13
          EditLabel.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1084#1072#1085#1076#1085#1086#1081' '#1089#1090#1088#1086#1082#1080' Blat:'
          TabOrder = 3
          OnKeyDown = LngSelectKeyDown
        end
      end
      object GBCopying: TGroupBox
        Left = 0
        Top = 233
        Width = 519
        Height = 72
        Caption = #1055#1088#1080' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1080' '#1074' '#1092#1072#1081#1083#1086#1074#1091#1102' '#1089#1080#1089#1090#1077#1084#1091' '#1087#1083#1072#1075#1080#1085#1072':'
        TabOrder = 7
        object LOnEMLCopy: TLabel
          Left = 39
          Top = 24
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = '*.eml-'#1092#1072#1081#1083#1086#1074':'
        end
        object LOnOtherFileCopy: TLabel
          Left = 8
          Top = 51
          Width = 103
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1044#1088#1091#1075#1080#1093' '#1092#1072#1081#1083#1086#1074':'
        end
        object CBOnEmlCopy: TComboBox
          Left = 117
          Top = 16
          Width = 399
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnKeyDown = LngSelectKeyDown
          Items.Strings = (
            #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1076#1077#1083#1072#1090#1100
            #1054#1090#1082#1088#1099#1090#1100' '#1087#1080#1089#1100#1084#1086' '#1082#1072#1082' '#1095#1077#1088#1085#1086#1074#1080#1082
            #1054#1090#1082#1088#1099#1090#1100' '#1087#1080#1089#1100#1084#1086' '#1076#1083#1103' '#1086#1090#1074#1077#1090#1072
            #1055#1099#1090#1072#1090#1100#1089#1103' '#1086#1090#1086#1089#1083#1072#1090#1100' '#1087#1080#1089#1100#1084#1086)
        end
        object CBOnFileCopy: TComboBox
          Left = 117
          Top = 43
          Width = 399
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnKeyDown = LngSelectKeyDown
          Items.Strings = (
            #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1076#1077#1083#1072#1090#1100
            #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1086#1077' '#1087#1080#1089#1100#1084#1086' '#1080' '#1087#1088#1080#1082#1088#1077#1087#1080#1090#1100' '#1082' '#1085#1077#1084#1091' '#1101#1090#1080' '#1092#1072#1081#1083#1099
            #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1101#1090#1080' '#1092#1072#1081#1083#1099' '#1085#1072' '#1082#1086#1087#1080#1088#1091#1077#1084#1099#1081' '#1103#1097#1080#1082' ('#1074' '#1074#1080#1076#1077' '#1074#1083#1086#1078#1077#1085#1080#1081')')
        end
      end
    end
    object TSViewerOptions: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      ImageIndex = 2
      object LViewAttach: TLabel
        Left = 3
        Top = 33
        Width = 274
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1090#1090#1072#1095#1077#1081' '#1082#1072#1082
      end
      object LTabsPosSelect: TLabel
        Left = 3
        Top = 5
        Width = 274
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1086#1079#1080#1094#1080#1103' '#1079#1072#1082#1083#1072#1076#1086#1082' '#1074' '#1086#1082#1085#1077' '#1087#1088#1086#1089#1084#1086#1090#1088#1072':'
      end
      object LEAttachSavePath: TLabeledEdit
        Left = 3
        Top = 81
        Width = 431
        Height = 21
        EditLabel.Width = 228
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1072#1090#1072#1083#1086#1075' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1072#1090#1090#1072#1095#1077#1081' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
        TabOrder = 0
        OnKeyDown = CBTabsPosSelectKeyDown
      end
      object BBSelectPath: TBitBtn
        Left = 441
        Top = 81
        Width = 75
        Height = 21
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 1
        OnClick = BBSelectPathClick
        OnKeyDown = CBTabsPosSelectKeyDown
      end
      object CBTabsPosSelect: TComboBox
        Left = 288
        Top = 5
        Width = 228
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
        OnKeyDown = CBTabsPosSelectKeyDown
        Items.Strings = (
          #1057#1074#1077#1088#1093#1091
          #1057#1085#1080#1079#1091
          #1057#1083#1077#1074#1072
          #1057#1087#1088#1072#1074#1072)
      end
      object CBViewAttach: TComboBox
        Left = 288
        Top = 33
        Width = 228
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 3
        OnKeyDown = CBTabsPosSelectKeyDown
        Items.Strings = (
          #1057#1087#1080#1089#1086#1082' '#1089' '#1073#1086#1083#1100#1096#1080#1084#1080' '#1080#1082#1086#1085#1082#1072#1084#1080
          #1057#1087#1080#1089#1086#1082' '#1089' '#1084#1072#1083#1077#1085#1100#1082#1080#1084#1080' '#1080#1082#1086#1085#1082#1072#1084#1080
          #1057#1087#1080#1089#1086#1082' '#1092#1072#1081#1083#1086#1074' '#1073#1077#1079' '#1080#1082#1086#1085#1086#1082)
      end
      object CBCloseAfterSending: TCheckBox
        Left = 3
        Top = 112
        Width = 255
        Height = 17
        Caption = 'Close editor after message sending'
        TabOrder = 4
      end
      object GBButtonsOpts: TGroupBox
        Left = 3
        Top = 181
        Width = 513
        Height = 138
        Caption = 'Button bar options:'
        TabOrder = 5
        object LIconSize: TLabel
          Left = 230
          Top = 106
          Width = 111
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Icons size:'
        end
        object LTextCaptions: TLabel
          Left = 231
          Top = 79
          Width = 110
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Button captions:'
        end
        object GBGradient: TGroupBox
          Left = 3
          Top = 16
          Width = 507
          Height = 57
          TabOrder = 0
          object LGFrom: TLabel
            Left = 8
            Top = 21
            Width = 38
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'From'
          end
          object LGTo: TLabel
            Left = 85
            Top = 21
            Width = 26
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'To'
          end
          object GradientPreview: TImage
            Left = 304
            Top = 21
            Width = 193
            Height = 27
          end
          object LGradient: TLabel
            Left = 23
            Top = 0
            Width = 45
            Height = 13
            Caption = 'Gradient:'
            OnClick = LGradientClick
          end
          object CBEnableGradient: TCheckBox
            Left = 4
            Top = -2
            Width = 19
            Height = 17
            TabOrder = 0
            OnClick = CBEnableGradientClick
          end
          object CBVerticalGradient: TCheckBox
            Left = 150
            Top = 21
            Width = 148
            Height = 17
            Caption = 'Vertical gradient'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CBVerticalGradientClick
          end
          object PGradientFrom: TPanel
            Left = 52
            Top = 21
            Width = 27
            Height = 27
            BevelOuter = bvNone
            Color = 16117715
            ParentBackground = False
            TabOrder = 2
            OnClick = PGradientFromClick
          end
          object PGradientTo: TPanel
            Left = 117
            Top = 21
            Width = 27
            Height = 27
            BevelOuter = bvNone
            Color = 16117715
            ParentBackground = False
            TabOrder = 3
            OnClick = PGradientToClick
          end
        end
        object CBIconSize: TComboBox
          Left = 347
          Top = 106
          Width = 159
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = '24x24'
          Items.Strings = (
            '24x24'
            '32x32'
            '48x48')
        end
        object CBTextCaptions: TComboBox
          Left = 347
          Top = 79
          Width = 159
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = 'Only icons'
          Items.Strings = (
            'Only icons'
            'Only text'
            'Text and icons on right'
            'Icons and text below')
        end
        object CBFlatButtons: TCheckBox
          Left = 7
          Top = 79
          Width = 140
          Height = 17
          Caption = 'Flat buttons'
          TabOrder = 3
        end
      end
      object CBAOnTop: TCheckBox
        Left = 3
        Top = 135
        Width = 255
        Height = 17
        Caption = 'Editor always on top'
        TabOrder = 6
      end
      object CBViewHeaders: TCheckBox
        Left = 3
        Top = 158
        Width = 255
        Height = 17
        Caption = 'Show RFC 822 headers'
        TabOrder = 7
      end
      object CBCloseProgressAfterSending: TCheckBox
        Left = 264
        Top = 112
        Width = 252
        Height = 17
        Caption = 'Close progress window after sending'
        TabOrder = 8
      end
      object CBRememberSize: TCheckBox
        Left = 264
        Top = 136
        Width = 252
        Height = 17
        Caption = 'Remember editor window size && position'
        TabOrder = 9
      end
      object GBAddrBookSettings: TGroupBox
        Left = 3
        Top = 320
        Width = 513
        Height = 95
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1072#1076#1088#1077#1089#1085#1086#1081' '#1082#1085#1080#1075#1080
        TabOrder = 10
        object BBOpenAdrBook: TBitBtn
          Left = 356
          Top = 67
          Width = 154
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1076#1088#1077#1089#1085#1091#1102' '#1082#1085#1080#1075#1091
          TabOrder = 0
          OnClick = BBOpenAdrBookClick
        end
        object CBSaveEmailsAutomatically: TCheckBox
          Left = 7
          Top = 21
          Width = 245
          Height = 17
          Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1072#1076#1088#1077#1089#1072
          TabOrder = 1
        end
      end
    end
    object TSAbout: TTabSheet
      Caption = 'About...'
      ImageIndex = 3
      object Label4: TLabel
        Left = 387
        Top = 23
        Width = 107
        Height = 13
        AutoSize = False
        Caption = #169' 2007 P. Dubrovsky '
      end
      object Image1: TImage
        Left = 351
        Top = 319
        Width = 164
        Height = 96
        AutoSize = True
        Picture.Data = {
          07544269746D6170B6410000424DB6410000000000003604000028000000A400
          0000600000000100080000000000803D00000000000000000000000100000000
          0000000000009A9A9B00091CA40002DC0200D4E2D40015C21500035DBC001270
          940032323400115A9A00113E9E006C946C001A3C6D00067CCD00B6C5C900053A
          D900F3F3F300060CF20062686800444445006AA06A00427E9900B2B2B20042B1
          420038547300086C9E0002EB02000C97D8005B748400CBCBCC00052DDC00054A
          DA0084BD8400092494001C1C1E00055EE800697C98009DB59D005A5A5B002DA7
          2D001E325A00043DBB00056BDF00FEFEFE00BCBEC40076787A00061DE7000785
          CE0066666800D3D3D4000F448A0075A1750012CA1200DCF0F1000472E1001A3A
          7000424E5700B4CBB4000552DA00A3A3A3000542D800599F59000562E500051D
          B7000532DD00376B910000FE000073A6B1002CB32C0005A3F300A5BFA5001852
          76002650890092AE9200B6B6B900048BDD00070709000522DC00264265008B8B
          8B005E7D9A0073808E00055AD700315D90000741A60074B47400C3D4C3000ECD
          0E004E5055004C6C8C000553BC0073737300DADADA000433BB000533EB0054B3
          5400A7A7A80016529200DCE4DC00ABC3AB0027A5270034709D0034BE340064BD
          6400053DEA003D3D3D000A378B009797980024242600057BF2000543F100059B
          F3000583F300164472000653F2000572EB000568ED0033CB3300054BEB000516
          DD009393930062626300052DEB000523E90079B579004AAA4A0032365200EBEB
          EB00066FC600094FA300235E8D000663F200DEE4E50093A3AA006F98A700A6B2
          B900BBBBBB008ABE8A004B4B4D00066BF20013669B00CBD6CC000573F100155A
          8500363E4C00101012001BCD1B00055BF100578DA10044799200C5DEE000657C
          94000E429400043FC500E5EAE500064BF200114A770000F300000521CB005454
          5500042DC7000614F200EEF0F10008D408001ABF1A0085B2BD000633F200062B
          F200063BF2000523F100045FC6006DB46D0042628C002B3F56003BBD3B006A6A
          6A005ABC5A000C389500A8ACB200284762000593F3000F539B0084848400EDF0
          ED00E2E2E200F5F8F8001C446A00058BF3002D5A8F000A53AF004CBD4C0022C1
          2200D3DCD3002A2A2D0052617900BBCEBB003499340094BE94006397AA001545
          7B00A7D1D300052D9B0075BE75006A8294002B5491000BDC0B000518EF0001E2
          01007CBE7C00C6C6C800AAAAAA0012D612001278AA004E7B9200ACCBAC008686
          8900CFCFD00023789400123482001A5D8F00326390007B8B9C000E4B9500044F
          C6003C73900005A9F300061BF2007B7C7C00A4C4A40008E80800879CA8004683
          9A000A5EB700092C90002EBE2E002644590043BD43005BAC5B000762D70064AE
          64009AC09A00184A78008CC08C0083A6B400C9E3E400354354000552E8009F9F
          A000C2C2C30085C085000433C6006BBE6B00224B6500042FA60054BD54003E3E
          4000D74A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4AD74A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B10F8312B2B2B2B2B2B7FF82B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B1D312B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B10
          D8F8D15C2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B7F2B2B2B2B2B101D7808312B2B2B2BD24C2B2B
          7F2B2B2B2B2B2B2B2B2B2B2B2B2BA2102B2B2B1DAFC12B2B2B2B2B2B7F102B2B
          2B2B2B2B107F2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B7F2B2B2B2B2B2B2B2B
          2B2B2B31881DD101C14A2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B319122B82B5C
          2291B82B2B2B5C9122B82B5C22915C2B2B2BB891225C2BB82291312B31131D2B
          2B13AF2B2B58AF2B2B2B164C2B2BD1135B01782D4C882B2B2B1D6C22D82B2B2B
          D24CE37801AF8A312B2B4C162B2B2B318AAF01789FAF102B884C7F2BB879AF78
          016BB61D2BB826794F0178162B2B8A264F782B7F13162B2B018AB601B68AF72B
          2B9F792B2B2B2BB626B67878698A2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2BFF2D
          4F9F2B1301308A2B2B2B135B788A2B8A6B5B132B2B2B8AAF01132B9F4F2D132B
          2B2B2B2B2B13AF2B2B58302B2B2B164C2B2B082D2B2B2BB84C882B2B1D6CF816
          22312B2BD24CA22B2B2B30132B2B4C162B2B2B8A262B2B2B2B224F2B884C7F2B
          26C10101010178162B79132B2B2B2B2B2B7F4CF82B2B2B2B2B2B2BB84C882B2B
          2B164C7F2B9F262B2B2BD24C102B2B2B26132B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B016C102B0826132B7F22D22B3B6C102B6926FF2B106C3B2BD222A22BFF2669
          2B106C012B2B2B2B2B13AF2B2B580816B83126692B2B7808887F5CE34C882B1D
          22882B2B1622312BD24CB65C7F886C012B2B4C9FF8B8B83B6C16B85C4F6C312B
          884C7F2B88C13B5CB888C1162B886C015CB831312B1D4CD2B8B82B2B2B2B2B2B
          9F9F1DB81D8A9F2B2B9F6CD25C5CB8C14F5C7F16C1132B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BF85C2B2B5C16B82B2B31F82BF8312B2BB816B82B2B31F82BF8312B
          2BB816B82B2B5CF82B2B2B2B2B16F82B2B1D31B816D2F82B2B2B2B7F4A60887F
          4C882BF8312B2B2B2B1DD12BB8167F886088A22B2B2B16B81DD2F82B108860D2
          F82B2B2BB8012B2B2B2B1DB26088102B2B2B2B1D163B165C2B3B4C4F16162B2B
          2B2B2B2B2B5C163B165C2B2B2B1D1DB84A3B2B2B1DD2B23131F82B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B78602B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2BAF312B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B31AF102B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BF810
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B7F5C7F2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B7F5C7F2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B7F5CB82B2B2B2B2B2B2B2B2B105C7F2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B20EAEA27B82B2BC4EAEAC52B2BC3EA
          EA44C02B2B2BF0BE66EAEA202B2B1055EAA3CF03BFBE892B2B63EAEA277F2B2B
          2B2BC5EAEAC42B2B2BEFEAEAED2B2B2B10ABEAA3CFA3BFFEC52B2B2B2B20BE66
          EAEA632B2B2B2B2B2B2BE4EAEAEA66AEECB0D0622B2B2B2B2B7CEAEA7D2B2BF0
          EAEAC42B2B2B2B2B2B2B7C66A3CF03BFBE202B2B2B2BF0AE34CFA3BFED2B2B2B
          7FFBEC66EA277F2B2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2BA4424220
          2B2B6342421A8D2B2BE41A42424242D02B101742424242424242A37F2BF04242
          A37F2B2B2B2B204242A42B2B2BFE4242BE2B2BB7AE42424242424242052B2B2B
          CA4242424242462B2B2B2B2B2B2BC54242424242424242D3552B2B2B2BFB4242
          662B2B894242052B2B2B2B2B2B7D42424242424242CF5C2B2B7C1A4242424242
          A42B2B2BBE42424242A37F2B2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2B
          A44242202B2B6342421A8D2B2BFE42421ABFEA202BFB42421AFE20D0B092A37F
          2BF04242A37F2B2B2B2B204242A42B2B2BFE4242BE2B2B6742421AFE20D0FE92
          052B2B2BEA4242CFEAEA632B2B2B2B2B2B2BC54242429D42424242429DEF2B2B
          2BFB4242662B2B894242052B2B2B2B2BD042429DBE20D0B0BFCF5C2B39E54242
          D3BEB066A42B2BB8A34242A3EA277F2B2B2B2B2B2B4A4A2B2B2B2B2B2BCA4242
          03B82B2BA44242202B2B6342421A8D2B2BEC4242FE2B2B2B2BBF4242672B2B2B
          2B1033102BF04242A37F2B2B2B2B204242A42B2B2BFE4242BE2B10924242FB2B
          2B2B2B7F142B2B2BA44242D02B2B2B2B2B2B2B2B2B2BC54242423363F0B01A42
          421A632B2BFB4242662B2B894242052B2B2B2B2BEA4242B02B2B2B2B10337F2B
          B04242CD392B2B2B252B2BC39D429D632B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2BCA424203B82B2BA44242202B2B6342421A8D2B2B664242CA2B2B2B8D1A4242
          3D898989898989C32BF04242A37F2B2B2B2B204242A42B2B2BFE4242BE2B399D
          429D14898989898989562B10574242F02B2B2B2B2B2B2B2B2B2BC5424242462B
          2B2B209D4242BE2B2BFB4242662B2B894242052B2B2B2BB80342423D89898989
          8989392BEA4242BE2B2B2B2B2B2B2B46424203B82B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BCA424203B82B2BA44242F92B2B6342421A8D2B2B664242CA2B2B2B
          6342424242424242424242FB2BF0424203622B2B2B2B204242A42B2B2BFE4242
          BE2BF042424242424242424242D02B10574242F02B2B2B2B2B2B2B2B2B2BC542
          4242462B2B2B2B66424234102BFB4242662B2B89424257102B2B2B561A424242
          424242424242672BBF4242672B2B2B2B2B2B2B46424203B82B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2BCA424203B82B2BA44242CA2B2B4642421A8D2B2B664242
          CA2B2B2BC39D4242050505051A4242D02BF0424242632B2B2B2B204242A37F2B
          2BBE4242BE2B63424242050505059D4242202B10574242F02B2B2B2B2B2B2B2B
          2B2BC5424242462B2B2B2B6742421A8D2BFB4242662B2B8942421A562B2B2BC0
          CF4242050505051A4242FB2BBF4242B02B2B2B2B2B2B2B46424203B82B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2BA44242AE2B2BC5424203B82B
          2B664242CA2B2B2B10344242C52B2BB7344242F02BF04242425F2B2B2B2B2042
          4242C52B2BAE4242B02BB8A34242F02B2BB8CD4242632B10574242F02B2B2B2B
          2B2B2B2B2B2BC5424242462B2B2B2BCA424242392BFB4242662B2B89424242B0
          2B2B2B2BA44242F92B2B2BA44242F22BEC4242BF102B2B2B102B2B46424203B8
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2BA442429D5FF27542
          42A42B56D0BF424217D0D0C52BBE4242EA399AED424292102BF042424242ECFB
          BE392042424292D0CA1A4242FB2B2BEC4242EAC3B85F4242BF2BD6D0CD42423D
          D0D0D62B2B2B2B2B2B2BC5424242462B2B2B2BFB42421A8D2BFB4242662B2B89
          4242429DECFB178DB0424292D67FEF4242D39A2B20424242AEC5E4D0C42BC53D
          4242CF55D0D08D2B2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2BA4424205
          4242424242B02B8942424242424242EC2B8DD342421AA342429D202B2BF04242
          CF9242424263204242CDE5424242421A562B2B56D342421AA342421AC52B6742
          424242424242FB2B2B2B2B2B2B2BC5424242462B2B2B2BAE424234102BFB4242
          662B2B894242CDD342421A56049242429DA342429D7C2B2B2BEC424242424242
          A42BAE42424242424242C52B2B2B2B2B2B4A4A2B2B2B2B2B2BCA424203B82B2B
          A442421466424242EA042B8942424242424242EC2B2BC36642424242D3D02B2B
          2BF04242A349D3424263204242A4F2CD42421AAB2B2B2B2B39EA424242429220
          2B2B6742424242424242FB2B2B2B2B2B2B2BC5424242462B2B2B899D4242EC2B
          2BFB4242662B2B89424205C5CD421A562B56669D424242D3552B2B2B2B7F5FCF
          42424242642BAE42424242424242C52B2B2B2B2B2B4A4A2B2B2B2B2B2BCA4242
          03B82B2B634646622BF0D0C5B72B2B6246EA42423D4646562B2B2B2B63D0CA89
          B82B2B2B2B9A4646632B6220CA62624646632BC02020392B2B2B2B2B2B2BE4D0
          CA899A2B2B2B8D25A342420B4646C02B2B2B2B2B2B2BC542424233C3E4B0CD42
          421AE42B2BC04646C32B2B9A4646632BC020CA9A2B2B2BD6D0CA89622B2B2B2B
          2B2B2B8D89CAD0F0102BC30B4242034946469A2B2B2B2B2B2B4A4A2B2B2B2B2B
          2BCA424203B82B2B2B2B2B2B2B2B2B2B2B2B2B2B2B664242CA2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B10574242F02B2B2B2B2B2B2B2B2B2BC54242429D9D
          4242424242EF2B2B2BF067677C2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B46424203B82B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BCA424203B82B2B2B2B2B2B2B2B2B2B2B2B2B2B2B664242CA2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B10574242F02B2B2B2B2B2B2B2B2B2BC542
          42424242424242D3552B2B2B2BFB4242662B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B46424203B82B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B20EAEA27B82B2B2B2B2B2B2B2B2B2B2B2B2B2B2BE4C5C5
          562B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BC5C5C5622B2B2B2B2B2B2B2B
          2B2BE4EAEAEA6666AEB0D0622B2B2B2B2BFB4242662B2B2BD23B3B3B3B3B3B3B
          3B3B3B3B3BD216881DB82B2B2B2B2B2B2B2B2B2B2B2B2B9AC5C5C52B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BD6CACA892B2B7FAF797979
          79797979797979AFAFAFAFAFAFAFAF4F88102B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B1C65
          DB8F8F8F8F8F8F8F8F8F8F474747FCEB901379AFAF5BF82B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2BD5454545454545454545454545E1E1E1E1E1E11B8FEB58AFAF882B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2BD56F6F6F6F454545454545454545454545E1E1E1E1E1D490AFAF
          5C2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2BD56F6F6F6F6F6F6F6F6F6F45454545454545454545E1
          E12F90AFB62B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2BD5B4B46F6F6F6F6F6F6F6F6F6F6F6F454545
          454545454545DB26AF312B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B86D9D9D9D9D90707194B6F6F6F6F
          6F6F6F6F6F454545454545EBAF4F2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B2B105C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C2B2B2B
          5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C7F2B2B2B2B2BB85C5C5C5C5C5C5C5C5C
          5C5C5C5C5C5C5C2B2B2B2B2B2B2B2B2B2B2B5CF8D20178784F4F7801D2F8B82B
          2B2B2B2B5C5C5C5C5C5C5C5C5C5C5C5C7F2B2B2B2B2B2B2B2B2B2B2B2B2BA2E0
          2FB46F6F6F6F6F6F6F6F6F6F6F4545199FAF7F2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B2B1DAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF
          AF2B2B2BAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFD22B2B2B2B2B78AFAFAFAFAF
          AFAFAFAFAFAFAFAFAFAFE32B2B2B2B2B2B2BB816B6AFAF7926269F589F2679AF
          AFAFAF5B781D104FAFAFAFAFAFAFAFAFAFAFAFAF162B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B8CB4B4B4B4B46F6F6F6F6F6F6F6F6F6FEBAF882B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B1C59B3B3B3B3B3B3B3B3B3B3B3B3B3
          B3B3B3F5AF2BDD504E4E4E4E4E4E4E4E4E4E4E4E4E4E4E9FD22B2B2B8750184E
          4E4E4E4E4E4E4E4E4E4E4E4E4EF5E32B2B2B2B2B314F2690AD0C71C781BDBDE8
          BD8132714E901379AF79AD4E4E4E4E4E4E4E4E4E4E4EEB26162B2B2B2B2B2B2B
          2B2B2B2B2B2B2B108CB4B4B4B4B4B4B4B4B46F6F6F6F6F6F47AF4F2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8C6F6F6F6FB4B4B4B4B4B4
          B4B4B4B4BBBBBB47AF2BE0BBBBBB7070707070707070707070703638D22B2B2B
          CB6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6DFCE32B2B2B2B01900CB52A8E6D6D6D
          6D6D6D6D6D6D6D6D6D6DEEC7AD28736D6D6D6D6D6D6D6D6D70708058162B2B2B
          2B2B2B2B2B2B2B2B2B2B2B870DBBBBBBB4B4B4B4B4B4B4B4B46F6F6F0D58AF7F
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8C6FB4B4B4B4B4
          B4B4B4B4BBBBBBBBBBBBBB47AF2BE0707070707070707070706D6D6D6D6D3638
          D22B2B2BCB6D6D6D6D6D8E8E8E8E8E8E8E8E8E8E8EBAE32B2B2BC2C72A8E8E8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E6D6D6D6D6D6D6D6D6D6D6D6DAA58
          162B2B2B2B2B2B2B2B2B2B2B2B2B2BD5BBBBBBBBBBBBBBBBB4B4B4B4B4B4B4B4
          6FEBAF882B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8CB4B4
          B4B4B4B4B4BBBBBBBBBBBBBBBBBB7047AF2BE07070707070706D6D6D6D6D6D6D
          6D6D2A38D22B2B2BCB8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EBAE32B2BC2EE8E
          8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E6D6D
          6D6DAA58162B2B2B2B2B2B2B2B2B2B2B2B2B2B827070BBBBBBBBBBBBBBBBBBB4
          B4B4B4B4B447AF4F2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B8CB4B4B4B4BBBBBBBBBBBBBBBBBB7070707047AF2B41706D6D6D6D6D6D6D6D
          6D6D6D6D8E8E2A38D22B2B2BCB8E8E8E8E8E8E8E8B8B8B8B8B8B8B8B8BBAE32B
          DDEE8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8E8E8E8E8E8E8E8E
          8E8E8E8E8E8EAA58162B2B2B2B2B2B2B2B2B2B2B2B2BB2807070707070BBBBBB
          BBBBBBBBBBBBB4B4B48058AF102B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2B8CB4BBBBBBBBBBBBBBBB707070707070707047AF2B416D6D6D6D6D
          6D6D6D8E8E8E8E8E8E8EEE38D22B2B2BCB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
          8BBAE32BBC8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B74EE3E8B8B8B8B8B8B8B
          8B8B8B8B8E8E8E8E8E8EAA58162B2B2B2B2B2B2B2B2B2B2B2B2BD57070707070
          70707070BBBBBBBBBBBBBBBBBBB4EBAFF82B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B8CBBBBBBBBBBBBBB70707070707070706D6D47AF2B416D
          6D6D6D8E8E8E8E8E8E8E8E8E8E8EEE38D22B2B2BCB8B8B8B8B8B8B8B8B8B8B83
          8383838383BAE32B618383838383838383838383838383833E9C95439482528B
          8B8B8B8B8B8B8B8B8B8B8B8B8B8BAA58162B2B2B2B2B2B2B2B2B2B2B2B7F096D
          6D6D6D7070707070707070BBBBBBBBBBBBBB9CAF782B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B8CBBBBBBBB70707070707070706D6D6D6D6DF1
          AF2B418E8E8E8E8E8E8E8E8E8E8B8B8B8B8BEE38D22B2B2BCB8B838383838383
          838383838383838383BAE32BDE838383838383838383838383838383DE12B82B
          2B2BDB838383838383838B8B8B8B8B8B8B8BAA58162B2B2B2B2B2B2B2B2B2B2B
          2BDD366D6D6D6D6D6D6D7070707070707070BBBBBBBB8058AF102B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8CBB70707070707070706D6D6D6D6D
          6D6D6DF1AF2B418E8E8E8E8E8E8B8B8B8B8B8B8B8B8B5238D22B2B2BCB838383
          83838383838383838393939393BAE32BDE939393939393939393939393939393
          32AFB82B2B2BDC838383838383838383838383838B8BDF58162B2B2B2B2B2B2B
          2B2B2B2B2BDC8E8E6D6D6D6D6D6D6D6D7070707070707070BBBBBBEBAFF82B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8C707070707070706D6D6D
          6D6D6D6D6D8E8EF1AF2B418E8E8B8B8B8B8B8B8B8B8B8B8383835238D22B2B2B
          CB83838393939393939393939393939393BAE32BDE9393939393939393939393
          9393939332AFB82B2B2BDC939393938383838383838383838383DF58162B2B2B
          2B2B2B2B2B2B2B2BD1E88E8E8E8E8E6D6D6D6D6D6D6D6D70707070707070BB9C
          AF782B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8C707070706D6D
          6D6D6D6D6D6D8E8E8E8E8EF1AF2B418B8B8B8B8B8B8B8B838383838383835238
          D22B2B2BCB93939393939393939393939393939372BAE32BDE72727272727272
          727272727272727232AFB82B2B2BDC939393939393939393938383838383DF58
          162B2B2B2B2B2B2B2B2B2B2B598E8E8E8E8E8E8E8E8E6D6D6D6D6D6D6D707070
          707070E89FAF102B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B8C7070
          6D6D6D6D6D6D6D6D8E8E8E8E8E8E8EF1AF2B418B8B8B8B8B8383838383838383
          83833A38D22B2B2BCB93939393937272727272727272727272BAE32B98727272
          72727272727272727272727232AFB82B2B2BDC72729393939393939393939393
          9393DF58162B2B2B2B2B2B2B2B2B2B10618B8B8B8E8E8E8E8E8E8E8E6D6D6D6D
          6D6D6D7070707070EBAFF82B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B096D6D6D6D6D6D6D8E8E8E8E8E8E8E8E8B8BF1AF2B418B8B83838383838383
          8383939393933A38D22B2B2BCB72727272727272727272727272727272BAE32B
          989B9B9B9B9B9B9B9B9B9B727272727232AFB82B2B2BDC727272727272727293
          939393939393DF58162B2B2B2B2B2B2B2B2B2BDD3E8B8B8B8B8B8B8E8E8E8E8E
          8E8E6D6D6D6D6D6D6D7070709CAF782B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2B096D6D6D6D6D8E8E8E8E8E8E8E8B8B8B8B8BF1AF2BDC8383838383
          838393939393939393933A38D22B2B2BCB72727272727272729B9B9B9B9B9B9B
          9BBAE32B989B9B9B9B9B9B9B9B9B9B9B9B9B9B9B6AAFB82B2B2BDC7272727272
          72727272727272729393DF58162B2B2B2B2B2B2B2B2B2BBC83838B8B8B8B8B8B
          8B8E8E8E8E8E8E8E6D6D6D6D6D6D6D70E89FAF102B2B2B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B096D6D6D8E8E8E8E8E8E8E8B8B8B8B8B8B8BF1AF2BDC83
          83838393939393939393939372721F38D22B2B2BCB72729B9B9B9B9B9B9B9B9B
          9B9B9B9B9BBAE32B989B9B9B9B9B9B9B9B9B9B9B9B9B9B9B6AAFB82B2B2BDC9B
          9B9B9B9B727272727272727272729958162B2B2B2B2B2B2B2B2BF85A83838383
          8B8B8B8B8B8B8B8E8E8E8E8E8E8E6D6D6D6D6D6D6DADAF1D2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B096D6D8E8E8E8E8E8E8B8B8B8B8B8B8B8383F1
          AF2BDC8383939393939393939372727272721F38D22B2B2BCB9B9B9B9B9B9B9B
          9B9B9B6E6E6E6E6E6EBAE32BB16E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6AAFB82B
          2B2B539B9B9B9B9B9B9B9B9B9B72727272729958162B2B2B2B2B2B2B2B2B5983
          8383838383838B8B8B8B8B8B8B8E8E8E8E8E8E8E6D6D6D6D6D71AF782B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B098E8E8E8E8E8E8E8B8B8B8B8B8B83
          838383F1AF2BDC9393939393939372727272727272721F38D22B2B2BCB9B9B9B
          9B6E6E6E6E6E6E6E6E6E6E6E6EBAE32BB16E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6AAFB82B2B2B536E6E6E9B9B9B9B9B9B9B9B9B9B9B729958162B2B2B2B2B2B2B
          2B7FDE9393838383838383838B8B8B8B8B8B8B8E8E8E8E8E8E8E6D6D6DE89FAF
          102B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B098E8E8E8E8E8B8B8B8B8B
          8B8B8383838383F1AF2BDC939393939372727272727272729B9B3C38D22B2B2B
          CB6E6E6E6E6E6E6E6E6E6E6E6EA8A8A8A8BAE32BB1A8A8A8A8A8A8A8A8A8A8A8
          A8A8A8A86AAFB82B2B2B536E6E6E6E6E6E6E6E9B9B9B9B9B9B9B9958162B2B2B
          2B2B2B2B2BDDF693939393838383838383838B8B8B8B8B8B8B8E8E8E8E8E8E6D
          6D6DADAF1D2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B098E8E8E8E8B8B
          8B8B8B8B83838383838383F1AF2BDC939393727272727272729B9B9B9B9B3C38
          D22B2B2B976E6E6E6E6E6EA8A8A8A8A8A8A8A8A8A8BAE32BB1A8A8A8A8A8A8A8
          A8A8A8A8A8A8A8A86AAFB82B2B2BBCA86E6E6E6E6E6E6E6E6E6E9B9B9B9B9958
          162B2B2B2B2B2B2B2B4893939393939393838383838383838B8B8B8B8B8B8E8E
          8E8E8E8E6D6D71AF012B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B098E8E
          8B8B8B8B8B8B8B8383838383839393F1AF2BDC93727272727272729B9B9B9B9B
          9B9B3C38D22B2B2B976E6EA8A8A8A8A8A8A8A8A8A8A8A8A8A60CE32BB1A6A6A6
          A6A6A6A6A6A6A6A6A6A6A6A66AAFB82B2B2BBCA8A8A8A8A86E6E6E6E6E6E6E6E
          6E9B9958162B2B2B2B2B2B2B4A997272939393939393938383838381818B8B8B
          8B8B8B8E8E8E8E8E8E6DBD9FAF2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2BB58E8B8B8B8B8B8B83838383838393939393F1AF2BDC7272727272729B9B9B
          9B9B9B9B6E6E0F38D22B2B2B97A8A8A8A8A8A8A8A8A8A6A6A6A6A6A6A60CE32B
          B1A6A6A6A6A6A6A6A6A6A6A6A6A6A6A66AAFB82B2B2BBCA8A8A8A8A8A8A8A8A8
          6E6E6E6E6E6E9958162B2B2B2B2B2B2BAC72727272729393939393938383839C
          8F838B8B8B8B8B8B8E8E8E8E8E8E73ADAF1D2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BB58B8B8B8B8B8B8383838383839393939393F1AF2BDC727272729B
          9B9B9B9B9B9B6E6E6E6E0F38D22B2B2B97A8A8A8A8A6A6A6A6A6A6A6A6A6A6A6
          A60CE32BB1A7A7A7A7A7A7A7A7A7A7A7A7A6A6A66AAFB82B2B2BBCA6A6A6A8A8
          A8A8A8A8A8A86E6E6E6EFA58162B2B2B2B2B2BB80A7272727272729393939393
          938323B34183838B8B8B8B8B8B8B8E8E8E8E8E71AF012B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2BB58B8B8B8B8B838383838383939393939393C7AF2BDC72
          72729B9B9B9B9B9B6E6E6E6E6E6E0F38D22B2B2B97A8A6A6A6A6A6A6A6A6A6A6
          A7A7A7A7A70CE32BB1A7A7A7A7A7A7A7A7A7A7A7A7A7A7A76AAFB82B2B2BBCA6
          A6A6A6A6A6A8A8A8A8A8A8A86E6EFA58162B2B2B2B2B2B97769B727272727272
          93939393939381E3F3528383838B8B8B8B8B8E8E8E8E8E81265B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B8B83838383838393939393939372C7
          AF2BDC729B9B9B9B9B9B6E6E6E6E6E6E6EA84038D22B2B2B97A6A6A6A6A6A6A6
          A7A7A7A7A7A7A7A7A70CE32BE9A9A9A9A9A9A9A9A9A9A9A7A7A7A7A76AAFB82B
          2B2BCCA6A6A6A6A6A6A6A6A8A8A8A8A8A8A8FA58162B2B2B2B2B2B329B9B9B72
          727272727293939393939C8810B58383838B8B8B8B8B8B8E8E8E8E73ADAF1D2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B8383838383839393939393
          937272C7AF2B539B9B9B9B9B9B6E6E6E6E6E6EA8A8A84038D22B2B2B97A6A6A6
          A6A7A7A7A7A7A7A7A7A7A9A9A90CE32BE9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
          6AAFB82B2B2BCCA7A7A7A6A6A6A6A6A6A6A8A8A8A8A8FA58162B2B2B2B2B853C
          9B9B9B9B727272727272939393F6B37F2B82838383838B8B8B8B8B8B8E8E8E8E
          BAAF012B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B83838383839393
          93939393727272C7AF2B539B9B9B9B9B6E6E6E6E6E6EA8A8A8A84038D22B2B2B
          97A6A6A7A7A7A7A7A7A7A7A9A9A9A9A9A90CE32BE9A9A9E2E2E2E2E2A9A9A9A9
          A9A9A9A9E9AFB82B2B2BCCA7A7A7A7A7A6A6A6A6A6A6A6A8A8A8FA58162B2B2B
          2B2B539B9B9B9B9B9B727272727272939354E32B2BD583838383838B8B8B8B8B
          8B8E8E8E81265B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B83838383
          8383939393939372727272C7AF2B539B9B9B9B6E6E6E6E6E6EA8A8A8A8A84038
          D22B2B2B97A7A7A7A7A7A7A7A9A9A9A9A9A9A9A9E20CE32BE9E2E2E2E2E2E2E2
          E2E2E2E2E2E2E2A9E9AFB82B2B2BCCA7A7A7A7A7A7A7A6A6A6A6A6A6A8A8A058
          162B2B2B2B31546E9B9B9B9B9B9B72727272727293C7882B2B87DF8383838383
          8B8B8B8B8B8E8E8E73ADAF312B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B
          838383838393939393939372727272C7AF2B539B9B9B6E6E6E6E6E6EA8A8A8A8
          A8A84038D22B2B2B97A7A7A7A7A7A9A9A9A9A9A9A9E2E2E2E20CE32BE9E2E2A1
          A1A1A1A1A1E2E2E2E2E2E2E2E9AFB82B2B2BCCA9A9A7A7A7A7A7A7A6A6A6A6A6
          A6A8A058162B2B2B2B596E6E6E9B9B9B9B9B9B7272727272F6B37F2B2B2BDE83
          838383838B8B8B8B8B8B8E8E8EBAAF3B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2BB58B83838383838393939393937272727272C7AF2B539B9B9B6E6E6E6E6EA8
          A8A8A8A8A8A64038D22B2B2B97A7A7A7A7A9A9A9A9A9A9E2E2E2E2E2E20CE32B
          21A1A1A1A1A1A1A1A1A1A1A1A1E2E2E2E9AFB82B2B2BCCA9A9A9A7A7A7A7A7A7
          A6A6A6A6A6A6A058162B2B2B10986E6E6E6E9B9B9B9B9B7272727272542D2B2B
          2B2BBC83838383838B8B8B8B8B8B8E8E8EB5265B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BB58B83838383839393939393937272727272C7AF2B539B9B6E6E6E
          6E6E6EA8A8A8A8A8A8A61E38D22B2B2B97A7A7A7A9A9A9A9A9A9E2E2E2E2E2A1
          A10CE32B21A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1E9AFB82B2B2BCCA9A9A9A9A7
          A7A7A7A7A7A6A6A6A6A6A058162B2B2BDD0F6E6E6E6E9B9B9B9B9B9B72727272
          C7882B2B2B2BD59383838383838B8B8B8B8B8E8E8E73F5AF312B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2BB58B83838383839393939393937272727272C7AF2B539B
          9B6E6E6E6E6E6EA8A8A8A8A8A6A61E383B2B2B2B97A7A7A9A9A9A9A9A9E2E2E2
          E2E2A1A1A137E32B2111111111111111111111A1A1A1A1A1E9AF5C2B2B2BCCA9
          A9A9A9A9A7A7A7A7A7A6A6A6A6A6A058162B2B2B486E6E6E6E6E9B9B9B9B9B9B
          727272F6B37F2B2B2B2B0E5A83838383838B8B8B8B8B8E8E8E8EBAAF3B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2BB58B83838383839393939393937272727272C7
          AF2B539B9B6E6E6E6E6E6EA8A8A8A8A8A6A61E38E37F2B2B97A7A7A9A9A9A9A9
          A9E2E2E2E2E2A1A1A137E32B211111111111111111111111A1A1A1A1E9AFD22B
          2B2BCCA9A9A9A9A9A7A7A7A7A7A7A6A6A6A6A058162B2B2C5D6E6E6E6E6E9B9B
          9B9B9B9B727272542D2B2B2B2B2B2B6183838383838B8B8B8B8B8E8E8E8EB526
          5B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B83838383839393939393937272
          727272C7AF2B539B9B6E6E6E6E6E6EA8A8A8A8A8A6A640F5AFAFB64FB3A7A7A9
          A9A9A9A9A9E2E2E2E2E2A1A1A137E32B211111111111111111111111A1A1A1A1
          21AFAFE30101DAA9A9A9A9A9A7A7A7A7A7A7A6A6A6A6A058162B2BACA86E6E6E
          6E6E9B9B9B9B9B9B727272C7882B2B2B2B2B2BDC83838383838B8B8B8B8B8E8E
          8E8E73F5AF312B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B838383838393939393
          93937272727272C7AF2B539B9B6E6E6E6E6E6EA8A8A8A8A8A6A6A6DA7E58587E
          C9A7A7A7A9A9A9A9A9E2E2E2E2E2A1A1A1374F2B21111111111111111111A1A1
          A1A1A1A177289F79267E3FA9A9A9A9A9A7A7A7A7A7A6A6A6A6A6A058162B7F0A
          A86E6E6E6E6E9B9B9B9B9B9B7272F6B37F2B2B2B2B2B2B5023838383838B8B8B
          8B8B8E8E8E8E8EBAAF3B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8383838383
          8393939393937272727272C7AF2B539B9B9B6E6E6E6E6EA8A8A8A8A8A8A6A6A6
          7A9E9E7AA7A7A7A7A9A9A9A9A9A9E2E2E2E2E2E2A10CF82B21A1A1A1A1A1A1A1
          A1A1A1A1A1A1A1E2E2CE3F023F2EA9A9A9A9A9A7A7A7A7A7A7A6A6A6A6A6A058
          162B24686E6E6E6E6E6E9B9B9B9B9B727272542D2B2B2B2B2B2B2B8DBD838383
          8B8B8B8B8B8B8E8E8E8E8EDE795B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B83
          838383838393939393939372727272C7AF2B539B9B9B6E6E6E6E6E6EA8A8A8A8
          A8A6A6A6A6A6A6A7A7A7A7A7A7A9A9A9A9A9A9A9E2E2E2E2CE182B2BB1A1A1A1
          A1A1A1A1A1A1A1A1A1E2E2E2E2E2E2E2A9A9A9A9A9A9A7A7A7A7A7A7A6A6A6A6
          A6A6A058162B48A86E6E6E6E6E9B9B9B9B9B9B727272C7882B2B2B2B2B2B2B2B
          618383838B8B8B8B8B8B8E8E8E8E8E36F5AF5C2B2B2B2B2B2B4A4A2B2B2B2B2B
          2BB58B8B838383838383939393939372727272C7AF2B539B9B9B9B6E6E6E6E6E
          6EA8A8A8A8A8A6A6A6A6A6A6A7A7A7A7A7A7A7A9A9A9A9A9A9A9E2E2C9842B2B
          5977E2E2E2A1E2E2E2E2E2E2E2E2E2E2E2A9A9A9A9A9A9A9A9A7A7A7A7A7A7A6
          A6A6A6A6A6A8A05816B20F6E6E6E6E6E6E9B9B9B9B9B727272F6FC7F2B2B2B2B
          2B2B2B2B418383838B8B8B8B8B8E8E8E8E8E8E6DBAAF3B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2BB58B8B838383838383939393939393727272C7AF2B539B9B9B9B9B
          6E6E6E6E6EA8A8A8A8A8A8A8A6A6A6A6A6A6A7A7A7A7A7A7A7A9A9A9A9A9A9C9
          A52B2B2BB9829EE2E2E2E2E2E2E2E2E2E2E2A9A9A9A9A9A9A9A9A9A7A7A7A7A7
          A7A6A6A6A6A6A6A6A8A8FA5816536E6E6E6E6E6E9B9B9B9B9B9B727272542D2B
          2B2B2B2B2B2B2B2B8623838B8B8B8B8B8B8E8E8E8E8E6D6DDE79E32B2B2B2B2B
          2B4A4A2B2B2B2B2B2BB58B8B8B8383838383839393939393937272C7AF2B539B
          9B9B9B9B9B6E6E6E6E6E6EA8A8A85EB140A6A6A6A6A6A6A6A7A7A7A7A7A7A7A9
          4DC9BC962B2B2B2B2B2BC66A9EA9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A74D5DA7
          A7A7A7A7A6A6A6A6A6A6A8A8A8A8FA5801546E6E6E6E6E9B9B9B9B9B9B727272
          72487F2B2B2B2B2B2B2B2B2B84BD8B8B8B8B8B8B8E8E8E8E8E8E6D6D36515C2B
          2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B8B83838383838393939393939372C7
          AF2B48292929292929292929295D5D5D5D5DFDE694DB98FD5DA0405EA6A67A1E
          9EFDB1DB94352B2B2B2B2B2B2B2B2B2BA58298C93F4D7BA9A9A97B4D9E3FC932
          828648A7A7A6A6A6A6A6A6A6A6A8A8A8A8A8FA58185D29292929292929292929
          2929292929972B2B2B2B2B2B2B2B2B2B2B475A5A5A5A06060606060606060606
          06182B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B8B8B838383838383939393
          939393C7AF2BF4C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8B92B2B2B35C84394E7
          95E0D594A5F42B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B35C8C6E795E095E794
          A5C8352B2B2BCCA6A6A6A6A6A6A6A8A8A8A8A8A8A8A8FA5885C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8102B2B2B2B2B2B2B2B2B2B2BF4C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8962B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58B8B8B8B8B8B83838383
          83839393939393C7AF2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2BBCA6A6A6A6A6A8A8A8A8A8A8A8A86E6EFA58162B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58E8B8B8B8B8B
          8B83838383838393939393F1AF2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2BBCA6A8A8A8A8A8A8A8A8A86E6E6E6E6E9958
          162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2BB58E8E
          8B8B8B8B8B8B838383838383939393F1AF2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BBCA8A8A8A8A8A8A86E6E6E6E6E6E
          6E6E9958162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B098E8E8E8B8B8B8B8B8B8B83838383838393F1AF2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BBCA8A8A8A86E6E6E6E6E
          6E6E6E6E9B9B9958162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2B098E8E8E8E8E8B8B8B8B8B8B838383838383F1AF2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B536E6E6E6E6E
          6E6E6E6E9B9B9B9B9B9B9958162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B098E8E8E8E8E8E8B8B8B8B8B8B8B83838383F1AF2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B536E
          6E6E6E6E6E9B9B9B9B9B9B9B9B9B9958162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B096D8E8E8E8E8E8E8E8B8B8B8B8B8B8B8383BC
          162B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B536E9B9B9B9B9B9B9B9B9B9B9B72727299D75C2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B096D6D6D8E8E8E8E8E8E8E8B8B8B8B
          8B8B8B652B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B539B9B9B9B9B9B9B9B72727272727272992C2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B94E7E7E7E7E7E7E7E7E7E7
          E7E7E7E7E7E7E7F32B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2BF3151515151515151515151515151515157F2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B696926AFAF
          AFAFAF26AF785C2B2B2B2B10789F9F5BE3B6E33B9F69882B2B2B5C69692B2B2B
          2BD2695B2B2B2B2B5CE326AF5B5BB62B2B2B2B2B2B2B2B2B2B2B2BE36969782B
          2B2B2B166969792B2B2B2B2B2B5B693B2B2B2B2BF8AF26AF5B5BD22B2B4F694F
          2B2B2B2B2B2BB6693B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B1000
          00D22B2B2B2B2B2B160000D22B2B2B2600AF2B2B2B2B2B1D4C00D22B2B2B3100
          002B2B2B2B4F00132B2B2B2B1300E32B2B2B2B2B2B2B2B2B2B2B2B2B2B2BB600
          9FE300012B2BF84C8A5B00262B2B2B2B2B13004F2B2B2B2B4C00F82B2B2B2B2B
          2B7900AF2B2B2B2B2B2B9F00B62B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B100000AF3B3B3B3B01E39F134F102B2B2B6900012B2B2B2B2B2B6C00D22B
          2B2B3100002B2B2B2B4F00132B2B2B2B6900782B2B2B2B2B2B2B2B2B2B2B2B2B
          2B7800132B2BAF00D21D4C13102B7900AF2B2B2B2B13004F2B2B2B1000005C2B
          2B2B2B2B2B79008A2B2B2B2B2B2B8A004F2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B100000B61D1D1D1D887822C1D22B2B2B2B6900012B2B2B2B2B2B
          6C00D22B2B2B3100002B2B2B2B4F00132B2B31B622008AB6B6B6782B2B2B2B2B
          2B2B2B2BD20008102B2B2B26009108102B2B2B9F00E32B2B2B13004F2B2B16B6
          00005BB6B6B6162B2B790008E3E3B64FB68A6CAF7F2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B100000AF161616163BE3916C3B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B10D2D22B2B2B2B4F00132B2B2B2B6900782B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2BF8D25C
          2B2B2B1000005C2B2B2B2B2B2B7900AF2B2B2B7F7F2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B888888888888F81D31102B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B7FB6B62B2B2B2B1DB63B2B2B2B2B107F2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2BD2B61D2B2B2B2B7F7F2B2B2B2B2B2B2B16B6882B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4A4A2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4AD74A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A
          4AD7}
      end
      object STAbout: TStaticText
        Left = 0
        Top = 0
        Width = 519
        Height = 25
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Total Commander Mail Plugin'
        Font.Charset = OEM_CHARSET
        Font.Color = clBtnText
        Font.Height = -19
        Font.Name = 'Terminal'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        TabOrder = 0
      end
      object StaticText1: TStaticText
        Left = 3
        Top = 112
        Width = 72
        Height = 20
        Caption = 'Thanks to:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 23
        Top = 138
        Width = 471
        Height = 17
        Caption = 
          'alk_banka, CaptainFlint, chris34, djk, DrShark, guent peer, joey' +
          'eti, MayorA, petermad, roentgen'
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 3
        Top = 48
        Width = 67
        Height = 20
        Caption = 'Contacts:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object StaticText4: TStaticText
        Left = 23
        Top = 74
        Width = 101
        Height = 17
        Caption = 'ICQ UIN 215168320'
        TabOrder = 4
      end
    end
  end
  object BBOk: TBitBtn
    Left = 438
    Top = 453
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = BBOkClick
  end
  object BBCancel: TBitBtn
    Left = 355
    Top = 453
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = BBCancelClick
  end
  object PMMBList: TPopupMenu
    Left = 296
    Top = 448
    object MBAdd: TMenuItem
      Caption = 'Add'
      ShortCut = 45
      OnClick = MBAddClick
    end
    object MBDelete: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      OnClick = MBDeleteClick
    end
    object MBRename: TMenuItem
      Caption = 'Rename'
      ShortCut = 113
      OnClick = MBRenameClick
    end
    object MBCopy: TMenuItem
      Caption = 'Copy'
      ShortCut = 116
      OnClick = MBCopyClick
    end
  end
  object XPManifest1: TXPManifest
    Left = 320
    Top = 448
  end
  object CDialog: TColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 264
    Top = 448
  end
  object ODBlatOpen: TOpenDialog
    DefaultExt = 'exe'
    FileName = 'blat.exe'
    Filter = 'blat.exe|blat.exe'
    Left = 232
    Top = 448
  end
end
