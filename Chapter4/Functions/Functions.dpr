program Functions;

uses
  System.StartUpCopy,
  FMX.Forms,
  FunctionsForm in 'FunctionsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
