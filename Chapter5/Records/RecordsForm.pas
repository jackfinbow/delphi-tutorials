unit RecordsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
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

// this like a struct in C
type
  TMyDate = record
    FYear: Integer;
    FMonth: Byte;
    FDay: Byte;
  end;

function MyDateToString(MyDate: TMyDate): string;
begin
  Result := MyDate.FYear.ToString + '.' +
    MyDate.FMonth.ToString + '.' +
    MyDate.FDay.ToString;
end;

procedure IncreaseYear(var MyDate: TMyDate);
begin
  Inc(MyDate.FYear);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  BirthDay: TMyDate;
begin
  BirthDay.FYear := 1998;
  BirthDay.FMonth := 6;
  BirthDay.FDay := 23;

  Show('Born in year ' + BirthDay.FYear.ToString);
  Show('Record size is ' + SizeOf(BirthDay).ToString);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  ADay: TMyDate;
begin
  ADay.FYear := 2016;
  ADay.FMonth := 3;
  ADay.FDay := 18;

  IncreaseYear(ADay);
  Show(MyDateToString(ADay));
end;

// arrays of records
procedure TForm1.Button3Click(Sender: TObject);
var
  DatesList: array of TMyDate;
  I: Integer;
begin
  // Allocate array elements
  SetLength(DatesList, 5);

  // Assign random values
  for I := Low(DatesList) to High(DatesList) do
  begin
    DatesList[I].FYear := 2000 + Random(50);
    DatesList[I].FMonth := 1 + Random(12);
    DatesList[I].FDay := 1 + Random(27);
  end;

  // Display the values
  for I := Low(DatesList) to High(DatesList) do
    Show(I.ToString + ': ' + MyDateToString(DatesList[I]));
end;

end.
