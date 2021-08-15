unit ClassForm;

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
    procedure Show(const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
 DateUtils;

{
 Public = fields/methods can be accessed from anywhere else in program
 Protected = limited visibility so that they can only be accessed from current
   or derived classes
 Private = cannot be accessed from any class in another unit (but can from other
   classe within the same unit)
   Use 'strict private' to protect from other classes in the same unit
}

type
  TDate = class
  private
    FDate: TDateTime;
  public
    procedure SetValue(M, D, Y: Integer);
    function LeapYear: Boolean;
    function GetText: string;
    procedure Increase;
  end;

{ TDate }

function TDate.GetText: string;
begin
  Result := DateToStr(FDate);
end;

procedure TDate.Increase;
var
  OldDate: TDateTime;
begin
  OldDate := FDate;
  FDate := FDate + 1;

  Form1.Show('Date increased from ' + DateToStr(OldDate) + ' to ' + GetText);
end;

function TDate.LeapYear: Boolean;
begin
  Result := IsLeapYear(YearOf(FDate));
end;

procedure TDate.SetValue(M, D, Y: Integer);
begin
  FDate := EncodeDate(Y, M, D);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ADay: TDate;
begin
  // Create
  ADay := TDate.Create;

  // Use
  ADay.SetValue(1, 1, 2020);
  ADay.Increase;

  if ADay.LeapYear then
    Show('Leap year: ' + ADay.GetText);

  // Free the memory (for non ARC platforms)
  ADay.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
