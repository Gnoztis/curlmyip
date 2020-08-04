program curlmyip;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

var
    NetHTTPClient1: TNetHTTPClient;
    Response:IHTTPResponse;

begin

  NetHTTPClient1:= TNetHTTPClient.Create(nil);
  try
    try
        Response := NetHTTPClient1.Get('http://curlmyip.ru');
    except
      on E: Exception do
            Writeln(E.ClassName, ': ', E.Message);
    end;

     writeln(Response.ContentAsString);
  finally
    NetHTTPClient1.Free;
  end;

end.
