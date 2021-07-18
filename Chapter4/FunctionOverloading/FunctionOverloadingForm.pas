unit FunctionOverloadingForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls;

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

{
 Function overloading allows the definition of the same function name with
 different implementations depending on the types of parameters passed to it

 e.g.
 function Min(A,B: Integer): Integer; overload;
 function Min(A,B: Int64): Int64; overload;
 function Min(A,B: Single): Single; overload;
 function Min(A,B: Double): Double; overload;
 function Min(A,B: Extended): Extended; overload;
}

uses
  System.Math;

procedure Show(Msg: string);
begin
  Form1.Show(Msg)
end;

procedure ShowMsg(Str: string); overload;
begin
  Show('Message: ' + Str);
end;

procedure ShowMsg (FormatStr: string;
  Params: array of const); overload;
begin
  Show('Message: ' + Format(FormatStr, Params));
end;

procedure ShowMsg(I: Integer; Str: string); overload;
begin
  ShowMsg(I.ToString + ' ' + Str);
end;

{
 Ambiguous overloading: Add(10, 10) could apply to either case because an
 integer can be accepted when a float is expected for example.
 Use Add(10, 10.ToSingle) for example instead
}
function Add(N: Integer; S: Single): Single; overload;
begin
  Result := N + S;
end;

function Add(S: Single; N: Integer): Single; overload;
begin
  Result := N + S;
end;

{
 Similar to Python etc where default values are specified in arguments and are
 used if not mentioned in the function call
}
procedure NewMessage(Msg: string; Caption: string = 'Message';
  Separator: string = ': '); overload;
begin
  Show(Caption + Separator + Msg);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMsg('Hello');
  ShowMsg('Total = %d.', [100]);
  ShowMsg(10, 'MBytes');
  // ShowMsg(10.0, 'Hello');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Show(Add(10, 10.0).ToString);
  Show(Add(10.0, 10).ToString);
  // Show(Add(10, 10).ToString); // Ambiguous call
  Show(Add(10, 10.ToSingle).ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NewMessage('Something wrong here!');
  NewMessage('Something wrong here!', 'Attention');
  NewMessage('Hello', 'Message', '--');
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
