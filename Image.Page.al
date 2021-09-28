pageextension 50111 Image extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {
            action(Image)
            {
                ApplicationArea = All;
                Caption = 'Image';
                Image = Picture;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Image: Codeunit Image;
                    TempBlob: Codeunit "Temp Blob";
                    SourceStream: InStream;
                    OStream: OutStream;
                    IStream: InStream;
                    Filename: Text;
                begin
                    TempBlob.CreateInStream(SourceStream);
                    UploadIntoStream('All files (*.*)|*.*', SourceStream);
                    Image.FromStream(SourceStream);
                    //Image.Resize(Image.GetWidth() / 2, Image.GetHeight() / 2);
                    Image.Crop(50, 50, Image.GetWidth() / 2, Image.GetHeight() / 2);
                    TempBlob.CreateOutStream(OStream);
                    Image.Save(OStream);
                    TempBlob.CreateInStream(IStream);
                    Filename := 'Test.jpg';
                    DownloadFromStream(IStream, '', '', '', Filename);
                end;
            }
        }
    }
}