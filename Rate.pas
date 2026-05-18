unit Rate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TRateForm = class(TForm)
    RateEdit: TEdit;
    RateOk: TBitBtn;
    RateCancel: TBitBtn;
    ButtonMinRate: TButton;
    ButtonMaxRate: TButton;
    Label1: TLabel;
    RateTrackBar: TTrackBar;
    UpDown1: TUpDown;
    procedure FormActivate(Sender: TObject);
    procedure ButtonMinRateClick(Sender: TObject);
    procedure RateEditKeyPress(Sender: TObject; var Key: Char);
    procedure RateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonMaxRateClick(Sender: TObject);
    procedure RateTrackBarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RateForm: TRateForm;

implementation

{$R *.dfm}

uses main;


procedure TRateForm.ButtonMaxRateClick(Sender: TObject);
var
  txt:  string;
begin
  RateEdit.Text:='3600';
  FormActivate(sender);
  txt:='P'+inttohex(strtoint(RateEdit.Text),4)+#13;
  try mainform.ComPort.WriteStr(txt) ; except  end;
end;

procedure TRateForm.ButtonMinRateClick(Sender: TObject);
var
  txt:  string;
begin
  RateEdit.Text:='0';
  FormActivate(sender);
  txt:='P'+inttohex(strtoint(RateEdit.Text),4)+#13;
  try mainform.ComPort.WriteStr(txt) ; except  end;
end;

procedure TRateForm.FormActivate(Sender: TObject);
begin
  Rateform.Top:=mainform.Top+round((mainform.Height-Rateform.Height)/2);
  Rateform.Left:=mainform.Left+round((mainform.Width-Rateform.Width)/2);

  RateEdit.SelStart:=0;
  RateEdit.SelLength:=Length(RateEdit.Text);
  RateEdit.SetFocus;
end;


procedure TRateForm.FormShow(Sender: TObject);
begin
  RateEdit.Text:=inttostr(RecvDataNew.Rate);
  RateTrackBar.Position:=(RecvDataNew.Rate);
end;

procedure TRateForm.RateEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt) in Shift then
  begin
    case Key of
      ord('Z'):ButtonMinRateClick(Self);
      ord('X'):ButtonMaxRateClick(Self);
      ord('S'):
        begin
          RateTrackBar.Position:=Round(RateTrackBar.Position/100)*100 + RateTrackBar.PageSize;
        end;
      ord('A'):
        begin
          RateTrackBar.Position:=RateTrackBar.Position - RateTrackBar.PageSize;
        end;
    end;

  end;
end;

procedure TRateForm.RateEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', #8]) then Key:=#0
  else
  if (Sender as TEdit).SelLength>=4 then (Sender as TEdit).Clear;
  if (length((Sender as TEdit).Text)>=4)and(Key<>#8) then Key:=#0;
end;

procedure TRateForm.RateTrackBarChange(Sender: TObject);
begin
  RateTrackBar.Position:=Round(RateTrackBar.Position/100)*100;
  RateEdit.Text:=inttostr(RateTrackBar.Position);
end;

end.
