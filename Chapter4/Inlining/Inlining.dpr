program Inlining;

uses
  System.StartUpCopy,
  FMX.Forms,
  InliningForm in 'InliningForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
