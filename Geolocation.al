// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50110 Geolocation extends "Customer List"
{
    trigger OnOpenPage();
    var
        Geolocation: Codeunit Geolocation;
        Latitude: Decimal;
        Longitude: Decimal;

    begin
        Geolocation.SetHighAccuracy(true);
        if Geolocation.RequestGeolocation() then
            Geolocation.GetGeolocation(Latitude, Longitude);

        Message('Latitude %1, Longitude %2', Latitude, Longitude);
    end;
}