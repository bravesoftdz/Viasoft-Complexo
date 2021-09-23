unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TConjunto = Record
    Number1:integer;
    Number2:integer;
  End;
  TArrayOfConjunto = array of TConjunto;
  TExcecao = class (Exception);

  TNetwork = Class
  private
    felementos : Integer;
    Connections : array of TConjunto;// TArrayOfConjunto;
    Function WalkConnections(Number1,Number2:integer) :boolean;
    function Count:integer;
    function NumerosLigados(Number1, Number2: integer): boolean;
    function NumerosLigadosIndiretamente(Number1, Number2: integer): boolean;
    function NumeroPositivo(Numero:integer):boolean;
  public
    constructor Create(elementos:integer);
    destructor Destroy;
    function Connect(Number1, Number2:integer):Boolean;
    function Query(Number1, Number2:integer):Boolean;
  End;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Network :TNetwork;
implementation

{$R *.dfm}
{ TNetwork }

function TNetwork.Connect(Number1, Number2:integer): Boolean;
Var
  fCount : integer;
begin
  if Number1 = Number2 then
    raise TExcecao.Create('O primeiro número não pode ser igual ao segundo.');

  if NumeroPositivo(Number1) or NumeroPositivo(Number2) then
    raise TExcecao.Create('O número não pode ser negativo.');

  if felementos = Count then
    raise TExcecao.Create('Não é possíveu inserir mais nenhuma elemento, pois já excedeu o limite.');

  if not WalkConnections(Number1, Number2) then
  Begin
    fCount := Count;
    SetLength(Connections, fCount+1);
    Connections[fCount].Number1 := Number1;
    Connections[fCount].Number2 := Number2;
  End;
end;

function TNetwork.Count: integer;
begin
  Result := Length(Connections);
end;

constructor TNetwork.Create(elementos: integer);
begin
  inherited Create;
  felementos := elementos;
  SetLength(Connections, 0);
end;

destructor TNetwork.Destroy;
begin
  inherited;
end;

function TNetwork.Query(Number1, Number2:integer): Boolean;
begin
  if Count = 0 then
    raise TExcecao.Create('Não existe nenhum vínculo armazenado');
  Result := (NumerosLigados(Number1, Number2) or NumerosLigadosIndiretamente(Number1, Number2));
end;

function TNetwork.WalkConnections(Number1,Number2:integer): boolean;
Var
  I:Integer;
begin
  Result:=False;
  for I := Low(Connections) to High(Connections) do
    if NumerosLigados(Number1, Number2) then
    Begin
      Result:=True;
      raise TExcecao.Create('A ligação entre os números ' +IntToStr(Number1) + ' e '+
                            IntToStr(Number2) + ' já foi realizada.');
    End;
end;

function TNetwork.NumeroPositivo(Numero: integer): boolean;
begin
  Result := Numero < 0;
end;

function TNetwork.NumerosLigados(Number1,Number2:integer): boolean;
Var
  I:Integer;
begin
  Result:=False;
  for I := Low(Connections) to High(Connections) do
    if ((Number1 = Connections[I].Number1) and (Number2 = Connections[I].Number2)) or
       ((Number1 = Connections[I].Number2) and (Number2 = Connections[I].Number1)) then
    Begin
      Result:=True;
      Exit;
    End;
end;

Function TNetwork.NumerosLigadosIndiretamente(Number1,Number2:integer): boolean;
Var
  N2:integer;
  I:integer;

Begin
  Result := False;
  for I := Low(Connections) to High(Connections) do
  Begin
    if (Number1 = Connections[I].Number1) and (Number2 <> Connections[I].Number2) or
       (Number1 <> Connections[I].Number2) and (Number2 = Connections[I].Number1) then
    Begin
      N2 := Connections[I].Number2;
      if (NumerosLigados(Number1, N2)) and (NumerosLigados(Number2,N2))then
      Begin
        Result:=True;
        Exit;
      End;
    End;
  End;
End;
//_____________________________________________________________________________

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Length(Edit1.Text)=0 then
  Begin
    Edit1.SetFocus;
    ShowMessage('Favor informar o primeiro número');
    Exit;
  End;
  if Length(Edit2.Text)=0 then
  Begin
    Edit2.SetFocus;
    ShowMessage('Favor informar o segundo número');
    Exit;
  End;

  if not Assigned(Network) then
    Network := TNetwork.Create(8);

  Try
    Network.Connect(StrToInt(Edit1.Text), StrToInt(Edit2.Text));
    Memo1.Lines.Add(Edit1.Text + ' - ' + Edit2.Text);
  except
    on e:Exception do
      ShowMessage(e.Message);
  End;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Length(Edit1.Text)=0 then
  Begin
    Edit1.SetFocus;
    ShowMessage('Favor informar o primeiro número');
    Exit;
  End;
  if Length(Edit2.Text)=0 then
  Begin
    Edit2.SetFocus;
    ShowMessage('Favor informar o segundo número');
    Exit;
  End;

  if not Assigned(Network) then
    Network := TNetwork.Create(8);

  if Network.Query(StrToInt(Edit1.Text), StrToInt(Edit2.Text)) then
    ShowMessage('Números ligados direta ou indiretamente')
  else
    ShowMessage('Os Números não tem nenhuma ligados entre si.');
end;

end.
