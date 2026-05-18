unit Regulator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TRegulatorForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RegulatorOk: TBitBtn;
    RegulatorCancel: TBitBtn;
    BitBtnApply: TBitBtn;
    TargetEdit: TEdit;
    ButtonM0: TButton;
    ButtonM1: TButton;
    ButtonM2: TButton;
    ButtonM3: TButton;
    ButtonM4: TButton;
    ButtonM5: TButton;
    StaticText1: TStaticText;
    GroupBoxForceControl: TGroupBox;
    ForceControlCheckBox: TCheckBox;
    SensorsNameComboBox: TComboBox;
    ForceBoundEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    ZeroButton: TButton;
    MaxButton: TButton;
    SpeedButtonUp: TSpeedButton;
    SpeedButtonDn: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure TargetEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure ButtonM_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ForceBoundEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure ZeroButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonUpClick(Sender: TObject);
    procedure SpeedButtonDnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegulatorForm: TRegulatorForm;
  scale,max:  integer;

implementation

uses main;
{$R *.dfm}
//------------------------------------------------------------------------------
procedure TRegulatorForm.BitBtnApplyClick(Sender: TObject);
var
  n,txt:  string;
  volt:   integer;
begin
  n:=CheckAndFormatValue(TargetEdit.Text,floattostr(RecvDataNew.TargetV),0,RegulatorForm.TrackBar1.Max,0,1);
    volt:=round(strtofloat(n)*scale);
  TrackBar1.Position:=volt;
  txt:='T'+inttohex(volt,4)+#13;
  try mainform.ComPort.WriteStr(txt) except end;  // отправляем целевое значение

  txt:='Y'+inttostr(ord(ForceControlCheckBox.Checked))+inttostr(SensorsNameComboBox.ItemIndex)+
        inttohex(round(strtofloat(ForceBoundEdit.Text)*16),4)+#13;
  try mainform.ComPort.WriteStr(txt) except end;  // отправляем настройки слежения за разгоном

end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.FormShow(Sender: TObject);
var
  i:  integer;
  txt:  string;
begin
  scale:=10;
  TrackBar1.Max:=2500;
  TrackBar1.Position:=round(RecvDataNew.TargetV*scale);
  TargetEdit.Text:=format31(RecvDataNew.TargetV);
  max:=RegulatorForm.TrackBar1.Max;
  ButtonM0.Caption:=format31(VoltMemo[0]/scale);
  ButtonM1.Caption:=format31(VoltMemo[1]/scale);
  ButtonM2.Caption:=format31(VoltMemo[2]/scale);
  ButtonM3.Caption:=format31(VoltMemo[3]/scale);
  ButtonM4.Caption:=format31(VoltMemo[4]/scale);
  ButtonM5.Caption:=format31(VoltMemo[5]/scale);

  TargetEdit.SelStart:=0;
  TargetEdit.SelLength:=Length(TargetEdit.Text);
  TargetEdit.SetFocus;

  SensorsNameComboBox.Clear;
  for i:=0 to 3 do
  begin
    SensorsNameComboBox.Items.Add(SensorName[i]);
  end;
  txt:=format32(RecvDataNew.HeatControlValue*0.0625);
    SensorsNameComboBox.ItemIndex:=RecvDataNew.HeatControlSensorNo;
    ForceBoundEdit.Text:=txt;
    ForceControlCheckBox.Checked:=bool(RecvDataNew.HeatControlStatus);
end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.ButtonM_MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  a:  string;
  i,n:  integer;
begin
  a:=(Sender as TButton).Name;
  i:=strtoint(a[length(a)]);
  if Button=mbRight then
  begin
    a:=CheckAndFormatValue(TargetEdit.Text,'0',0,250,3,1);
    n:=round(strtofloat(a)*10);
    (Sender as Tbutton).Caption:=a;
    VoltMemo[i]:=n;
    saveSettingsToFile();
  end
  else
  if Button=mbLeft then
  begin
    TargetEdit.Text:=(Sender as Tbutton).Caption;
    bitBtnApplyClick(Self);
  end;
end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.ForceBoundEditKeyPress(Sender: TObject; var Key: Char);
var
  ds: Char;
begin
  ds:=formatsettings.DecimalSeparator;
  if not(Key in ['0'..'9', #8,',','.','-']) then Key:=#0
  else
  begin
    if Key in ['.',','] then
    begin
      if pos(ds,(Sender as TEdit).Text)<>0 then
      begin
        Key:=#0
      end
        else
        Key:=ds;
    end;
    if (Sender as TEdit).SelLength>=5 then (Sender as TEdit).Clear;
    if (length((Sender as TEdit).Text)>=5)and(Key<>#8) then Key:=#0;
  end;
end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.FormActivate(Sender: TObject);
begin
  regulatorform.Top:=mainform.Top+round((mainform.Height-regulatorform.Height)/2);
  regulatorform.Left:=mainform.Left+round((mainform.Width-regulatorform.Width)/2);
end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl) in Shift then
  begin
    if (Key=ord(#13)) then
    begin
      bitbtnapply.Click();
      TargetEdit.SelStart:=0;
      TargetEdit.SelLength:=Length(TargetEdit.Text);
      TargetEdit.SetFocus;
    end;
  end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TRegulatorForm.MaxButtonClick(Sender: TObject);
begin
  RegulatorForm.TrackBar1.Position:=RegulatorForm.TrackBar1.Max;
  bitbtnapply.Click();
end;
procedure TRegulatorForm.SpeedButtonDnClick(Sender: TObject);
begin
  TrackBar1.Position:=TrackBar1.Position-1;
end;

procedure TRegulatorForm.SpeedButtonUpClick(Sender: TObject);
begin
  TrackBar1.Position:=TrackBar1.Position+1;
end;

//------------------------------------------------------------------------------
procedure TRegulatorForm.ZeroButtonClick(Sender: TObject);
begin
  RegulatorForm.TrackBar1.Position:=0;
  bitbtnapply.Click();
end;

//------------------------------------------------------------------------------
procedure TRegulatorForm.TargetEditKeyPress(Sender: TObject;
  var Key: Char);
var
  ds: Char;
begin
  ds:=formatsettings.DecimalSeparator;
  if not(Key in ['0'..'9', #8,',','.']) then Key:=#0
  else
  begin
  if Key in ['.',','] then
    begin
      if pos(ds,(Sender as TEdit).Text)<>0 then
      begin
        Key:=#0
      end
        else
        Key:=ds;
    end;
    if (Sender as TEdit).SelLength>=5 then (Sender as TEdit).Clear;
    if (length((Sender as TEdit).Text)>=5)and(Key<>#8) then Key:=#0;
  end;
end;
//------------------------------------------------------------------------------
procedure TRegulatorForm.TrackBar1Change(Sender: TObject);
begin
  TargetEdit.Text:=Format31(TrackBar1.Position/10);
end;
//------------------------------------------------------------------------------
end.
