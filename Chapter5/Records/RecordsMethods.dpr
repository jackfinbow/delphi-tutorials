program RecordsMethods;

uses
  System.StartUpCopy,
  FMX.Forms,
  RecordsMethodsForm in 'RecordsMethodsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
