unit RecordsMethodsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// records in Object Pascal can have procedures and functions attached
// Ctrl+Shift+C will auto create all methods within given record

type
  TMyRecord = record
  private
    FName: string;
    FValue: Integer;
    FSomeChar: Char;
  public
    function ToString: string;
    procedure SetValue(NewString: string);
    procedure Init(NewValue: Integer);
  end;

type
  TMyNewRecord = record
  private
    FName: string;
    FValue: Integer;
    FSomeChar: Char;
  public
    constructor Create(NewString: string);
    function ToString: string;
    procedure SetValue(NewString: string);
    procedure Init(NewValue: Integer);
  end;

{ TMyRecord }

procedure TMyRecord.Init(NewValue: Integer);
begin
  FValue := NewValue;
  FSomeChar := 'A';
end;

procedure TMyRecord.SetValue(NewString: string);
begin
  // actually Self.Fname using Python style 'self' (or 'this' in Java)
  FName := NewString;
end;

function TMyRecord.ToString: string;
begin
  Result := FName + ' [' + FSomeChar + ']: ' + FValue.ToString;
end;

{ TMyNewRecord }

constructor TMyNewRecord.Create(NewString: string);
begin
  FName := NewString;
  Init(0);
end;

procedure TMyNewRecord.Init(NewValue: Integer);
begin
  FValue := NewValue;
  FSomeChar := 'A';
end;

procedure TMyNewRecord.SetValue(NewString: string);
begin
  FName := NewString;
end;

function TMyNewRecord.ToString: string;
begin
  Result := FName + ' [' + FSomeChar + ']: ' + FValue.ToString;
end;

{ Buttons }

procedure TForm1.Button1Click(Sender: TObject);
var
  MyRec: TMyRecord;
begin
  MyRec.Init(10);
  MyRec.SetValue('hello');
  Show(MyRec.ToString);
  MyRec.FValue := 20; // Actually works!
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  MyRec: TMyRecord;
begin
  // records are only initialised when defined globally, not locally
  Show(MyRec.ToString);
end;

// record constructors
procedure TForm1.Button3Click(Sender: TObject);
var
  MyRec, MyRec2: TMyNewRecord;
begin
  MyRec := TMyNewRecord.Create('Myself');
  MyRec2.Create('Myself');

  Show(MyRec.ToString);
  Show(MyRec2.ToString);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
