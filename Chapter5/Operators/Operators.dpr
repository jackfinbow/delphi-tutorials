program Operators;

uses
  System.StartUpCopy,
  FMX.Forms,
  OperatorsForm in 'OperatorsForm.pas' {Form1},
  OperatorTypes in 'OperatorTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
