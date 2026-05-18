unit Sensor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TSensorForm = class(TForm)
    GroupBox1: TGroupBox;
    SensorOk: TBitBtn;
    SensorCancel: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBoxReactionOn: TCheckBox;
    CheckBoxSound: TCheckBox;
    CheckBoxPumpStop: TCheckBox;
    CheckBoxHeaterOff: TCheckBox;
    EditName: TEdit;
    EditMargin: TEdit;
    LabelCurrentT: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonCopyT: TButton;
    Button1: TButton;
    Button2: TButton;
    GroupBox4: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure ButtonCopyTClick(Sender: TObject);
    procedure CheckBoxReactionOnClick(Sender: TObject);
    procedure EditMarginKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SensorForm: TSensorForm;

implementation

uses main;
{$R *.dfm}

procedure TSensorForm.Button1Click(Sender: TObject);
var
  old,new:  double;
  txt,marginT,reactCode:  string;
begin
  old:=RecvDataNew.SensorBound[tindex];
  if (old>=-55)and(old<=127) then
  begin
    new:=old+0.0625;
    EditMargin.Text:= CheckAndFormatValue(floattostr(new),'----',-55,127,3,2,1);
    marginT:=inttohex(round(strtofloat(EditMargin.Text)*16),4);
    reactCode:=inttohex(8*ord(CheckBoxReactionOn.Checked)+
                    1*ord(CheckBoxSound.Checked)+
                    2*ord(CheckBoxPumpStop.Checked)+
                    4*ord(CheckBoxHeaterOff.Checked),1);
    txt:='M'+inttostr(tindex)+marginT+reactCode+#13;
    //mainform.Label1.Caption:=txt;
    try mainform.ComPort.WriteStr(txt) except end ;
  end;
  EditMargin.SetFocus;
end;

procedure TSensorForm.Button2Click(Sender: TObject);
var
  old,new:  double;
  txt,marginT,reactCode:  string;
begin
  old:=RecvDataNew.SensorBound[tindex];
  if (old>=-55)and(old<=127) then
  begin
    new:=old-0.0625;
    EditMargin.Text:= CheckAndFormatValue(floattostr(new),'----',-55,127,3,2,1);
    marginT:=inttohex(round(strtofloat(EditMargin.Text)*16),4);
    reactCode:=inttohex(8*ord(CheckBoxReactionOn.Checked)+
                    1*ord(CheckBoxSound.Checked)+
                    2*ord(CheckBoxPumpStop.Checked)+
                    4*ord(CheckBoxHeaterOff.Checked),1);
    txt:='M'+inttostr(tindex)+marginT+reactCode+#13;
    //mainform.Label1.Caption:=txt;
    try mainform.ComPort.WriteStr(txt) except end ;
  end;
  EditMargin.SetFocus;
end;

procedure TSensorForm.ButtonCopyTClick(Sender: TObject);
var
  old,new:  double;
  txt,marginT,reactCode:  string;
begin
  old:=RecvDataNew.SensorValue[tindex];
  if (old>=-55)and(old<=127) then
  begin
    new:=old+0.125;
    EditMargin.Text:= CheckAndFormatValue(floattostr(new),'----',-55,127,3,2,1);
    marginT:=inttohex(round(strtofloat(EditMargin.Text)*16),4);
    reactCode:=inttohex(8*ord(CheckBoxReactionOn.Checked)+
                    1*ord(CheckBoxSound.Checked)+
                    2*ord(CheckBoxPumpStop.Checked)+
                    4*ord(CheckBoxHeaterOff.Checked),1);
    txt:='M'+inttostr(tindex)+marginT+reactCode+#13;
    //mainform.Label1.Caption:=txt;
    try mainform.ComPort.WriteStr(txt) except end ;
  end;
  EditMargin.SetFocus;
end;

procedure TSensorForm.CheckBoxReactionOnClick(Sender: TObject);
var
  checked:  bool;
begin
  checked:=(Sender as TCheckBox).Checked;
  checkboxsound.Enabled:=checked;
  checkboxpumpstop.Enabled:=checked;
  checkboxheateroff.Enabled:=checked;
end;

procedure TSensorForm.EditMarginKeyPress(Sender: TObject; var Key: Char);
var
  ds: char;
  value: string;
begin
  ds:=formatsettings.DecimalSeparator;
  value:=(Sender as TEdit).Text;
  //mainform.Label1.Caption:=value;

  if not(Key in ['0'..'9', #8,',','.','-']) then Key:=#0
  else
  begin
    if Key in ['.',','] then
    begin
      if pos(ds,value)<>0 then
      begin
        Key:=#0
      end
        else
        Key:=ds
    end;
    if (Sender as TEdit).SelLength>=5 then (Sender as TEdit).Clear;
    if (length(value)>=6)and(Key<>#8) then Key:=#0;
  end;
end;

//------------------------------------------------------------------------------
procedure TSensorForm.FormShow(Sender: TObject);
var
  r:  integer;
begin
  Sensorform.Top:=mainform.Top+round((mainform.Height-Sensorform.Height)/2);
  Sensorform.Left:=mainform.Left+round((mainform.Width-Sensorform.Width)/2);
  r:=RecvDataNew.Reaction[tindex];
  checkboxsound.Checked:=bool((r shr 0) and $01);
  checkboxpumpstop.Checked:=bool((r shr 1) and $01);
  checkboxheateroff.Checked:=bool((r shr 2) and $01);
  checkboxreactionon.Checked:=bool((r shr 3) and $01);
  EditMargin.SelStart:=0;
  EditMargin.SelLength:=Length(EditMargin.Text);
  Editmargin.SetFocus;
end;

end.
