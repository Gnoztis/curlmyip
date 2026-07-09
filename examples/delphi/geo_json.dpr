program geo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.JSON;

var
  Client: TNetHTTPClient;
  Response: IHTTPResponse;
  Json: TJSONObject;
  IP: string;
  City, Country, TimeZone: string;
  Lat, Lon: Double;
  ASN: Integer;
  ASOrg: string;
begin
  Client := TNetHTTPClient.Create(nil);
  try
    try
      Response := Client.Get('https://curlmyip.ru/geo');
      if Response = nil then
      begin
        Writeln('Error: empty response');
        Exit;
      end;

      Json := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      if Json = nil then
      begin
        Writeln('Error: invalid JSON');
        Exit;
      end;

      try
        IP := Json.GetValue<string>('ip', 'N/A');

        City := Json.GetValue<string>('city.names.ru', 'N/A');
        if City = 'N/A' then
          City := Json.GetValue<string>('city.names.en', 'N/A');

        Country := Json.GetValue<string>('country.names.ru', 'N/A');
        if Country = 'N/A' then
          Country := Json.GetValue<string>('country.names.en', 'N/A');

        Lat := Json.GetValue<Double>('location.latitude', 0.0);
        Lon := Json.GetValue<Double>('location.longitude', 0.0);
        TimeZone := Json.GetValue<string>('location.time_zone', 'N/A');

        ASN := Json.GetValue<Integer>('autonomous_system_number', 0);
        ASOrg := Json.GetValue<string>('autonomous_system_organization', 'N/A');

        Writeln('--- Geo Data ---');
        Writeln('IP: ', IP);
        Writeln('City: ', City);
        Writeln('Country: ', Country);
        Writeln('Latitude: ', Lat:0:4);
        Writeln('Longitude: ', Lon:0:4);
        Writeln('Time Zone: ', TimeZone);
        Writeln('ASN: ', ASN);
        Writeln('AS Organization: ', ASOrg);
      finally
        Json.Free;
      end;

    except
      on E: Exception do
        Writeln('Error: ', E.Message);
    end;
  finally
    Client.Free;
  end;

  Readln; 
end.