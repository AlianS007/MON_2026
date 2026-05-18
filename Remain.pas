unit Remain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Math;

type
  TRemainForm = class(TForm)
    RemainEdit: TEdit;
    RemainOk: TBitBtn;
    RemainCancel: TBitBtn;
    ButtonMinRemain: TButton;
    ButtonMaxRemain: TButton;
    Label1: TLabel;
    RemainTrackBar: TTrackBar;
    UpDown1: TUpDown;
    procedure FormActivate(Sender: TObject);
    procedure ButtonMinRemainClick(Sender: TObject);
    procedure RemainEditKeyPress(Sender: TObject; var Key: Char);
    procedure RemainEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonMaxRemainClick(Sender: TObject);
    procedure RemainCancelClick(Sender: TObject);
    procedure RemainTrackBarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RemainForm: TRemainForm;

implementation

{$R *.dfm}

uses main;


procedure TRemainForm.ButtonMaxRemainClick(Sender: TObject);
var
  txt:  string;
begin
  RemainEdit.Text:='20000';
  FormActivate(sender);
  txt:='V'+inttohex(strtoint(RemainEdit.Text),5)+#13;
  try mainform.ComPort.WriteStr(txt) ; except  end;
end;

procedure TRemainForm.ButtonMinRemainClick(Sender: TObject);
var
  txt:  string;
begin
  RemainEdit.Text:='0';
  FormActivate(sender);
  txt:='V'+inttohex(strtoint(RemainEdit.Text),4)+#13;
  try mainform.ComPort.WriteStr(txt) ; except  end;
end;

procedure TRemainForm.FormActivate(Sender: TObject);
begin
  Remainform.Top:=mainform.Top+round((mainform.Height-Remainform.Height)/2);
  Remainform.Left:=mainform.Left+round((mainform.Width-Remainform.Width)/2);
  RemainEdit.SelStart:=0;
  RemainEdit.SelLength:=Length(RemainEdit.Text);
  RemainEdit.SetFocus;
end;


procedure TRemainForm.FormShow(Sender: TObject);
begin
  RemainTrackBar.Position:=(RecvDataNew.Dose);
  RemainEdit.Text:=inttostr(RecvDataNew.Dose);
end;

procedure TRemainForm.RemainCancelClick(Sender: TObject);
begin
//
end;

procedure TRemainForm.RemainEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt) in Shift then
  begin
    case Key of
      ord('Z'):ButtonMinRemainClick(Self);
      ord('X'):ButtonMaxRemainClick(Self);
      ord('S'):
        begin
          RemainTrackBar.Position:=RemainTrackBar.Position + RemainTrackBar.PageSize;
        end;
      ord('A'):
        begin
          RemainTrackBar.Position:=RemainTrackBar.Position - RemainTrackBar.PageSize;
        end;
    end;

  end;
end;

procedure TRemainForm.RemainEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', #8]) then Key:=#0
  else
  if (Sender as TEdit).SelLength>=5 then (Sender as TEdit).Clear;
  if (length((Sender as TEdit).Text)>=5)and(Key<>#8) then Key:=#0;
end;

procedure TRemainForm.RemainTrackBarChange(Sender: TObject);
begin
  RemainTrackBar.Position:=Round(RemainTrackBar.Position/100)*100;
  RemainEdit.Text:=inttostr(RemainTrackBar.Position);
end;

end.
