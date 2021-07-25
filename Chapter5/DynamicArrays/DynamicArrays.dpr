program DynamicArrays;

uses
  System.StartUpCopy,
  FMX.Forms,
  DynamicArraysForm in 'DynamicArraysForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
