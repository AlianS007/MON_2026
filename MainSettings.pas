unit MainSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPortCtl, Vcl.Buttons,
  Vcl.ExtCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  TmainSettingsForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    SensorVisibleCheckBox0: TCheckBox;
    SensorVisibleCheckBox1: TCheckBox;
    SensorVisibleCheckBox2: TCheckBox;
    SensorVisibleCheckBox3: TCheckBox;
    GrafVisibleCheckBox0: TCheckBox;
    GrafVisibleCheckBox1: TCheckBox;
    GrafVisibleCheckBox2: TCheckBox;
    GrafVisibleCheckBox3: TCheckBox;
    T0ColorShape: TShape;
    T1ColorShape: TShape;
    T2ColorShape: TShape;
    T3ColorShape: TShape;
    ADColorShape: TShape;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ComComboBox: TComComboBox;
    SaveDataCheckBox: TCheckBox;
    ColorDialog1: TColorDialog;
    GroupBox3: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    EditNominalPower: TEdit;
    EditNominalVoltage: TEdit;
    GroupBox4: TGroupBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    HeaterSettingsEnableCheckBox: TCheckBox;
    CheckBox100mlEnabled: TCheckBox;
    Edit100mlCount: TEdit;
    Label100mlCount: TLabel;
    Save100mlCheckBox: TCheckBox;
    GroupBoxSounds: TGroupBox;
    CheckBoxSoundsOn: TCheckBox;
    CheckBoxDisconnect: TCheckBox;
    CheckBoxOverheat: TCheckBox;
    CheckBoxAutostop: TCheckBox;
    XGZPColorShape: TShape;
    AtmoGrafVisibleCheckBox: TCheckBox;
    PressureGrafVisibleCheckBox: TCheckBox;
    procedure SensorVisibleCheckBox0Click(Sender: TObject);
    procedure SensorVisibleCheckBox1Click(Sender: TObject);
    procedure SensorVisibleCheckBox2Click(Sender: TObject);
    procedure SensorVisibleCheckBox3Click(Sender: TObject);
    procedure GrafVisibleCheckBox0Click(Sender: TObject);
    procedure GrafVisibleCheckBox1Click(Sender: TObject);
    procedure GrafVisibleCheckBox2Click(Sender: TObject);
    procedure GrafVisibleCheckBox3Click(Sender: TObject);
    procedure T0ColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure T1ColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure T2ColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure T3ColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ADColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SaveDataCheckBoxClick(Sender: TObject);
    procedure HeaterSettingsEnableCheckBoxClick(Sender: TObject);
    procedure CheckBox100mlEnabledClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxSoundsOnClick(Sender: TObject);
    procedure CheckBoxDisconnectClick(Sender: TObject);
    procedure CheckBoxOverheatClick(Sender: TObject);
    procedure CheckBoxAutostopClick(Sender: TObject);
    procedure EditNominalPowerKeyPress(Sender: TObject; var Key: Char);
    procedure EditNominalVoltageKeyPress(Sender: TObject; var Key: Char);
    procedure Edit100mlCountKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure XGZPColorShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PressureGrafVisibleCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainSettingsForm: TmainSettingsForm;

implementation

uses main;
{$R *.dfm}


procedure TmainSettingsForm.ADColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[4]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.ADLabel.Font.Color:=color;
      Series[4].Color:=SensorColor[4];
    end;
  end;
end;

procedure TmainSettingsForm.CheckBox100mlEnabledClick(Sender: TObject);
var
  checked:  bool;
begin
  checked:=(Sender as TCheckBox).Checked;
  Edit100mlCount.Enabled:=checked;
  if checked then
  begin
    Edit100mlCount.SetFocus;
    Save100mlCheckBox.Enabled:=true;
  end
  else
  begin
    Edit100mlCount.Text:=inttostr(StepsFor100ml);
    Save100mlCheckBox.Checked:=false;
    Save100mlCheckBox.Enabled:=false;
  end;
  
end;

procedure TmainSettingsForm.CheckBoxAutostopClick(Sender: TObject);
begin
  autostopSnd:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.CheckBoxDisconnectClick(Sender: TObject);
begin
  lostconnSnd:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.CheckBoxOverheatClick(Sender: TObject);
begin
  overheatSnd:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.CheckBoxSoundsOnClick(Sender: TObject);
var
  checked:  bool;
begin
  checked:=(Sender as TCheckBox).Checked;
  checkBoxDisconnect.Enabled:=checked;
  checkBoxOverheat.Enabled:=checked;
  checkBoxAutostop.Enabled:=checked;
  sounds:=checked;
end;

