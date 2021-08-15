program ButtonCreater;

uses
  System.StartUpCopy,
  FMX.Forms,
  ButtonCreaterForm in 'ButtonCreaterForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
