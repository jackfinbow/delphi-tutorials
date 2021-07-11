program ForLoops;

uses
  System.StartUpCopy,
  FMX.Forms,
  ForLoopsForm in 'ForLoopsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
