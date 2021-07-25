unit RecordsWithForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TMyDate = packed record
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
  // can use with keyword to save having to precede each field with BirthDay.
  with BirthDay do
  begin
    FYear := 1997;
    FMonth := 2;
    FDay := 14;
    Show('Born in year ' + FYear.ToString);
  end;

  Show('Record size is ' + SizeOf(BirthDay).ToString);
end;

end.
