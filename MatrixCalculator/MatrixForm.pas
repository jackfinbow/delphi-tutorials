unit MatrixForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, MMatrix, MComplex, Math,
  FMX.Menus, FMX.ListBox, FMX.Layouts, FMX.Edit;

type
  {TMatrixShape = record
    NumOfRows: Integer;
    NumOfCols: Integer;
  end;}

  TMatrixValues = array of Tcomplex;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ListBoxM1Rows: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBoxM1Cols: TListBox;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxM2Rows: TListBox;
    ListBoxM2Cols: TListBox;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    Label5: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowMatrix(Matrix: array of Tcomplex; Shape: TMatrixShape);
  end;

var
  Form1: TForm1;

function GenerateMatrix(Shape: TMatrixShape; MaxNumber: Integer): TMatrix;

function GetMatrixValues(Matrix: TMatrix; Shape: TMatrixShape): TMatrixValues;

implementation

{$R *.fmx}

var
  Matrix1, Matrix2: TMatrix;

function GenerateMatrix(Shape: TMatrixShape; MaxNumber: Integer): TMatrix;
var
  Matrix: TMatrix;
  ComplexNumber: Tcomplex;
  Row, Col: Integer;
begin
  // Create matrix of desired shape
  Matrix := TMatrix.create(Shape.NumOfRows, Shape.NumOfCols);

  // Propagate with numbers
  for Row := 1 to Shape.NumOfRows do
  begin
    for Col := 1 to Shape.NumOfCols do
    begin
      // Generate complex number with random real and imaginary parts
      with ComplexNumber do
      begin
        r := Random(MaxNumber) + 1;
        i := Random(MaxNumber) + 1;
      end;

      Matrix.setvalues(Row, Col, ComplexNumber);
    end;
  end;

  Result := Matrix
end;

function GetMatrixValues(Matrix: TMatrix; Shape: TMatrixShape): TMatrixValues;
var
  I: Integer;
  MatrixValues: TMatrixValues;
begin
  SetLength(MatrixValues, Shape.NumOfRows * Shape.NumOfCols);
  for I := Low(MatrixValues) to High(MatrixValues) do
    MatrixValues[I] := Matrix1.getvalues(Floor(I / Shape.NumOfRows) + 1, I mod Shape.NumOfCols + 1);

  Result := MatrixValues;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  MatrixShape: TMatrixShape;
  MatrixValues: TMatrixValues;
begin
  with MatrixShape do
  begin
    if ListBoxM1Rows.ItemIndex > -1 then
      NumOfRows := ListBoxM1Rows.ItemIndex + 1;
    if ListBoxM1Cols.ItemIndex > -1 then
      NumOfCols := ListBoxM1Cols.ItemIndex + 1;
  end;

  Matrix1 := GenerateMatrix(MatrixShape, 10);

  MatrixValues := GetMatrixValues(Matrix1, MatrixShape);

  Memo1.Lines.Add('Matrix 1');
  ShowMatrix(MatrixValues, MatrixShape);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
  MatrixShape: TMatrixShape;
  MatrixValues: TMatrixValues;
begin
  with MatrixShape do
  begin
    if ListBoxM2Rows.ItemIndex > -1 then
      NumOfRows := ListBoxM2Rows.ItemIndex + 1;
    if ListBoxM2Cols.ItemIndex > -1 then
      NumOfCols := ListBoxM2Cols.ItemIndex + 1;
  end;

  Matrix2 := GenerateMatrix(MatrixShape, 10);

  MatrixValues := GetMatrixValues(Matrix2, MatrixShape);

  Memo1.Lines.Add('Matrix 2');
  ShowMatrix(MatrixValues, MatrixShape);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  AddedMatrix: TMatrix;
  MatrixShape: TMatrixShape;
  MatrixValues: TMatrixValues;
begin
  AddedMatrix := AddMatrix(Matrix1, Matrix2);

  Memo1.Lines.Add('Resulting matrix after addition');
  MatrixShape := AddedMatrix.GetShape;
  MatrixValues := GetMatrixValues(AddedMatrix, MatrixShape);
  ShowMatrix(MatrixValues, MatrixShape);
end;

procedure TForm1.ShowMatrix(Matrix: array of Tcomplex; Shape: TMatrixShape);
var
  Row, Col, I: Integer;
  Line: string;
begin
  I := Low(Matrix);

  Memo1.Lines.Add('------------------');
  for Row := 1 to Shape.NumOfRows do
  begin
    Line := '| ';

    for Col := 1 to Shape.NumOfCols do
    begin
      Line := Line + IntToStr(Floor(Matrix[I].r)) + '+' + IntToStr(Floor(Matrix[I].i)) + 'i | ';

      I := I + 1;
    end;

    if I > Length(Matrix) then
      ShowMessage('Matrix index out of bounds');

    Memo1.Lines.Add(Line);
  end;

  Memo1.Lines.Add('------------------');
end;

end.
