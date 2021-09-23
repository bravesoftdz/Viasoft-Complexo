object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 213
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Vincular'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 97
    Top = 8
    Width = 40
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 153
    Top = 8
    Width = 40
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 16
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Verificar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 79
    Width = 251
    Height = 129
    ReadOnly = True
    TabOrder = 4
  end
end
