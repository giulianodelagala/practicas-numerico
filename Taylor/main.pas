unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls,
  class_taylor;

type

  { TForm1 }

  TForm1 = class(TForm)
    ClearButton: TButton;
    CosButton: TButton;
    LnButton: TButton;
    ArcSinButton: TButton;
    arctanButton: TButton;
    expButton: TButton;
    SinButton: TButton;
    EditError: TEdit;
    EditX: TEdit;
    Angulo: TLabel;
    Error: TLabel;
    memResult: TMemo;
    procedure ArcSinButtonClick(Sender: TObject);
    procedure arctanButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure CosButtonClick(Sender: TObject);
    procedure expButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LnButtonClick(Sender: TObject);
    procedure SinButtonClick(Sender: TObject);

  private

  public



  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SinButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
  Taylor:= TTaylor.create();
  Taylor.Error:=StrToFloat(EditError.Text);
  Taylor.x:= StrToFloat(EditX.Text);
  memResult.Lines.Add('Sen(' + EditX.Text + ')=' + FloatToStr(Taylor.seno()) );
  Taylor.Destroy;
end;

procedure TForm1.CosButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
   Taylor:= TTaylor.create();
   Taylor.Error:=StrToFloat(EditError.Text);
   Taylor.x:= StrToFloat(EditX.Text);
   memResult.Lines.Add('Cos(' + EditX.Text + ')=' + FloatToStr(Taylor.coseno()) );
   Taylor.Destroy;
end;

procedure TForm1.expButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
   Taylor:= TTaylor.create();
   Taylor.Error:=StrToFloat(EditError.Text);
   Taylor.x:= StrToFloat(EditX.Text);
   memResult.Lines.Add('exp(' + EditX.Text + ')=' + FloatToStr(Taylor.exp()) );
   Taylor.Destroy;
end;

procedure TForm1.LnButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
   Taylor:= TTaylor.create();
   Taylor.Error:=StrToFloat(EditError.Text);
   Taylor.x:= StrToFloat(EditX.Text);
   memResult.Lines.Add('ln(' + EditX.Text + ')=' + FloatToStr(Taylor.logn()) );
   Taylor.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memResult.Clear;
end;



procedure TForm1.ClearButtonClick(Sender: TObject);
begin
   memResult.Clear;
end;

procedure TForm1.ArcSinButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
   Taylor:= TTaylor.create();
   Taylor.Error:=StrToFloat(EditError.Text);
   Taylor.x:= StrToFloat(EditX.Text);
   memResult.Lines.Add('ArcSeno(' + EditX.Text + ')=' + FloatToStr(Taylor.arcseno()) );
   Taylor.Destroy;

end;

procedure TForm1.arctanButtonClick(Sender: TObject);
var
  Taylor:TTaylor;
begin
   Taylor:= TTaylor.create();
   Taylor.Error:=StrToFloat(EditError.Text);
   Taylor.x:= StrToFloat(EditX.Text);
   memResult.Lines.Add('ArcTan(' + EditX.Text + ')=' + FloatToStr(Taylor.arctan()) );
   Taylor.Destroy;
end;







end.

