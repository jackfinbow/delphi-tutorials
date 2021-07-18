program ProceduralTypes;

uses
  System.StartUpCopy,
  FMX.Forms,
  ProceduralTypesForm in 'ProceduralTypesForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
