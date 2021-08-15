program ConstructorOverloading;

uses
  System.StartUpCopy,
  FMX.Forms,
  ConstructorOverloadingForm in 'ConstructorOverloadingForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
