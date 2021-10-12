unit TitleBarStatic;

interface

{$mode objfpc}{$H+}

uses
  Windows,
  Forms,
  Graphics,
  Dialogs;

procedure FormTest(frm: TForm);
function DwmSetWindowAttribute(hwnd: HWND; dwAttribute: DWORD; pvAttribute: Pointer; cbAttribute: DWORD): HRESULT; stdcall; external 'dwmapi.dll';

implementation

procedure FormTest(frm: TForm);
const
  DWMWA_USE_IMMERSIVE_DARK_MODE_BEFORE_20H1: Integer = 19;
  DWMWA_USE_IMMERSIVE_DARK_MODE: Integer = 20;

const isDarkMode: bool = true;
begin
  DwmSetWindowAttribute(frm.Handle, DWMWA_USE_IMMERSIVE_DARK_MODE, @isDarkMode, sizeof(isDarkMode));
end;

end.
