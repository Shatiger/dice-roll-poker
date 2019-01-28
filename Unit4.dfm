object Form4: TForm4
  Left = 1299
  Top = 294
  Width = 306
  Height = 432
  Caption = #1053#1086#1074#1072#1103' '#1080#1075#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 72
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 1'
  end
  object Label2: TLabel
    Left = 40
    Top = 104
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 2'
  end
  object Label3: TLabel
    Left = 40
    Top = 136
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 3'
  end
  object Label4: TLabel
    Left = 40
    Top = 168
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 4'
  end
  object Label5: TLabel
    Left = 40
    Top = 200
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 5'
  end
  object Label6: TLabel
    Left = 40
    Top = 232
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 6'
  end
  object Label7: TLabel
    Left = 40
    Top = 264
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 7'
  end
  object Label8: TLabel
    Left = 40
    Top = 296
    Width = 69
    Height = 13
    Caption = #1048#1084#1103' '#1080#1075#1088#1086#1082#1072' 8'
  end
  object ComboBox1: TComboBox
    Left = 72
    Top = 24
    Width = 153
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = '2 '#1080#1075#1088#1086#1082#1072
    OnChange = ComboBox1Change
    Items.Strings = (
      '2 '#1080#1075#1088#1086#1082#1072
      '3 '#1080#1075#1088#1086#1082#1072
      '4 '#1080#1075#1088#1086#1082#1072
      '5 '#1080#1075#1088#1086#1082#1086#1074
      '6 '#1080#1075#1088#1086#1082#1086#1074
      '7 '#1080#1075#1088#1086#1082#1086#1074
      '8 '#1080#1075#1088#1086#1082#1086#1074)
  end
  object Edit1: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Player 1'
  end
  object Edit2: TEdit
    Left = 144
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Player 2'
  end
  object Edit3: TEdit
    Left = 144
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Player 3'
  end
  object Edit4: TEdit
    Left = 144
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Player 4'
  end
  object Edit5: TEdit
    Left = 144
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Player 5'
  end
  object Edit6: TEdit
    Left = 144
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Player 6'
  end
  object Edit7: TEdit
    Left = 144
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Player 7'
  end
  object Edit8: TEdit
    Left = 144
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Player 8'
  end
  object Button1: TButton
    Left = 96
    Top = 344
    Width = 97
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1080#1075#1088#1091
    TabOrder = 9
    OnClick = Button1Click
  end
end
