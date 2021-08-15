unit ClassesForm;

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
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{
 Class definition just includes declarations without implementations
 Shift+Ctrl+C when cursor is within class definition will auto-create method
  skeletons
 Shift+Ctrl+Up/Down arrows to navigate between method declarations and
  implementations
 Records (like structs) are passed by-value when assigning whilst classes are
  passed by-reference
}
type
  TDate = class
    FMonth, FDay, FYear: Integer;
    procedure SetValue(M, D, Y: Integer);
    function LeapYear: Boolean;
  end;

type
  THusband = class;

  TWife = class
    FHusband: THusband;
  end;

  THusband = class
    FWife: TWife;
  end;

{ TDate }

function TDate.LeapYear: Boolean;
begin
  // Call IsLeapYear in SysUtils.pas
  Result := IsLeapYear(FYear);
end;

procedure TDate.SetValue(M, D, Y: Integer);
begin
  FMonth := M;
  FDay := D;
  FYear := Y;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  // Reserves memory location
  ADay: TDate;
begin
  // Creates the class instance
  ADay := TDate.Create;

  // Use
  ADay.SetValue(1, 1, 2020);
  if ADay.LeapYear then
    Show('Leap year: ' + IntToStr(ADay.FYear));

  // Free the memory (for non ARC platforms)
  ADay.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
