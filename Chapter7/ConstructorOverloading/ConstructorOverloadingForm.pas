unit ConstructorOverloadingForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
 DateUtils;

type
  TDate = class
  private
    FDate: TDateTime;
  public
    constructor Create; overload;
    constructor Create(Month, Day, Year: Integer); overload;
    procedure SetValue(Month, Day, Year: Integer); overload;
    procedure SetValue(NewDate: TDateTime); overload;
    function LeapYear: Boolean;
    function GetText: string;
    procedure Increase(NumberOfDays: Integer = 1);
    procedure Decrease(NumberOfDays: Integer = 1);
  end;

{ TDate }

constructor TDate.Create;
begin
  FDate := Today;
end;

constructor TDate.Create(Month, Day, Year: Integer);
begin
  FDate := EncodeDate(Year, Month, Day);
end;

function TDate.GetText: string;
begin
  Result := DateToStr(FDate);
end;

procedure TDate.Increase(NumberOfDays: Integer = 1);
begin
  FDate := FDate + NumberOfDays;
end;

procedure TDate.Decrease(NumberOfDays: Integer = 1);
begin
  FDate := FDate - NumberOfDays;
end;

function TDate.LeapYear: Boolean;
begin
  // Call IsLeapYear in SysUtils and YearOf in DateUtils
  Result := IsLeapYear(YearOf(FDate));
end;

procedure TDate.SetValue(NewDate: TDateTime);
begin
  FDate := NewDate;
end;

procedure TDate.SetValue(Month, Day, Year: Integer);
begin
  FDate := EncodeDate(Year, Month, Day);
end;

end.
