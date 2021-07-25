unit OperatorsForm;

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

// include additional unit
uses
  OperatorTypes;

procedure TForm1.Button1Click(Sender: TObject);
var
  A, B, C: TPointRecord;
begin
  A.SetValue(10, 10);
  B := 30;
  C := A + B;
  Show(string(C));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  A: TPointRecord2;
begin
  A.SetValue(10, 20);
  // 1st implementation of add
  A := A + 10;
  // 2nd implementation of add
  A := 30 + A;
  Show(string(A));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
