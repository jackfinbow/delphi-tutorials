program Matrix;

uses
  System.StartUpCopy,
  FMX.Forms,
  MatrixForm in 'MatrixForm.pas' {Form1},
  MMatrix in '..\..\..\MMatrix.pas',
  mcomplex in '..\..\..\mcomplex.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
