unit TypesExpressionsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, typinfo;

type
  // this all relates to class TForm1
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    type
      TSuit = (Club, Diamond, Heart, Spade);
      Tsuits = set of TSuit;
    procedure Show(const Msg: string);
    //function SetToStr(ASet: TSuits): string;
  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}

// define a custom function
{function TForm1.SetToStr(ASet: Tsuits): string;
const
  names : array [TSuit] of String[4] = ('Club', 'Diamond', 'Heart', 'Spade');
var
  s: string;
  //element: TSuit;
  //i, j: Integer;
  Infs: PTypeInfo;
begin
  //s := ' ';
  //SetToStr := ASet[0];
  for i := 0 to 2 do
    for j := 0 to 4 do
      if names[j] in ASet then
        str := str + names[j]
  Infs := TypeInfo(ASet);
  s := SetToStr(Infs, LongInt(ASet));

end;}

procedure TForm1.Button1Click(Sender: TObject);
var
  Cards1: TSuits;
begin
  Show(IntToStr(20 * 5));
  // Adding True displays "True" or "False" rather than "-1" or "0"
  Show(BoolToStr(3 < 30, True));

  Cards1 := [Club];
  // could also use Exclude(Cards1, Club) etc
  Cards1 := Cards1 + [Diamond, Heart] - [Club];
  //Show(SetToStr(Cards1));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
