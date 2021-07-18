unit FunctionsForm;

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
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

// simple Hello World
// procedures/functions without arguments do not need empty parentheses
procedure Hello;
begin
  // need to use Form1.Show rather than Show because of accessing Show procedure
  // inside the Form1 instance of the TForm1 class;
  Form1.Show('Hello World!');
end;

// old-style Pascal of assigning return value to variable with function name
function OldDouble(Value: Integer): Integer;
begin
  OldDouble := Value * 2;
end;

// best to use 'Result' keyword for return value (like 'Return' in other languages)
function Double(Value: Integer): Integer;
begin
  Result := Value * 2;
end;

{
  use 'forward' to declare existence of procedure/function for use in another
  block wuithout providing implementation - use when there's mutual recursion
}
procedure DoubleHello; forward;

procedure NewHello;
begin
// asks user for confirmation
  if MessageDlg('Do you want a double message?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    DoubleHello
  else
    ShowMessage('Hello');
end;

procedure DoubleHello;
begin
  NewHello;
  NewHello;
end;

function PowerLoop(Base, Exponent: Integer): Integer;
var
  I: Integer;
begin
  // Result does not terminate function (unlike C etc)
  Result := 1;
  for I := 1 to Exponent do
    Result := Result * Base;
end;

function PowerRecursion(Base, Exponent: Integer): Integer;
begin
  if Exponent = 0 then
    Result := 1
  else
    Result := Base * PowerRecursion(Base, Exponent - 1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Hello;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X, Y: Integer;
begin
  // Call the function
  X := Double(100);
  Y := Double(X);
  Show('200 doubled is ' + Y.ToString);

  // Error: wrong type
  // Double(10.0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  X, Y: Integer;
begin
  X := PowerLoop(2, 3);
  Y := PowerRecursion(2, 3);
  Form1.Show('Loop ' + X.ToString);
  Form1.Show('Recursion ' + Y.ToString);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
