program MiniSize;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Windows,
  System.SysUtils;

var
   nSize: Integer;
   hFile: THandle;
   strSize: string;

begin
  try
    hFile := CreateFile(PChar (ParamStr(0)),
     0, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
    nSize := GetFileSize(hFile, nil);
    CloseHandle(hFile);

    // copy the size and show it
    SetLength(strSize, 20);
    Str(nSize, strSize);
    MessageBox(0, PChar (strSize), 'Mini Program', MB_OK);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
