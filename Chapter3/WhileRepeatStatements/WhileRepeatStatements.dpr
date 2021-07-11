program WhileRepeatStatements;

uses
  System.StartUpCopy,
  FMX.Forms,
  WhileRepeatStatementsForm in 'WhileRepeatStatementsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
