unit IfStatementsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  IsChecked: Boolean;
begin
  IsChecked := CheckBox1.IsChecked;

  //begin and end blocks can be used for multiple statements in a single condition
  if IsChecked then
    Show('Checkbox is checked');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  IsChecked: Boolean;
begin
  IsChecked := CheckBox1.IsChecked;

  if IsChecked then
    // if-then-else is a single statement so 1st condition can't have semicolon
    Show('Checkbox is checked')
  else
    Show('Checkbox is not checked');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  AChar: Char;
begin
  /// Multiple nested if statements
  if Edit3.Text.Length > 0 then
  begin
    AChar := Edit3.Text.Chars[0];

    // Checks for a lowercase char (two conditions)
    if (AChar >= 'a') and (AChar <= 'z') then
      Show('Char is lowercase');

    // Follow up conditions
    if AChar <= Char(47) then
      Show('Char is lower symbol')
    else if (AChar >= '0') and (AChar <= '9') then
      Show('Char is a number')
    else
      Show('Char is not a number or lower symbol');
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
