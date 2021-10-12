unit TitleBar;

interface

{$mode objfpc}{$H+}

uses
  Windows,
  Forms,
  Graphics,
  Dialogs,
  LCLExceptionStackTrace;

procedure FormTest(frm: TForm);

implementation

procedure FormTest(frm: TForm);
const
  DWMWA_USE_IMMERSIVE_DARK_MODE_BEFORE_20H1: Integer = 19;
  DWMWA_USE_IMMERSIVE_DARK_MODE: Integer = 20;
type
  TDwmSetWindowAttribute = function(hwnd: HWND; dwAttribute: DWORD; pvAttribute: Pointer; cbAttribute: DWORD): HRESULT; stdcall;

var
  hDWMDLL: Cardinal;
  DwmSetWindowAttribute: TDwmSetWindowAttribute;
  const isDarkMode: bool = true;
begin
  try
    hDWMDLL := LoadLibrary(PChar('dwmapi.dll'));

    if hDWMDLL <> 0 then
    begin
      Pointer(DwmSetWindowAttribute) := GetProcAddress(hDWMDLL, 'DwmSetWindowAttribute');

      if (@DwmSetWindowAttribute <> nil) then
      begin

        try
          DwmSetWindowAttribute(frm.Handle, DWMWA_USE_IMMERSIVE_DARK_MODE, @isDarkMode, sizeof(isDarkMode));
        except
            ShowMessage('mmm');
        end;
      end;
    end;
  finally
    FreeLibrary(hDWMDLL);
  end;
end;

end.
