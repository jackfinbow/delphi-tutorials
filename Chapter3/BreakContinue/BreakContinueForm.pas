unit BreakContinueForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  S: string;
  I: Integer;
  Found: Boolean;
begin
  {
  Break - Exits loop
  Continue - Jumps to condition or counter increment, continuing with next loop
              iteration
  }

  S := 'Hello World';
  Found := False;

  for I := Low(S) to High(S) do
    // '=' is used for testing equality (not '==')
    if S[I] = 'o' then
      begin
        Found := True;
        Break;
      end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
