unit ForLoopsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
  Total, I: Integer;
begin
  Total := 0;
  for I := 1 to 10 do
    Total := Total + I;
  Show(Total.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  AChar: Char;
begin
  for AChar := 'a' to 'z' do
    Show(AChar);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  S: string;
  I: Integer;
begin
  S := 'Hello world';
  for I := Low(S) to High(S) do
    Show(S[I]);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  S: string;
  Ch: Char;
begin
  S := 'Hello world';
  for Ch in S do
    Show(Ch);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  S: string;
begin
  S := 'Hello World';
  for var Ch: Char in S do
    Show(Ch);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
