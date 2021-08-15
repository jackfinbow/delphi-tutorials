unit ConstructorsDestructorsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
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

uses
 DateUtils;

{
 Object Pascal allows custom-named constructors, allowing overloading of
   constructors
}

type
  TDate = class
  private
    FDate: TDateTime;
  public
    constructor Create;
    constructor CreateFromValues(m, d, y: Integer);
    procedure SetValue(m, d, y: Integer);
    function LeapYear: Boolean;
    function GetText: string;
    procedure Increase;
  end;

{ TDate }

constructor TDate.Create;
begin
  FDate := Today;
end;

constructor TDate.CreateFromValues(m, d, y: Integer);
begin
  SetValue(m, d, y);
end;

function TDate.GetText: string;
begin
  Result := DateToStr(FDate);
end;

procedure TDate.Increase;
begin
  FDate := FDate + 1;
end;

function TDate.LeapYear: Boolean;
begin
  // Call IsLeapYear in SysUtils and YearOf in DateUtils
  Result := IsLeapYear(YearOf(FDate));
end;

procedure TDate.SetValue(m, d, y: Integer);
begin
  FDate := EncodeDate(y, m, d);
end;

// Class demonstrating destructors and resource management

type
  TPerson = class
  private
    FName: string;
    FBirthDate: TDate;
  public
    constructor Create(name: string);
    // unlike constructor, destructor is virtual so is overridden
    // calling instance.Free will automatically call Destroy too if it exists
    destructor Destroy; override;
    // Some actual methods
    function Info: string;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ADay: TDate;
begin
  // Create
  ADay := TDate.Create; // today

  // use
  ADay.Increase;

  if ADay.LeapYear then
    Show('Leap year: ' + ADay.GetText)
  else
    Show('Not a leap year: ' + ADay.GetText);

  // Free the memory
  ADay.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ADay: TDate;
begin
  // Create
  ADay := TDate.CreateFromValues(1, 1, 2020);

  // Use
  ADay.Increase;

  if ADay.LeapYear then
    Show('Leap year: ' + ADay.GetText);

  // Free the memory
  ADay.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Person: TPerson;
begin
  Person := TPerson.Create ('Jack');
  // use the class and its internal object
  Show (Person.Info);
  Person.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TPerson }

constructor TPerson.Create(name: string);
begin
  FName := Name;
  FBirthDate := TDate.Create;
end;

destructor TPerson.Destroy;
begin
  // destructor must free instance of TDate class too
  FBirthDate.Free;
  inherited;
end;

function TPerson.Info: string;
begin
  Result := FName + ': ' + FBirthDate.GetText;
end;

end.
