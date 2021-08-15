program Classes;

uses
  System.StartUpCopy,
  FMX.Forms,
  ClassForm in 'ClassForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
