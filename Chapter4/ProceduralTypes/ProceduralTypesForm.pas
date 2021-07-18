unit ProceduralTypesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
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
  // proceduraly type, specifying parameters and return type (if function)
  // this type is compatible with any routine with same parameters etc
  TIntProc = procedure(var Num: Integer);

// this procedure is of the same type as TIntProc
procedure DoubleTheValue(var Value: Integer);
begin
  Value := Value * 2;
end;

procedure TripleTheValue(var Value: Integer);
begin
  Value := Value * 3;
end;

var
  IntProc: TIntProc = DoubleTheValue;
  Value: Integer = 1;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Value is passed to IntProc (of type TIntProc, initialised as DoubleTheValue)
  // rather than DoubleTheValue directly
  IntProc(Value);
  Show(Value.ToString);
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.IsChecked then
    IntProc := TripleTheValue
  else
    IntProc := DoubleTheValue;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
