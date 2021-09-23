object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 271
  ClientWidth = 282
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
  object Memo1: TMemo
    Left = 0
    Top = 46
    Width = 282
    Height = 225
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 93
    ExplicitWidth = 251
    ExplicitHeight = 129
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Label1: TLabel
      Left = 169
      Top = 3
      Width = 43
      Height = 13
      Caption = 'N'#250'mero1'
    end
    object Label2: TLabel
      Left = 225
      Top = 3
      Width = 43
      Height = 13
      Caption = 'N'#250'mero2'
    end
    object Button1: TButton
      Left = 88
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Vincular'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 169
      Top = 17
      Width = 40
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 225
      Top = 17
      Width = 40
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object Button2: TButton
      Left = 8
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Verificar'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
end
