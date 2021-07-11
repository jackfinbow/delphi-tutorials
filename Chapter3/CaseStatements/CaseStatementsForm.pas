unit CaseStatementsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation, FMX.EditBox,
  FMX.NumberBox;

type
  TForm1 = class(TForm)
    NumberBox1: TNumberBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  ANumber: Integer;
  AText: string;
begin
  ANumber := Trunc(NumberBox1.Value);

  case ANumber of
    1: AText := 'One';
    2: AText := 'Two';
    3: AText := 'Three';
  else
    AText := 'Number must be between 1 and 3';
  end;

  if AText <> '' then
    Show(AText);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  AChar: Char;
  AText: string;
begin
  // Multiple nested if statements
  if Edit1.Text.Length > 0 then
  begin
    AChar := Edit1.Text.Chars[0];

    case AChar of
      '+' : AText := 'Plus sign';
      '-' : AText := 'Minus sign';
      '*', '/': AText := 'Multiplication or division';
      '0'..'9': AText := 'Number';
      'a'..'z': AText := 'Lowercase character';
      'A'..'Z': AText := 'Uppercase character';
      #12032..#12255: AText := 'Kangxi Radical';
    else
      AText := 'Other character: ' + AChar;
    end;

    Show(AText);
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
