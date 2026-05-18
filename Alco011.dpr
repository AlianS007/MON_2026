program Alco011;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  Winapi.Messages,
  Main in 'Main.pas' {MainForm},
  MainSettings in 'MainSettings.pas' {mainSettingsForm},
  Sensor in 'Sensor.pas' {SensorForm},
  Rate in 'Rate.pas' {RateForm},
  Remain in 'Remain.pas' {RemainForm},
  Help in 'Help.pas' {HelpForm},
  Regulator in 'Regulator.pas' {RegulatorForm},
  //RegulatorB in 'RegulatorB.pas' {RegulatorFormB},
  Info in 'Info.pas' {InfoForm};

var
H: THandle;
{$R *.res}

begin
  H := CreateMutex(nil, True, 'ПАК-РК');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    showmessage('Программа уже работает!');
    CloseHandle(H);
    Exit;
  end;

  Application.Initialize;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TmainSettingsForm, mainSettingsForm);
  Application.CreateForm(TSensorForm, SensorForm);
  Application.CreateForm(TRegulatorForm, RegulatorForm);
  Application.CreateForm(TRateForm, RateForm);
  Application.CreateForm(TRemainForm, RemainForm);
  Application.CreateForm(THelpForm, HelpForm);
  Application.CreateForm(TRegulatorForm, RegulatorForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.Run;
  ReleaseMutex(H);
end.
