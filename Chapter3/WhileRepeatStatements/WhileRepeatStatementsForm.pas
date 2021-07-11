unit WhileRepeatStatementsForm;

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

procedure TForm1.Button1Click(Sender: TObject);
var
  I, J: Integer;
begin
  // while-do loop
  I := 0;
  J := 0;

  while (I <= 100) and (J <= 100) do
    begin
      I := I + 1;
      J := J + 2;
    end;

  Show('I ' + IntToStr(I) + ', J ' + IntToStr(J));

  // repeat-until loop (similar to do-while in other languages)
  I := 0;
  J := 0;

  repeat
    I := I + 1;
    J := J + 2;
  until (I > 100) or (J > 100);

  Show('I ' + IntToStr(I) + ', J ' + IntToStr(J));

  // repeat-until loop (similar to do-while in other languages)
  I := 0;
  J := 0;

  repeat
    I := I + 1;
    J := J + 2;
  until (I > 100) and (J > 100);

  Show('I ' + IntToStr(I) + ', J ' + IntToStr(J));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  I := 1;

  while I <= 20 do
    begin
      Show('I ' + IntToStr(I));
      // Increment I by 2
      Inc(I, 2);
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
begin
  // Calling Randomize will use different random numbers each time (like seed?)
  Randomize;
  I := 1;

  while I < 500 do
    begin
      Show('Random number ' + IntToStr(I));
      Inc(I, Random(100));
    end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
