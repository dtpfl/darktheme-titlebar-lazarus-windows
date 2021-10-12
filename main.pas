unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TitleBar;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  inherited;
  self.Color:=RGBToColor(34,40,49);
  self.Font.Color:=RGBToColor(221, 221, 221);

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  FormTest(Form1);
end;

end.

