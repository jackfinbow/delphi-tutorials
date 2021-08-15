program ClickCounter;

uses
  System.StartUpCopy,
  FMX.Forms,
  ClickCounterForm in 'ClickCounterForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