procedure TmainSettingsForm.Edit100mlCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', #8]) then Key:=#0;
  if (length((Sender as TEdit).Text)>6)and(Key<>#8) then Key:=#0;
end;

procedure TmainSettingsForm.EditNominalPowerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', #8]) then Key:=#0;
//  if (length((Sender as TEdit).Text)>=4)and(Key<>#8) then Key:=#0;
  if (Sender as TEdit).SelLength>=4 then (Sender as TEdit).Clear;

end;

procedure TmainSettingsForm.EditNominalVoltageKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', #8]) then Key:=#0;
  //if (length((Sender as TEdit).Text)>=3)and(Key<>#8) then Key:=#0;
  if (Sender as TEdit).SelLength>=3 then (Sender as TEdit).Clear;
end;

procedure TmainSettingsForm.FormActivate(Sender: TObject);
begin
  mainsettingsform.Top:=mainform.Top+round((mainform.Height-mainsettingsform.Height)/2);
  mainsettingsform.Left:=mainform.Left+round((mainform.Width-mainsettingsform.Width)/2);
end;

procedure TmainSettingsForm.FormShow(Sender: TObject);
begin
  mainsettingsform.Label100mlCount.Caption:=inttostr(StepsFor100ml);
//  mainsettingsform.Top:=mainform.Top+round((mainform.Height-mainsettingsform.Height)/2);
//  mainsettingsform.Left:=mainform.Left+round((mainform.Width-mainsettingsform.Width)/2);
end;

procedure TmainSettingsForm.GrafVisibleCheckBox0Click(Sender: TObject);
begin
  GraficVisible[0]:=(Sender as TCheckBox).Checked;
  Series[0].Visible:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.GrafVisibleCheckBox1Click(Sender: TObject);
begin
  GraficVisible[1]:=(Sender as TCheckBox).Checked;
  Series[1].Visible:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.GrafVisibleCheckBox2Click(Sender: TObject);
begin
  GraficVisible[2]:=(Sender as TCheckBox).Checked;
  Series[2].Visible:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.GrafVisibleCheckBox3Click(Sender: TObject);
begin
  GraficVisible[3]:=(Sender as TCheckBox).Checked;
  Series[3].Visible:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.HeaterSettingsEnableCheckBoxClick(Sender: TObject);
var
  checked:  bool;
begin
  checked:=(Sender as TCheckBox).Checked;
  EditNominalPower.Enabled:=checked;
  EditNominalVoltage.Enabled:=checked;
  if checked then EditNominalPower.SetFocus;

end;

procedure TmainSettingsForm.PressureGrafVisibleCheckBoxClick(Sender: TObject);
begin
  XGZPGraficVisible:=(Sender as TCheckBox).Checked;
  Series[5].Visible:=(Sender as TCheckBox).Checked;
  mainform.XGZPPanel.Visible:=(Sender as TCheckBox).Checked;
  showhideXGZP();
end;

procedure TmainSettingsForm.SaveDataCheckBoxClick(Sender: TObject);
begin
  logEnable:=(Sender as TCheckBox).Checked;
end;

procedure TmainSettingsForm.SensorVisibleCheckBox0Click(Sender: TObject);
var
  cond:  bool;
begin
  cond:=SensorVisibleCheckBox0.Checked;
  mainform.T0Panel.Top:=0;
  mainform.T0Panel.Visible:=cond;
  SensorVisible[0]:=cond;
  GrafVisibleCheckBox0.Enabled:=cond;
  T0ColorShape.Enabled:=cond;
  cond:=GrafVisibleCheckBox0.Checked and cond;
  Series[0].Visible:=cond;
  GrafVisibleCheckBox0.Enabled:=cond;
end;

procedure TmainSettingsForm.SensorVisibleCheckBox1Click(Sender: TObject);
var
  cond:  bool;
begin
  cond:=(Sender as TCheckBox).Checked;
  mainform.T1Panel.Top:=(mainform.T1Panel.Height)*ord(mainform.T0Panel.Visible);
  mainform.T1Panel.Visible:=cond;
  SensorVisible[1]:=cond;
  GrafVisibleCheckBox1.Enabled:=cond;
  T1ColorShape.Enabled:=cond;
  cond:=GrafVisibleCheckBox1.Checked and cond;
  Series[1].Visible:=cond;
end;

procedure TmainSettingsForm.SensorVisibleCheckBox2Click(Sender: TObject);
var
  cond:  bool;
begin
  cond:=(Sender as TCheckBox).Checked;
  mainform.T2Panel.Top:=mainform.T2Panel.Height*(ord(mainform.T0Panel.Visible)+ord(mainform.T1Panel.Visible));
  mainform.T2Panel.Visible:=cond;
  SensorVisible[2]:=cond;
  GrafVisibleCheckBox2.Enabled:=cond;
  T2ColorShape.Enabled:=cond;
  cond:=GrafVisibleCheckBox2.Checked and cond;
  Series[2].Visible:=cond;
end;

procedure TmainSettingsForm.SensorVisibleCheckBox3Click(Sender: TObject);
var
  cond:  bool;
begin
  cond:=(Sender as TCheckBox).Checked;
  mainform.T3Panel.Top:=3*mainform.T3Panel.Height;
  mainform.T3Panel.Visible:=cond;
  SensorVisible[3]:=cond;
  GrafVisibleCheckBox3.Enabled:=cond;
  T3ColorShape.Enabled:=cond;
  cond:=GrafVisibleCheckBox3.Checked and cond;
  Series[3].Visible:=cond;
end;

procedure TmainSettingsForm.T0ColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[0]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.T0Label.Font.Color:=color;
      Series[0].Color:=SensorColor[0];
    end;
  end;
end;

procedure TmainSettingsForm.T1ColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[1]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.T1Label.Font.Color:=color;
      Series[1].Color:=SensorColor[1];
    end;
  end;
end;

procedure TmainSettingsForm.T2ColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[2]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.T2Label.Font.Color:=color;
      Series[2].Color:=SensorColor[2];
    end;
  end;
end;

procedure TmainSettingsForm.T3ColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[3]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.T3Label.Font.Color:=color;
      Series[3].Color:=SensorColor[3];
    end;
  end;
end;

procedure TmainSettingsForm.XGZPColorShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  color:  TColor;
begin
  if button = mbLeft then
  begin
    if colordialog1.Execute then
    begin
      color:=colordialog1.Color;
      SensorColor[5]:=color;
      (sender as TShape).Brush.Color:=color;
      mainform.XGZPLabel.Font.Color:=color;

      Series[5].Color:=SensorColor[5];
    end;
  end;
end;
end.
