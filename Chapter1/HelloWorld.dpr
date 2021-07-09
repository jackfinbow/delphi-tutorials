program HelloWorld;

uses
  System.StartUpCopy,
  FMX.Forms,
  HelloWorldForm in 'HelloWorldForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
