unit DynamicArraysForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
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
{
 Dynamic arrays are reference counted, making parameter passing faster and
 meaning that setting an array to nil or length zero will automatically free the
 memory.

 Contrastingly to static array, an array type can be declared without specifying
 number of elements and then size of array is allocated when declaring.

 Unlike static arrays, dynamic arrays do not support non-zero initial index, or
 non-integer indices. -> Low(DynArray) = 0 and
 High(DynArray) = Length(DynArray) - 1
}

type
  TIntegersArray = array of Integer;

var
  IntArray1: TIntegersArray;

procedure TForm1.Button1Click(Sender: TObject);
var
  Array1: array of Integer;
begin
  // Would cause a runtime Range Check error
  // Array1[1] := 100;
  SetLength(Array1, 10);
  Array1[1] := 100; // This is OK
  Show(Array1[1].ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  SetLength(IntArray1, 20);
  for I := Low(IntArray1) to High(IntArray1) do
    IntArray1[I] := I;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
  Total: Integer;
begin
  Total := 0;
  for I := Low(IntArray1) to High(IntArray1) do
  begin
    Inc(Total, IntArray1[I]);
    Show(I.ToString + ': ' + IntArray1[I].ToString);
  end;
  Show('Average: ' + (Total / Length(IntArray1)).ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  IntArray2: TIntegersArray;
  IntArray3: TIntegersArray;
begin
  // alias -> new array refers to same place in memory
  IntArray2 := IntArray1;

  // separate copy -> new array and separate memory area
  IntArray3 := Copy(IntArray1, Low(IntArray1), Length(IntArray1));

  // modify items
  IntArray2[1] := 100;
  IntArray3[2] := 100;

  // check values for each array
  Show(Format('[%d] %d -- %d -- %d',
    [1, IntArray1 [1], IntArray2[1], IntArray3[1]]));
  Show(Format('[%d] %d -- %d -- %d',
    [2, IntArray1 [2], IntArray2[2], IntArray3[2]]));
end;

{
 Can also initialise without specifying length as long as it's not a specific
 index:
 e.g. DI: array of Integers;
 DI := [1, 2, 3];
 DI := DI + DI;
}

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
