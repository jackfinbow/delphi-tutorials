unit ParametersForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

function ComputeValue: Integer;
var
  Value: Integer;
begin
  Value := 0;
  while True do
    Inc(Value);
  Result := Value;
end;

{
 This method is cleaner because the Result variable can be used in the function,
 as it doesn't terminate the function (unlike C etc) and doesn't require a
 variable declaration for it
}
function ComputeValueBetter: Integer;
begin
  Result := 0;
  while True do
    Inc(Result);
end;

{
 as Result does not terminate function, Exit is used to terminate before end
 is reached
}
function CharInString(S: string; Ch: Char): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(S) to High(S) do
    if (S[I]) = Ch then
    begin
      Result := True;
      Exit;
    end;
end;

{
 This is more compact because Exit can accept arguments, thus eliminating the
 need for begin-end block inside the if statement
}
function CharInString2(S: string; Ch: Char): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(S) to High(S) do
    if (S[I]) = Ch then
      Exit (True);
end;

{
 Using the var keyword infront of Value passes it "by reference" rather than "by
 value" and thus the original value is overidden without it having to be passed
 and then returned, improving efficiency of code

 This is similar to pointers in C where &Value would be used to pass the
 reference

 Variables can also be passed using the const keyword, e.g. for strings, but
 their value can obviously not be changed
}
procedure DoubleTheValue(var Value: Integer);
begin
  Value := Value * 2;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if CharInString('Hello world', 'o') then
    Show('Found');
  if CharInString2('Hello world', 'o') then
    Show('Found')
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X: Integer;
//  C: Cardinal;
begin
  X := 10;
  DoubleTheValue(X);
  Show(X.ToString);

//  C := 10;
//  DoubleTheValue(C);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
