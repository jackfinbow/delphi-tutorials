program Parameters;

uses
  System.StartUpCopy,
  FMX.Forms,
  ParametersForm in 'ParametersForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
