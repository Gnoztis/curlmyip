program geo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.HttpClientComponent;

var
  Client: TNetHTTPClient;
  Response: IHTTPResponse;

begin
  Client := TNetHTTPClient.Create(nil);
  try
    try
      Response := Client.Get('https://curlmyip.ru/geo');
      if Response <> nil then
        Writeln(Response.ContentAsString)
      else
        Writeln('Error: empty response');
    except
      on E: Exception do
        Writeln('Error: ', E.Message);
    end;
  finally
    Client.Free;
  end;
end.