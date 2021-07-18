unit InliningForm;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  System.Math, System.Diagnostics;

procedure Show(const Msg: string);
begin
  Form1.Show(Msg)
end;

const
  LoopCount = 20000000; // Twenty millions

{
 Inlining copies actual code of a function/procedure to the call location. This
 can save time as the compiler doesn't have to generate code to let the program
 jump to a new execution point,, particulaly if this function is called many
 times. However, if it's called from lots of different places, then the code can
 become bloated from unneccessarily copying extra code
}
{$INLINE ON}
procedure TForm1.Button1Click(Sender: TObject);
var
  SW: TStopWatch;
  I, J: Integer;
begin
  J := 0;
  SW := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    J := Max(I, J);
  SW.Stop;
  Show('Max on ' + J.ToString +
    ' [' + SW.ElapsedMilliseconds.ToString + '] ');
end;

{$INLINE OFF}
procedure TForm1.Button2Click(Sender: TObject);
var
  SW: TStopWatch;
  I, J: Integer;
begin
  J := 0;
  SW := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    J := Max(I, J);
  SW.Stop;
  Show('Max off ' + J.ToString +
    ' [' + SW.ElapsedMilliseconds.ToString + '] ');
end;

{$INLINE ON}

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
