unit OpenArraysForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TIntegersArray = array of Integer;

{
 In Pascal, a function or procedure is always called with a fixed number of
 parameters; however, a dynamic array can be specified as a parameter, without
 having to specify number of parameters.
}

function Sum(const A: array of Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(A) to High(A) do
    Result := Result + A[I];
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y, I: Integer;
begin
  Y := 10;
  I := 1;
  X := Sum([10, Y, 27*I]);
  Show(X.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  List: array of Integer;
  X, I: Integer;
begin
  // initialize the array
  SetLength(List, 10);
  for I := Low(List) to High(List) do
    List [I] := I * 2;
  // call
  X := Sum(List);
  Show(X.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  List: array [1..10] of Integer;
  X, I: Integer;
begin
  // initialize the array
  for I := Low(List) to High(List) do
    List [I] := I * 2;

  // call
  X := Sum(List);
  Show(X.ToString);

  // pass portion of the array (5 elements)
  X := Sum(Slice(List, 5));
  Show(X.ToString);
end;

{
 This defines a parameter with an array of undefined length(const Args) and also
 of undefined type (array of const).
}

function SumAll(const Args: array of const): Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(Args) to High(Args) do
    case Args[I].VType of
      vtInteger:
        begin
        Result := Result + Args[I].VInteger;
        Form1.Show('Running total: ' + Result.ToString);
        end;
      vtBoolean:
        if Args[I].VBoolean then
          Result := Result + 1;
      vtExtended:
        Result := Result + Args[I].VExtended^;
      vtWideChar:
        Result := Result + Ord(Args[I].VWideChar);
      vtCurrency:
        Result := Result + Args[I].VCurrency^;
    end; // case
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  X: Extended;
  Y: Integer;
begin
  Y := 10;
  X := SumAll([Y * Y, 'k', True, 10.34]);
  Show('SumAll: ' + X.ToString);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
