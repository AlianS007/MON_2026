unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.DateUtils, System.Math,System.Types, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, ZAbstractDataset,
  ZDataset, Data.DB, ZAbstractRODataset, ZAbstractConnection, ZConnection, CPort,
  Registry, IniFiles, MainSettings, MMSystem,
  CPortCtl, Vcl.WinXCtrls,Regulator, Sensor, Rate, Remain, Help, Info, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.Series, VCLTee.TeCanvas
  ;
{$R sounds.res}

type
  TMainForm = class(TForm)
    LeftPanel: TPanel;
    RightPanel: TPanel;
    CenterPanel: TPanel;
    T0Panel: TPanel;
    T1Panel: TPanel;
    StabPanel: TPanel;
    PumpPanel: TPanel;
    T0TopPanel: TPanel;
    T0BottomPanel: TPanel;
    T0Label: TLabel;
    T0BoundLabel: TLabel;
    T1BottomPanel: TPanel;
    T1BoundLabel: TLabel;
    T1TopPanel: TPanel;
    T1Label: TLabel;
    T2Panel: TPanel;
    T2Label: TLabel;
    T2BottomPanel: TPanel;
    T2BoundLabel: TLabel;
    T2TopPanel: TPanel;
    T3Panel: TPanel;
    T3Label: TLabel;
    T3BottomPanel: TPanel;
    T3BoundLabel: TLabel;
    T3TopPanel: TPanel;
    ADPanel: TPanel;
    ADLabel: TLabel;
    ADBottomPanel: TPanel;
    ADLabelMin: TLabel;
    ADTopPanel: TPanel;
    ADLabelMax: TLabel;
    StabModePanel: TPanel;
    StabModeButtonForce: TSpeedButton;
    StabModeButtonStop: TSpeedButton;
    StabModeButtonNormal: TSpeedButton;
    StabInfoPanel: TPanel;
    StabLabel: TLabel;
    PumpModePanel: TPanel;
    PumpSpeedHeaderLabel: TLabel;
    PumpSpeedPanel: TPanel;
    PumpTotalHeaderLabel: TLabel;
    PumpTotalPanel: TPanel;
    PumpRemainHeaderLabel: TLabel;
    PumpRemainPanel: TPanel;
    PumpRemainFooterLabel: TLabel;
    PumpStopButton: TSpeedButton;
    PumpStartButton: TSpeedButton;
    ComPort: TComPort;
    ComDataPacket: TComDataPacket;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZQuery1: TZQuery;
    Memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    ForceInfoLabel: TLabel;
    ServiceSpeedButton: TSpeedButton;
    DBChart1: TDBChart;
    ZQuery2: TZQuery;
    TimeButtonsPanel: TPanel;
    MsgLabel: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    PanelService: TPanel;
    StabLabel2: TLabel;
    RemainTimePanel: TPanel;
    XGZPPanel: TPanel;
    XGZPTopPanel: TPanel;
    XGZPLabel: TLabel;

    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComDataPacketPacket(Sender: TObject; const Str: string);
    procedure StabModeButtonStopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StabModeButtonNormalMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StabModeButtonForceMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StabLabelClick(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure T_LabelClick(Sender: TObject);
    procedure PumpSpeedPanelClick(Sender: TObject);
    procedure PumpStartButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PumpRemainPanelClick(Sender: TObject);
    procedure ServiceSpeedButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimeSelectButtonClick(Sender: TObject);
    procedure PumpTotalPanelClick(Sender: TObject);
    procedure DBChart1AfterDraw(Sender: TObject);
    procedure DBChart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   procedure ADLabelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
  end;
type
  TReceived = Record
    SensorValue:  array[0..3] of double;        // данные, полученные с датчиков Т0-Т3
    SensorBound:  array[0..3] of double;        // пороги срабатывания
    Reaction:     array[0..3] of byte;          // варианты реакции на превышение порога
    ADValue:      double;                       // данные об атмосферном давлении
    AFlagsStatus:                              byte;     //
    DrivesStatus:                              byte;     // копия состояния управляющих выходов
    Rate, Total, Dose, Remain, RemainT:        longint;
    stepcounter,backstepcount,stepsFor100:     int64;
    TargetV,MeasuredV:                        double;
    StabModeNo:                               byte;
    HeatControlStatus:                        shortint;
    HeatControlSensorNo:                      byte;
    HeatControlValue:                         double;
    IsInRange:                                byte;
    IsMaxU:                                   byte;
    XGZPPressure:                             smallint;
  End;
    //------------------------------------------------
  TMinMax = Record
    minT,minAD :           double;
    maxT,maxAD :           double;
    end;
    //------------------------------------------------

  function CheckAndFormatValue(Val:string; onerr:string='0'; min:double=0; max:double=250;
                                X:integer=3; Y:integer=1; Z:integer=0):string;
  procedure saveSettingsToFile();
  procedure loadSettingsFromFile();
  procedure createTimeWindowButtons();
  procedure createFileSystem();
  procedure createDB();
  procedure SetOutBoundValues();
  procedure showhideXGZP();
    function format30(val:double):string;
    function format31(val:double):string;
    function format32(val:double):string;
    function format34(val:double):string;
  function HexToInt(HexStr : string) : Int64;
  function GetStringTime(seconds: Integer): string;
  procedure setMinMaxY();
  procedure setMinMaxX();
  procedure reLoadDataFromDB();
  procedure setTimeWindow(tw:integer=600);
  procedure setSize();
  procedure updatePowerValues(force:bool=false);
  procedure updatePumpValues(force:bool=false);
  //procedure updateAllValues();


var
  MainForm: TMainForm;
  //------------
  mainFileName:                   String;
  settingsFile:                   TIniFile;
  logFile:                        TextFile;
  logFileName,tail:               String;
  portName:                       String;
  portSpeed:                      Integer;
  portList:                       TStringList;
  RecvDataNew,RecvDataOld:        TReceived;
  StepsFor100ml:                  integer;
  SensorColor:                    Array[0..5] of integer;
  SensorName:                     Array[0..3] of String;
  SensorVisible:                  Array[0..3] of bool;
  GraficVisible:                  Array[0..3] of bool;
  BMPGraficVisible:               bool;
  XGZPGraficVisible:              bool;
  VoltMemo:                       Array[0..5] of integer;
  sounds, lostconnSnd, autostopSnd, overheatSnd, mute:  bool;
  backCounter0, backCounter1, backCounter2:             integer;
  logEnable   :                                         bool;
  HeaterDefaultPower,HeaterDefaultVoltage:              integer;

  TargetColor,RateColor,TotalColor,RemainVColor:         string;

  dataSource:                     byte;

  haveNewData :                   bool;
  appStartMoment, moment:         TDateTime;
  tindex:                         integer;

  voiceNo:                        integer;
  vizirX,vizirY:                  double;
  cursorX:                        integer;

  //------------
  Series:                         Array[0..6] of TLineSeries;
  AxisYT,AxisYP,AxisYX:           TChartAxis;
  step,pointNo:                   integer;
  timewindow, starttime:          integer;
  timestamp, timestampold:        integer;

  MinMax:                         TMinMax;
  TimeWindowSelectButtons:        Array[0..10] of TSpeedButton;
  VizirTimer:                     integer;

const
  settingsFileName  = 'settings.ini';
  alarmTColor       = '$000000FF';
  dbfilename        = 'database';
  dbDir             = './db/';
  stattablename     = 'alcodata';
  logDir            = './log/';

  maxSensorT        = 128;
  minSensorT        = -55;
  maxRateValue      = 3600;
  timeList: Array[0..9] of integer = (300,600,1200,1800,2700,3600,5400,7200,14400,28800);

implementation

{$R *.dfm}
//------------------------------------------------------------------------------
//                                                          вывод состояния аппарата (пауза,разгон,перегрев и т.д.)
procedure showPACStatus();
var
  aFlags,drive,stabmode:  byte;
  txt,sensors:  string;
label
  exitFromShowPACStatus;
begin
  txt:='';
  sensors:='';
  //msgHeight:=0;
  aFlags:=RecvDataNew.AFlagsStatus;
  drive:=RecvDataNew.DrivesStatus;
  stabmode:=RecvDataNew.StabModeNo;
  if drive<16 then
  begin
  if ((drive shr 0) and 1) = 1 then
      begin
        sensors:=sensors+'0 ';
        mainform.T0BoundLabel.Color:=clRed;
        mainform.T0BoundLabel.Font.color:=clWhite;
      end
      else
      begin
        mainform.T0BoundLabel.Color:=clCream;
        mainform.T0BoundLabel.Font.color:=clNavy;
      end;
  if (drive shr 1) and 1 = 1 then
      begin
        sensors:=sensors+'1 ';
        mainform.T1BoundLabel.Color:=clRed;
        mainform.T1BoundLabel.Font.color:=clWhite;
      end
      else
      begin
        mainform.T1BoundLabel.Color:=clCream;
        mainform.T1BoundLabel.Font.color:=clNavy;
      end;
  if (drive shr 2) and 1 = 1 then
      begin
        sensors:=sensors+'2 ';
        mainform.T2BoundLabel.Color:=clRed;
        mainform.T2BoundLabel.Font.color:=clWhite;
      end
      else
      begin
        mainform.T2BoundLabel.Color:=clCream;
        mainform.T2BoundLabel.Font.color:=clNavy;
      end;
  if (drive shr 3) and 1 = 1 then
      begin
        sensors:=sensors+'3 ';
        mainform.T3BoundLabel.Color:=clRed;
        mainform.T3BoundLabel.Font.color:=clWhite;
      end
      else
      begin
        mainform.T3BoundLabel.Color:=clCream;
        mainform.T3BoundLabel.Font.color:=clNavy;
      end;

  voiceNo:=0;
  if ((aFlags and $0F)=1) then mute:=false;
  if (stabmode<>3) then mute:=false;
    if (not mute) then mainform.Label1.Caption:='';

  //
  if (stabmode=3) then
    begin
      txt:='Получен аварийный сигнал.'+' '+'Нагрев выключен, отбор остановлен. Подойди к аппарату.';
      if ({sounds and }overheatSnd) then
        begin voiceNo:=1; backcounter0:=0; end;
        //PlaySoundW('overheat', hInstance, SND_RESOURCE or SND_ASYNC);
      goto exitFromShowPACStatus
    end;
  //
  if ((aFlags shr 2) and 1)=1 then
    begin
      txt:='Отбор остановлен'+' '+'Перегрев, датчик(и) № '+sensors;
      if ({sounds and }overheatSnd) then
         begin voiceNo:=1; backcounter0:=0; end;
        //PlaySoundW('overheat', hInstance, SND_RESOURCE or SND_ASYNC);
      goto exitFromShowPACStatus
    end;

  if ((aFlags shr 1) and 1)=1 then
    begin
      txt:='Автостоп по заданному объему ('+inttostr(RecvDataNew.Dose)+' мл).'+' '
                  +' Для продолжения отбора нажми на ПРОБЕЛ';
      if ({sounds and }autostopSnd) then
         begin voiceNo:=2; backcounter0:=0; end;
        //PlaySoundW('autostop', hInstance, SND_RESOURCE or SND_ASYNC);
      goto exitFromShowPACStatus
    end;

  if ((aFlags shr 0) and 1)=0 then
    begin
      txt:='Отбор остановлен оператором.'+'  Для продолжения нажми на ПРОБЕЛ';
      goto exitFromShowPACStatus
    end;

  if drive<>0 then
    begin
      txt:='Сработал(и) датчик(и) № '+sensors+' '+'Примите меры.';
      goto exitFromShowPACStatus
    end;

  end;
  //

  //
exitFromShowPACStatus:


  if txt='' then mainform.MsgLabel.Visible:=false else mainform.MsgLabel.Visible:=true;
  mainform.MsgLabel.Caption:=txt;

end;
//------------------------------------------------------------------------------
//                                                          выбор длительности отображения графиков по времени
procedure TMainForm.TimeSelectButtonClick(Sender: TObject);
var
  tag:  integer;
begin
  if (Sender as TSpeedButton).Down then
  begin
    tag:=(Sender as TSpeedButton).Tag;
    timewindow:=tag;
    mainForm.DBChart1.BottomAxis.Maximum:=step;
    mainForm.DBChart1.BottomAxis.Minimum:=(step-timewindow);
    SetTimeWindow(timeWindow);
    vizirX:=0;
  end;
end;
//------------------------------------------------------------------------------
//                                                          создание кнопок выбора  длительности отображения графиков
procedure createTimeWindowButtons();
var
  i,j:  integer;
begin
  j:=timewindow;
  //for i:=0 to length(timeList)-1  do
  for i := length(timeList)-1 downto 0 do
  begin
    TimeWindowSelectButtons[i]:=TSpeedButton.Create(mainform);
    TimeWindowSelectButtons[i].Parent:=mainform.TimeButtonsPanel;
    with (TimeWindowSelectButtons[i] as TSpeedButton) do
    begin
      groupindex:=2;
//      down:=false;
      align:=alRight;
      width:=35;
      height:=20;
      //left:=pw-(k-i)*35+10;
      top:=1;
      font.Style:=[fsBold];
      font.Color:=clBlack;
      name:='TimeWindowButton'+inttostr(i);
      tag:=timeList[i];
      if j=tag then
                begin
                  Down:=true;
                end
                else Down:=false;
      caption:=inttostr(Round(tag/60));
      OnClick:=mainform.TimeSelectButtonClick;
    end;
  end;
  //(TimeWindowSelectButtons[2] as TSpeedButton).Down:=true;
end;
//------------------------------------------------------------------------------
//                                                          перерисовка графиков в соответсвии с выбранной длительностью окна
procedure setTimeWindow(tw:integer=600);
begin
    timewindow:=tw;
    mainform.DBChart1.Series[0].Clear;
    mainform.DBChart1.Series[1].Clear;
    mainform.DBChart1.Series[2].Clear;
    mainform.DBChart1.Series[3].Clear;
    mainform.DBChart1.Series[4].Clear;
    mainform.DBChart1.Series[5].Clear;
    mainForm.DBChart1.BottomAxis.Maximum:=step;
    mainForm.DBChart1.BottomAxis.Minimum:=(step-timewindow);
    reLoadDataFromDB;
    setMinMaxY;
end;
//------------------------------------------------------------------------------
//                                                          восстановление данных из БД
procedure reLoadDataFromDB();
var
  query,xstamp:  string;
  i,j,x:      integer;
  t0,t1,t2,t3,t4,t5:      Variant;
begin
  query:='delete from temp_stat_table;';
  mainForm.ZQuery2.SQL.Clear;
  mainForm.ZQuery2.SQL.Add(query);
  try mainForm.ZQuery2.ExecSQL;
  except
    //
  end;
  //
  query:='insert into temp_stat_table (UTS) WITH x (id) AS '+
         '(SELECT '+inttostr(timestamp-timewindow+1)+' UNION ALL '+
          'SELECT id + 1 FROM x WHERE  id  < '+inttostr(timestamp)+') '+
          'SELECT * FROM x; ';
//mainform.Label2.Caption:=query;
//  query:='insert into temp_stat_table (unix_time_stamp) WITH x (id) AS '+
//         '(SELECT (select max(unix_time_stamp) from statistics)-3600+1 UNION ALL '+
//          'SELECT id + 1 FROM x WHERE  id  <= (select max(unix_time_stamp) from statistics)) '+
//          'SELECT * FROM x; ';
  mainForm.ZQuery2.SQL.Clear;
  mainForm.ZQuery2.SQL.Add(query);
  try mainForm.ZQuery2.ExecSQL;
  except
    //
  end;
  //
  query:='insert into temp_stat_table select * from '+stattablename+' '+
          'where (UTS>='+inttostr(timestamp-timewindow+1)+')'+
          ' and (UTS<'+inttostr(timestamp)+') ;';
//  query:='insert into temp_stat_table select * from statistics '+
//          'where (unix_time_stamp>=(select max(unix_time_stamp) from statistics)-3600+1)'+
//          ' and (unix_time_stamp<=(select max(unix_time_stamp) from statistics)) ;';
  mainForm.ZQuery2.SQL.Clear;
  mainForm.ZQuery2.SQL.Add(query);
  try mainForm.ZQuery2.ExecSQL;
  except
    //
  end;
  //-------------
  query:='select * from temp_stat_table;';
  mainForm.ZReadOnlyQuery1.SQL.Clear;
  mainForm.ZReadOnlyQuery1.SQL.Add(query);
  mainForm.ZReadOnlyQuery1.Active:=true;
  //-------------
  //answer:='';
  j:=mainForm.ZReadOnlyQuery1.RecordCount;
//  x:=0;
  for i:=1 to j-1 do
    begin
      mainForm.ZReadOnlyQuery1.RecNo:=i;
      t0:=mainForm.ZReadOnlyQuery1.FieldByName('T0').Value;
      t1:=mainForm.ZReadOnlyQuery1.FieldByName('T1').Value;
      t2:=mainForm.ZReadOnlyQuery1.FieldByName('T2').Value;
      t3:=mainForm.ZReadOnlyQuery1.FieldByName('T3').Value;
      t4:=mainForm.ZReadOnlyQuery1.FieldByName('AD').Value;
      t5:=mainForm.ZReadOnlyQuery1.FieldByName('XGZPPressure').Value;
      x:= mainForm.ZReadOnlyQuery1.FieldByName('UTS').Value;
      //
      if ((x mod 60)=0) then
      begin
        datetimetostring(xstamp,'hh:nn',(x/86400));
      end
      else
      begin
        xstamp:='';
      end;

      //
      if t0 = Null then mainForm.DBChart1.Series[0].AddNullXY(x,9999,'')
                    else mainForm.DBChart1.Series[0].AddXY(x,t0,'');
      if t1 = Null then mainForm.DBChart1.Series[1].AddNullXY(x,9999,'')
                    else mainForm.DBChart1.Series[1].AddXY(x,t1,'');
      if t2 = Null then mainForm.DBChart1.Series[2].AddNullXY(x,9999,'')
                    else mainForm.DBChart1.Series[2].AddXY(x,t2,'');
      if t3 = Null then mainForm.DBChart1.Series[3].AddNullXY(x,9999,'')
                    else mainForm.DBChart1.Series[3].AddXY(x,t3,'');
      if t4 = Null then mainForm.DBChart1.Series[4].AddNullXY(x,9999,xstamp)
                    else mainForm.DBChart1.Series[4].AddXY(x,t4,xstamp);
      if t5 = Null then mainForm.DBChart1.Series[5].AddNullXY(x,9999,'')
                    else mainForm.DBChart1.Series[5].AddXY(x,t5,'');
    end;

  mainForm.ZReadOnlyQuery1.Active:=false;
end;
//------------------------------------------------------------------------------
//                                                          сохранение данных в БД и файл
procedure saveDataToFileAndToDB();
var
  dataLine: string;
  query:  string;
  TString: Array[0..3] of string;
  AD,Rate,Total,Volt,XGZPPressure:  string;
  i:  integer;
  v:  double;
  inRange:  bool;
begin
      for i:=0 to 3 do
      begin
        inRange:=(RecvDataNew.SensorValue[i]>minSensorT)
                  and (RecvDataNew.SensorValue[i]<maxSensorT);
        if inRange then
        begin
          TString[i]:=format34(RecvDataNew.SensorValue[i]);
        end
        else
        begin
          TString[i]:='Null';
        end;
        end;
    inRange:=(RecvDataNew.ADValue>500) and (RecvDataNew.ADValue<2000);
    if inRange then AD:=format32(RecvDataNew.ADValue)
                    else
                    AD:='Null';
    inRange:=(RecvDataNew.Rate>=0) and (RecvDataNew.Rate<=maxRateValue);
    if inRange then Rate:=format30(RecvDataNew.Rate)
                    else
                    Rate:='Null';
    inRange:=(RecvDataNew.Total>=0) and (RecvDataNew.Total<=99999);
    if inRange then Total:=format30(RecvDataNew.Total)
                    else
                    Total:='Null';
    if(RecvDataNew.StabModeNo=0) then v:=RecvDataNew.TargetV
                    else
                    v:=RecvDataNew.MeasuredV;
    inRange:=(v>=0) and (v<=2500);
    if inRange then Volt:=format31(v)
                    else
                    Volt:='Null';
    inRange:=(RecvDataNew.XGZPPressure<>-32768) ;
    if inRange then XGZPPressure:= inttostr(RecvDataNew.XGZPPressure)
                    else
                    XGZPPressure:='Null';

      //--------------------------------
      if (logEnable = true) then
        begin
          DateTimeToString(dataLine,'hh:nn.ss',now);
          dataLine:=dataLine+#9+TString[0]+#9+TString[1]+#9+
                  TString[2]+#9+TString[3]+#9+
                  AD+#9+Rate+#9+
                  Total+#9+
                  Volt+#9+
                  XGZPPressure+#9+tail;
     //-------------------------------
          if FileExists(logFileName) then
          begin
            try WriteLn(logFile,dataLine); except end;
          end
          else
          begin
            try
            AssignFile(logFile,logFileName);
            Rewrite(logFile);
            WriteLn(logFile,dataLine);
            except
            //
            end;
          end;
          tail:='';
        end;
  if (mainform.ZConnection1.Connected) then
  begin
          query:='INSERT INTO '+stattablename
              +' (UTS,T0,T1,T2,T3,AD,Rate,Total,Voltage,XGZPPressure)'
              +' VALUES ('+inttostr(timestamp)+','
              +TString[0]+','
              +TString[1]+','
              +TString[2]+','
              +TString[3]+','
              +AD+','
              +Rate+','
              +Total+','
              +Volt+','
              +XGZPPressure
              +')';
          mainform.ZQuery1.SQL.Clear;
          mainform.ZQuery1.SQL.Add(query);
          try mainform.ZQuery1.ExecSQL
          except
          end;
  end;
end;
//------------------------------------------------------------------------------
//                                                          установка границ графика по оси Y
procedure setMinMaxY();
var
  minY,maxY:                    Variant;
  min:  Array[0..3] of Double;
  max:  Array[0..3] of Double;
  i:  integer;
  txt:  string;
begin
  //maxY:=mainform.DBChart1.Series[0].MaxYValue;
  txt:='';
    for i:=0 to 3 do
    begin
      min[i]:=mainform.DBChart1.Series[i].MinYValue;
      max[i]:=mainform.DBChart1.Series[i].MaxYValue;
      txt:=txt+floattostr(min[i])+', '+floattostr(max[i])+'; ';
    end;

  minY:=mainform.DBChart1.MinYValue(AxisYT);
  maxY:=mainform.DBChart1.MaxYValue(AxisYT);
  //mainform.Label1.Caption:=txt;
  if (maxY-minY)<6.25 then
  begin
    minY:=minY-0.5;
    maxY:=maxY+0.375;
  end
  else
  begin
    minY:=minY-0.02*(maxY-minY);
    maxY:=maxY+0.05*(maxY-minY);
  end;
  AxisYT.SetMinMax(minY,maxY);

  minY:=mainform.DBChart1.MinYValue(AxisYP);
  maxY:=mainform.DBChart1.MaxYValue(AxisYP);

  AxisYP.SetMinMax(minY-0.2,maxY+0.2);
        mainForm.ADLabelMax.Caption:=Format32(maxY);
        mainForm.ADLabelMin.Caption:=Format32(minY);

  minY:=mainform.DBChart1.MinYValue(AxisYX);
  maxY:=mainform.DBChart1.MaxYValue(AxisYX);

  AxisYX.SetMinMax(minY-2,maxY+2);
  //      mainForm.ADLabelMax.Caption:=Format32(maxY);
  //      mainForm.ADLabelMin.Caption:=Format32(minY);
end;
//------------------------------------------------------------------------------
//                                                          установка границ графика по оси X
procedure setMinMaxX();
var
  i,j:  integer;
begin
  for j:=0 to 5 do
  begin
    i:=Series[j].Count;
    if (i>timewindow) then Series[j].Delete(0,(i-timewindow),false );
  end;
    //
    //restoredata;
    //
    mainform.DBChart1.BottomAxis.Maximum:=step;
    mainform.DBChart1.BottomAxis.Minimum:=(step-timewindow);

end;
//------------------------------------------------------------------------------
//                                                          добавление точек на графики
procedure addPointsToGraph(data:TReceived);
var
  inRange:            Bool;
  i:                  integer;
  xstamp:             string;
begin
  if ((DateTimeToUnix(moment) mod 60)=0) then datetimetostring(xstamp,'hh:nn',moment) else xstamp:='';
  //--------------------------------------------------------------
  setMinMaxX;
  //--------------------------------------------------------------
  //-- атмосферный датчик --
  inRange:=(RecvDataNew.ADValue>500) and (RecvDataNew.ADValue<2000);
  if inRange then
              Series[4].AddXY(step,RecvDataNew.ADValue,xstamp)
             else
              Series[4].AddNullXY(step,9999,xstamp);
  //----------------------------------------------------------------------------
  //-- датчик давления на XGZP --
  inRange:=(RecvDataNew.XGZPPressure<>-32768);
  if inRange then
              Series[5].AddXY(step,RecvDataNew.XGZPPressure)
              else
              Series[5].AddNullXY(step,9999);
  //----------------------------------------------------------------------------
  //-- температурные датчики --
  for i:=0 to 3 do
  begin
  inRange:=(RecvDataNew.SensorValue[i]>minSensorT) and (RecvDataNew.SensorValue[i]<maxSensorT);
  //inrange:=true;
  if inRange then
    begin
      Series[i].AddXY(step,RecvDataNew.SensorValue[i]);
    end
    else
    begin
      Series[i].AddNullXY(step,9999);
    end;
  end;
  //--------------------------------------------------------------
   //--------------------------------------------------------------
  //setMinMaxX;
  setMinMaxY();
end;
//------------------------------------------------------------------------------
//                                                          добавление пустых значений на график
procedure addNullToGraph();
var
  xstamp:   string;
  x:                  integer;
begin

  x:=DateTimeToUnix(moment) mod 60;
  if (x=0) then datetimetostring(xstamp,'hh:nn',moment) else xstamp:='';

  setMinMaxX;
  //--------------------------------------------------------------
  Series[4].AddNullXY(step,9999,xstamp);
  Series[0].AddNullXY(step,9999);
  Series[1].AddNullXY(step,9999);
  Series[2].AddNullXY(step,9999);
  Series[3].AddNullXY(step,9999);
  Series[5].AddNullXY(step,9999);
  //--------------------------------------------------------------
  setMinMaxY;
end;
//------------------------------------------------------------------------------
//                                                          создание графиков
procedure createSeries ();
var
  i:  integer;
begin
  for i:=0 to 3 do begin
    Series[i]:=TLineSeries.Create(mainform);   //DS18B20 - 4
    with Series[i] do
    begin
      ParentChart:=mainForm.DBChart1;
      Clear;
      VertAxis:=aCustomVertAxis;
      CustomVertAxis:=AxisYT;
      LinePen.Width:=2;
    end;
  end;
    Series[4]:=TLineSeries.Create(mainform);   //BMP180
    with Series[4] do
    begin
      ParentChart:=mainForm.DBChart1;
      Clear;
      VertAxis:=aCustomVertAxis;
      CustomVertAxis:=AxisYP;
      LinePen.Width:=2;
    end;

    Series[5]:=TLineSeries.Create(mainform);   //XGZP6857D
    with Series[5] do
    begin
      ParentChart:=mainForm.DBChart1;
      Clear;
      VertAxis:=aCustomVertAxis;
      CustomVertAxis:=AxisYX;
      LinePen.Width:=2;
    end;
end;
//------------------------------------------------------------------------------
//                                                          создание осей графиков
procedure createAxes ();
begin
  //------
  mainform.DBChart1.Title.Hide;
  mainform.DBChart1.Legend.Hide;
  mainform.DBChart1.MarginLeft:=60;
  mainform.DBChart1.MarginBottom:=5;
  mainform.DBChart1.MarginTop:=10;
  mainform.DBChart1.MarginRight:=10;
  //------
  with mainform.DBChart1.BottomAxis do
  begin
    //Automatic:=true;
    Axis.Color:=clWhite;
    PositionPercent:=0;
    LabelsFont.Color:=clWhite;
    LabelsFont.Size:=11;
    LabelsSeparation:=100;
    Increment:=60;
    MinorTickCount:=5;
    MinorGrid.Visible:=true;
    MinorGrid.Style:=psDot;
    MinorGrid.Color:=RGB(100,100,100);
    Grid.Color:=RGB(150,150,150);
    Visible:=true;
    SetMinMax(step-timewindow,step);
  end;
  //
  AxisYT := TChartAxis.Create(mainform.DBChart1);   // Вертикальная ось датчиков Т

  with AxisYT do
  begin
    //Automatic:=true;
    Axis.Color:=clWhite;
    AxisValuesFormat:='##0.#0';
    LabelsFont.Size:=11;
    LabelsFont.Color:=clWhite;
    LabelsSeparation:=250;
    Increment:=0.25;
    StartPosition:=0;
    EndPosition:=70;
    Grid.Color:=RGB(100,100,100);
    MinorGrid.Visible:=true;
    MinorGrid.Style:=psDot;
    //MinorGrid.Width:=1;
    MinorGrid.Color:=RGB(80,80,80);
  end;

  AxisYX := TChartAxis.Create(mainform.DBChart1);  // Вертикальная ось слева для давления XGZP

  with AxisYX do
  begin
      Axis.Color:=clWhite;
      AxisValuesFormat:='###';
      LabelsFont.Size:=11;
      LabelsFont.Color:=clWhite;
      LabelsSeparation:=50;
      StartPosition:=(AxisYT as TChartAxis).EndPosition+5;
      EndPosition:=StartPosition+10;
      Increment:=1;
      MinimumRound:=true;
      MaximumRound:=true;
      MinorGrid.Visible:=true;
      MinorGrid.Style:=psDot;
      MinorGrid.Color:=RGB(80,80,80);
      Grid.Color:=RGB(100,100,100);
      Visible:=true;
  end;

  AxisYP := TChartAxis.Create(mainform.DBChart1);  // Вертикальная ось слева для атмосферного давления BMP180

  with AxisYP do
  begin
      Axis.Color:=clWhite;
      AxisValuesFormat:='###.0';
      LabelsFont.Size:=11;
      LabelsFont.Color:=clWhite;
      LabelsSeparation:=50;
      StartPosition:=(AxisYX as TChartAxis).EndPosition+5;
      EndPosition:=100;
      Increment:=0.1;
      MinimumRound:=true;
      MaximumRound:=true;
      MinorGrid.Visible:=true;
      MinorGrid.Style:=psDot;
      MinorGrid.Color:=RGB(80,80,80);
      Grid.Color:=RGB(100,100,100);
      Visible:=true;
  end;

end;
//------------------------------------------------------------------------------
//                                                          вывод состояния контроля разгона
procedure ShowForceControlStatus();
var
  x,y,z:  integer;
  m,n:  double;
  txt:  string;
  cond: bool;
begin
  x:=RecvDataNew.HeatControlStatus;
  y:=RecvDataNew.HeatControlSensorNo;
  z:=RecvDataNew.StabModeNo;
  m:=RecvDataNew.HeatControlValue/16;
  n:=RecvDataNew.SensorValue[y];
  if (z<>1) then
    begin
      mainform.ForceInfoLabel.Caption:='';
      mainform.ForceInfoLabel.Height:=0;
    end
    else
    begin
      mainform.ForceInfoLabel.Height:=3*mainform.ForceInfoLabel.Font.Height;
      cond:=(n<minSensorT)or(n>maxSensorT);
      if (x=0)or(cond) then txt:='Контроль'+#13+'разгона'+#13+'отключен'
        else
        begin
          txt:='Контроль'+#13+'разгона'+#13+'T'+inttostr(y)+' < '+format32(m)+'°';
        end;
      mainform.ForceInfoLabel.Caption:=txt;
    end;
end;
//------------------------------------------------------------------------------
//                                                          установка заведомо ошибочных значений
procedure SetOutBoundValues();
begin
    with RecvDataNew do
  begin
    Rate:=-32768;
    Total:=-32768;
    Dose:=-32768;
    Remain:=-32768;
    SensorValue[0]:=-32768;
    SensorValue[1]:=-32768;
    SensorValue[2]:=-32768;
    SensorValue[3]:=-32768;
    SensorBound[0]:=-32768;
    SensorBound[1]:=-32768;
    SensorBound[2]:=-32768;
    SensorBound[3]:=-32768;
    Reaction[0]:=0;
    Reaction[1]:=0;
    Reaction[2]:=0;
    Reaction[3]:=0;
    ADValue:=-32768;
    TargetV:=-32768;
    MeasuredV:=-32768;
    StabModeNo:=255;
    HeatControlStatus:=0;
    HeatControlSensorNo:=255;
    HeatControlValue:=-32768;
    XGZPPressure:=-32768;
    AFlagsStatus:=255;     //
    DrivesStatus:=255;     // копия состояния управляющих выходов
    IsInRange:=255;
    IsMaxU:=0;
  end;
  //RecvDataNew.Dose:=null;
  //RecvDataNew.Remain:=null;

end;
//------------------------------------------------------------------------------
//                                                          преобразование числа секунд к виду hhh:mm:ss
function GetStringTime(seconds: LongInt): string;
const
SecondPerDay = 86400;
SecondPerHour = 3600;
SecondPerMinute = 60;
var
  s: string;
  h, m, sec: Integer;
begin
  h:= seconds div SecondPerHour;
  m := (seconds mod SecondPerHour) div SecondPerMinute;
  sec := (seconds mod SecondPerHour) mod SecondPerMinute;

  if h>0 then s := inttostr(h)+':';//+':'+inttostr(m)+':'+inttostr(sec);
  if m<10 then s:=s+'0';
  s:=s+inttostr(m)+':';
  if sec<10 then s:=s+'0';
  s:=s+inttostr(sec);
  Result := s;
end;
//------------------------------------------------------------------------------
//                                                          создание файловой системы для логирования
procedure createFileSystem;
begin
  // Создаем (проверяем) необходимую файловую структуру
  CreateDir(logDir);
  CreateDir(dbDir);
  DateTimeToString(logFileName,'yyyy-mm-dd hh.nn.ss ',moment);
  logFileName:='./log/'+mainFileName+'_'+logFileName+'.txt';
  if (logEnable = true) then
  begin
    AssignFile(logFile,logFileName);
    Rewrite(logFile);
  end;
end;
//------------------------------------------------------------------------------
//                                                          создание БД для логирования
procedure createDB;
var
  dbfullname,timestring,archiveDbFileName,query: string;
  hFile,fileSize: integer;
begin
  // создаем файловую систему для БД
  dbfullname:='./db/'+mainFileName+'_'+dbfilename+'.db';
  if (FileExists(dbfullname)) then
  begin
    hFile := FileOpen(dbfullname, fmOpenRead);
    fileSize := GetFileSize(hFile, nil);
    FileClose(hFile);
    if (fileSize > 1024*1024*128) then
    begin
      DateTimeToString(timeString,'yyyy-mm-dd_hh.nn.ss_',moment);
      archiveDbFileName:='./db/arh_'+timeString+mainFileName+'_'+dbfilename+'.db';
      RenameFile(dbfullname,archiveDbFileName);
    end;
  end;
//
  // Создаем (проверяем) БД и подключаемся к ней
  mainform.ZConnection1.Database:=dbfullname;
  mainform.ZConnection1.Connected:=true;
  // Создаем при необходимости нужные таблицы в БД
  mainform.ZQuery1.SQL.Clear;
  query:='CREATE TABLE IF NOT EXISTS ' +stattablename+
   ' ( UTS INTEGER PRIMARY KEY UNIQUE ON CONFLICT REPLACE,'+
   ' T0 DOUBLE, T1 DOUBLE, T2 DOUBLE, T3 DOUBLE, AD DOUBLE, Rate INTEGER, Total INTEGER, Voltage INTEGER, XGZPPressure INTEGER);';
  mainform.ZQUery1.SQL.Add(query);
  mainform.ZQuery1.ExecSQL;
  //
  mainform.ZQuery1.SQL.Clear;
  query:='CREATE TABLE IF NOT EXISTS ' +'points'+
   ' (UTS INTEGER PRIMARY KEY UNIQUE ON CONFLICT REPLACE, reason BLOB);';
  mainform.ZQUery1.SQL.Add(query);
  try mainform.ZQuery1.ExecSQL;  except  end;
  //
  mainform.ZQuery1.SQL.Clear;
  query:='create table if not exists '+
          'temp_stat_table(UTS INTEGER PRIMARY KEY ON CONFLICT REPLACE'+
          ' UNIQUE ON CONFLICT REPLACE, '+
          'T0 DOUBLE, T1 DOUBLE, T2 DOUBLE, '+
          'T3 DOUBLE, AD DOUBLE, Rate INTEGER, Total INTEGER, Voltage INTEGER, XGZPPressure INTEGER);';  // TargetU INTEGER
  mainform.ZQUery1.SQL.Add(query);
  try mainform.ZQuery1.ExecSQL;  except end;
  //
  DateTimeToString(timeString,'yyyy-mm-dd hh:nn:ss',moment);

  mainform.ZQuery1.SQL.Clear;
  query:='INSERT INTO points VALUES('+inttostr(DateTimeToUnix(moment))+', "'+'Старт программы в '+timeString+'") ;';
  mainform.ZQUery1.SQL.Add(query);
  try mainform.ZQuery1.ExecSQL;  except  end;

end;
//------------------------------------------------------------------------------
//                                                          обнаружение всех СОМ портов в системе
function listComPorts:TStringList;
var
  i: Integer;
  Ports: TStringList;
  reg: TRegistry;
begin
  Ports := TStringList.Create;
  result:=TStringList.Create;
  reg := TRegistry.Create(KEY_READ);
    with reg do
    try
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if reg.OpenKey('hardware\devicemap\serialcomm', false) then
        try
          ports.BeginUpdate();
          try
            reg.GetValueNames(ports);
            for i := ports.Count -1 downto 0 do            // обязательно в обратном порядке
            ports.Strings[i] := reg.ReadString(ports.Strings[i]);
            result:=ports;                  // вот тут присваиваем значения
            ports.sort()

          finally
            ports.EndUpdate()
          end
        finally
          reg.CloseKey()
        end
      else
        ports.clear()
    finally
    reg.free()
    end
end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//
function CheckAndFormatValue(Val:string; onerr:string='0'; min:double=0; max:double=250;
                              X:integer=3; Y:integer=1; Z:integer=0):string;
var
  n:  double;
begin
  Val:=stringreplace(Val,',',formatsettings.DecimalSeparator,[rfReplaceAll, rfIgnoreCase]);
  Val:=stringreplace(Val,'.',formatsettings.DecimalSeparator,[rfReplaceAll, rfIgnoreCase]);
  try
    n:=strtofloat(Val);
  except
    n:=strtofloat(onerr);
  end;
  if Z=0 then
  begin
    if n<min then n:=min;
    if n>max then n:=max;
    result:=Format('%'+inttostr(X)+'.'+inttostr(Y)+'f',[n]);
  end
  else
  if Z=1 then
  begin
    if (n>=min)and(n<=max) then
      result:=Format('%'+inttostr(X)+'.'+inttostr(Y)+'f',[n])
    else
      result:=onerr;
  end;
end;
//------------------------------------------------------------------------------
function format30(val:double):string;
begin
  result:=stringreplace(Format('%3.0f',[val]),',','.',[rfReplaceAll, rfIgnoreCase]);
end;
//------------------------------------------------------------------------------
function format31(val:double):string;
begin
  result:=stringreplace(Format('%3.1f',[val]),',','.',[rfReplaceAll, rfIgnoreCase]);
end;
//------------------------------------------------------------------------------
function format32(val:double):string;
begin
  result:=stringreplace(Format('%3.2f',[val]),',','.',[rfReplaceAll, rfIgnoreCase]);
end;
//------------------------------------------------------------------------------
function format34(val:double):string;
begin
  result:=stringreplace(Format('%3.4f',[val]),',','.',[rfReplaceAll, rfIgnoreCase]);
end;
//------------------------------------------------------------------------------
//                                                          шестнадцатиричная строка в целое
function HexToInt(HexStr : string) : Int64;
var RetVar : Int64;
   i : byte;
begin
 HexStr := UpperCase(HexStr);
 if HexStr[length(HexStr)] = 'H' then
    Delete(HexStr,length(HexStr),1);
 RetVar := 0;

 for i := 1 to length(HexStr) do begin
     RetVar := RetVar shl 4;
     if HexStr[i] in ['0'..'9'] then
        RetVar := RetVar + (byte(HexStr[i]) - 48)
     else
        if HexStr[i] in ['A'..'F'] then
           RetVar := RetVar + (byte(HexStr[i]) - 55)
        else begin
           Retvar := 0;
           break;
        end;
 end;

 Result := RetVar;
end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                                                          чтение настроек из файла
procedure loadSettingsFromFile();
var
  i:  integer;
  cp: TComponent;
begin
  settingsFile:=TIniFile.Create(extractfilepath(paramstr(0))+mainFileName+'_'+settingsFileName);
  with settingsFile do
  begin
    portName        :=ReadString('SETTINGS','PortNo','COM4');
    //portSpeed     :=ReadString('SETTINGS','PortSpeed','9600');
    timewindow      :=ReadInteger('SETTINGS','TimeWindow',600);
    logEnable       :=ReadBool('SETTINGS','Logging',true);
    sounds          :=ReadBool('SETTINGS','Sound',true);
    lostconnSnd     :=ReadBool('SETTINGS','lostconnSnd',true);
    autostopSnd     :=ReadBool('SETTINGS','autostopSnd',true);
    overheatSnd     :=ReadBool('SETTINGS','overheatSnd',true);

    SensorColor[0]  :=ReadInteger('T0','color',255);
    SensorColor[1]  :=ReadInteger('T1','color',65535);
    SensorColor[2]  :=ReadInteger('T2','color',65280);
    SensorColor[3]  :=ReadInteger('T3','color',16776960);
    SensorColor[4]  :=ReadInteger('AD','color',16744576);
    SensorColor[5]  :=ReadInteger('XGZP','color',8421631);

    SensorName[0]   :=ReadString('T0','name','Т0(Пар)');
    SensorName[1]   :=ReadString('T1','name','Т1(2/3)');
    SensorName[2]   :=ReadString('T2','name','Т2(A)');
    SensorName[3]   :=ReadString('T3','name','Т3(B)');

    SensorVisible[0]  :=ReadBool('T0','Show',true);
    SensorVisible[1]  :=ReadBool('T1','Show',true);
    SensorVisible[2]  :=ReadBool('T2','Show',true);
    SensorVisible[3]  :=ReadBool('T3','Show',true);

    GraficVisible[0]  :=ReadBool('T0','graph',true);
    GraficVisible[1]  :=ReadBool('T1','graph',true);
    GraficVisible[2]  :=ReadBool('T2','graph',true);
    GraficVisible[3]  :=ReadBool('T3','graph',true);

    BMPGraficVisible  :=ReadBool('BMP','Show',true);
    XGZPGraficVisible :=ReadBool('XGZP','Show',false);

    HeaterDefaultPower    :=ReadInteger('HEATER','DefaultPower',2000);
    HeaterDefaultVoltage  :=ReadInteger('HEATER','DefaultVoltage',230);

    TargetColor :=        ReadString('Extras','TargetColor','33023');
    RateColor   :=        ReadString('Extras','RateColor','33023');
    TotalColor  :=        ReadString('Extras','TotalColor','33023');
    RemainVColor:=        ReadString('Extras','RemainVColor','33023');

    VoltMemo[0] :=        ReadInteger('HEATER','Memo0',1000);
    VoltMemo[1] :=        ReadInteger('HEATER','Memo1',1200);
    VoltMemo[2] :=        ReadInteger('HEATER','Memo2',1400);
    VoltMemo[3] :=        ReadInteger('HEATER','Memo3',1600);
    VoltMemo[4] :=        ReadInteger('HEATER','Memo4',1800);
    VoltMemo[5] :=        ReadInteger('HEATER','Memo5',2000);

  end;
  settingsFile.Free;

  with mainsettingsform do
  begin
      SensorVisibleCheckBox0.Checked:=SensorVisible[0];
      SensorVisibleCheckBox1.Checked:=SensorVisible[1];
      SensorVisibleCheckBox2.Checked:=SensorVisible[2];
      SensorVisibleCheckBox3.Checked:=SensorVisible[3];
      PressureGrafVisibleCheckBox.Checked:=XGZPGraficVisible;
      //AtmoGrafVisibleCheckBox.Checked:=BMPGraficVisible;
  //
      GrafVisibleCheckBox0.Checked:=GraficVisible[0];
      GrafVisibleCheckBox1.Checked:=GraficVisible[1];
      GrafVisibleCheckBox2.Checked:=GraficVisible[2];
      GrafVisibleCheckBox3.Checked:=GraficVisible[3];
  //
      GrafVisibleCheckBox0.Enabled:=SensorVisible[0];
      GrafVisibleCheckBox1.Enabled:=SensorVisible[1];
      GrafVisibleCheckBox2.Enabled:=SensorVisible[2];
      GrafVisibleCheckBox3.Enabled:=SensorVisible[3];
  //
      T0ColorShape.Enabled:=SensorVisible[0];
      T1ColorShape.Enabled:=SensorVisible[1];
      T2ColorShape.Enabled:=SensorVisible[2];
      T3ColorShape.Enabled:=SensorVisible[3];
      XGZPColorShape.Enabled:=XGZPGraficVisible;
  //  ADColorShape.Enabled:=BMPGraficVisible;
      T0ColorShape.Brush.Color:=SensorColor[0];
      T1ColorShape.Brush.Color:=SensorColor[1];
      T2ColorShape.Brush.Color:=SensorColor[2];
      T3ColorShape.Brush.Color:=SensorColor[3];
      ADColorShape.Brush.Color:=SensorColor[4];
      XGZPColorShape.Brush.Color:=SensorColor[5];

      SaveDataCheckBox.Checked:=logEnable;
  end;

  for i := 0 to 3 do
    begin
      cp:=mainform.findcomponent('T'+inttostr(i)+'Label') as TLabel;
      (cp as TLabel).Font.Color:=SensorColor[i];  // цвет значения

      cp:=mainform.findcomponent('T'+inttostr(i)+'Panel') as TPanel;
      (cp as TPanel).Visible:=SensorVisible[i];   // видимость индикатора
      //
      cp:=mainform.findcomponent('T'+inttostr(i)+'TopPanel') as TPanel;
      (cp as TPanel).Caption:=SensorName[i];  // названия датчиков
      //
      Series[i].Color:=SensorColor[i];  // цвет графиков
      Series[i].Visible:=(SensorVisible[i] and GraficVisible[i]);
    end;
    Series[4].Color:=SensorColor[4];
    //Series[4].Visible:=BMPGraficVisible;
    Series[5].Color:=SensorColor[5];
    Series[5].Visible:=XGZPGraficVisible;
    mainform.XGZPPanel.Visible:=XGZPGraficVisible;
    if XGZPGraficVisible then (AxisYT as TChartAxis).EndPosition:=70
                          else (AxisYT as TChartAxis).EndPosition:=85;


  mainform.ADLabel.Font.Color     :=SensorColor[4];
  mainform.XGZPLabel.Font.Color   :=SensorColor[5];
  mainform.ComPort.Port           :=PortName;

  mainform.StabLabel.Font.Color       :=strtoint(TargetColor);
  mainform.PumpSpeedPanel.Font.Color  :=strtoint(RateColor);
  mainform.PumpTotalPanel.Font.Color  :=strtoint(TotalColor);
  mainform.PumpRemainPanel.Font.Color :=strtoint(RemainVColor);
  mainform.RemainTimePanel.Font.Color :=strtoint(RemainVColor);

end;
//------------------------------------------------------------------------------
//                                                          сохранение настроек в файл
procedure saveSettingsToFile();
begin
  settingsFile:=TIniFile.Create(extractfilepath(paramstr(0))+mainFileName+'_'+settingsFileName);
  with settingsFile do
  begin
    WriteString('SETTINGS','PortNo',portName);
    WriteInteger('SETTINGS','TimeWindow',timewindow);
    WriteBool('SETTINGS','Sound',sounds);
    WriteBool('SETTINGS','lostconnSnd',lostconnSnd);
    WriteBool('SETTINGS','autostopSnd',autostopSnd);
    WriteBool('SETTINGS','overheatSnd',overheatSnd);
    WriteBool('SETTINGS','Logging',logEnable);

    WriteInteger('T0','color',SensorColor[0]);
    WriteString('T0','name',SensorName[0]);
    WriteBool('T0','graph',GraficVisible[0]);
    WriteBool('T0','Show',SensorVisible[0]);

    WriteInteger('T1','color',SensorColor[1]);
    WriteString('T1','name',SensorName[1]);
    WriteBool('T1','graph',GraficVisible[1]);
    WriteBool('T1','Show',SensorVisible[1]);

    WriteInteger('T2','color',SensorColor[2]);
    WriteString('T2','name',SensorName[2]);
    WriteBool('T2','graph',GraficVisible[2]);
    WriteBool('T2','Show',SensorVisible[2]);

    WriteInteger('T3','color',SensorColor[3]);
    WriteString('T3','name',SensorName[3]);
    WriteBool('T3','graph',GraficVisible[3]);
    WriteBool('T3','Show',SensorVisible[3]);

    WriteInteger('AD','color',SensorColor[4]);
    //WriteBool('AD','Show',BMPGraficVisible);
    
    WriteInteger('XGZP','color',SensorColor[5]);
    WriteBool('XGZP','Show',XGZPGraficVisible);

    WriteInteger('HEATER','DefaultPower',HeaterDefaultPower);
    WriteInteger('HEATER','DefaultVoltage',HeaterDefaultVoltage);

    WriteString('Extras','TargetColor',TargetColor);
    WriteString('Extras','RateColor',RateColor);
    WriteString('Extras','TotalColor',TotalColor);
    WriteString('Extras','RemainVColor',RemainVColor);

    WriteInteger('HEATER','Memo0',VoltMemo[0]);
    WriteInteger('HEATER','Memo1',VoltMemo[1]);
    WriteInteger('HEATER','Memo2',VoltMemo[2]);
    WriteInteger('HEATER','Memo3',VoltMemo[3]);
    WriteInteger('HEATER','Memo4',VoltMemo[4]);
    WriteInteger('HEATER','Memo5',VoltMemo[5]);

    {
    WriteBool('STOPWARMING','Enabled',StopWarming);
    WriteFloat('STOPWARMING','TresholdT',StopWarmingT);
    WriteInteger('STOPWARMING','SensorNo',StopWarmingSensor); }

  end;
  settingsFile.Free;
end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure parceW(data:string);
var
  shift,len: integer;
  d:  string;
begin
dataSource:=ord('W');

  shift:=3;
  len:=length(data)-shift+1;
  d:=copy(data,shift,len);
    RecvDataNew.SensorValue[0] :=smallint(strtoint('$'+copy(data,3,4)))*0.0625;
    RecvDataNew.SensorValue[1] :=smallint(strtoint('$'+copy(data,7,4)))*0.0625;
    RecvDataNew.SensorValue[2] :=smallint(strtoint('$'+copy(data,11,4)))*0.0625;
    RecvDataNew.SensorValue[3] :=smallint(strtoint('$'+copy(data,15,4)))*0.0625;
    RecvDataNew.SensorBound[0] :=smallint(strtoint('$'+copy(data,19,4)))*0.0625;
    RecvDataNew.SensorBound[1] :=smallint(strtoint('$'+copy(data,23,4)))*0.0625;
    RecvDataNew.SensorBound[2] :=smallint(strtoint('$'+copy(data,27,4)))*0.0625;
    RecvDataNew.SensorBound[3] :=smallint(strtoint('$'+copy(data,31,4)))*0.0625;
    RecvDataNew.ADValue        :=strtoint('$'+copy(data,35,8))/133.333333;
    RecvDataNew.Reaction[0]    :=strtoint('$'+copy(data,43,2));
    RecvDataNew.Reaction[1]    :=strtoint('$'+copy(data,45,2));
    RecvDataNew.Reaction[2]    :=strtoint('$'+copy(data,47,2));
    RecvDataNew.Reaction[3]    :=strtoint('$'+copy(data,49,2));
    RecvDataNew.AFlagsStatus   :=strtoint('$'+copy(data,51,2));
    RecvDataNew.DrivesStatus   :=strtoint('$'+copy(data,53,2));
    RecvDataNew.stepcounter    :=strtoint('$'+copy(data,55,8));
    RecvDataNew.backstepcount  :=strtoint('$'+copy(data,63,8));
    RecvDataNew.stepsFor100    :=strtoint('$'+copy(data,71,8));
    RecvDataNew.Rate           :=strtoint('$'+copy(data,79,4));
    RecvDataNew.Dose           :=strtoint('$'+copy(data,83,4));
    RecvDataNew.TargetV        :=(strtoint('$'+copy(data,87,4)))/10;
    RecvDataNew.MeasuredV      :=(strtoint('$'+copy(data,91,4)))/10;
    RecvDataNew.StabModeNo     :=(strtoint('$'+copy(data,95,2)));
    RecvDataNew.HeatControlSensorNo :=strtoint('$'+copy(data,97,2));
    RecvDataNew.HeatControlStatus   :=strtoint('$'+copy(data,99,2));
    RecvDataNew.HeatControlValue    :=strtoint('$'+copy(data,101,4));
   try RecvDataNew.XGZPPressure      :=strtoint('$'+copy(data,105,8))
   except
      RecvDataNew.XGZPPressure        :=-32768;
   end;

  RecvDataNew.Total:=round((100*(RecvDataNew.stepcounter)/RecvDataNew.stepsFor100));
  RecvDataNew.Remain:=round(100*((RecvDataNew.backstepcount)/RecvDataNew.stepsFor100));
  if RecvDataNew.Rate <> 0 then
    begin
      RecvDataNew.RemainT:=round((360000*RecvDataNew.backstepcount)
                                  /(RecvDataNew.Rate*RecvDataNew.stepsFor100));
    end
    else
      RecvDataNew.RemainT := 0;
  //
  //mainform.RemainTimePanel.Caption:=getstringtime(RecvDataNew.RemainT);
  if (RecvDataNew.RemainT<>REcvDataOld.RemainT) then
      mainform.RemainTimePanel.Caption:=getstringtime(RecvDataNew.RemainT);
end;
//------------------------------------------------------------------------------
procedure parceT(data:string);
begin
    setlength(data,140);
    dataSource:=ord('T');
   RecvDataNew.SensorValue[0] :=smallint(strtoint('$'+copy(data,3,4)))*0.0625;
   RecvDataNew.SensorValue[1] :=smallint(strtoint('$'+copy(data,7,4)))*0.0625;
   RecvDataNew.SensorValue[2] :=smallint(strtoint('$'+copy(data,11,4)))*0.0625;
   RecvDataNew.SensorValue[3] :=smallint(strtoint('$'+copy(data,15,4)))*0.0625;
   RecvDataNew.SensorBound[0] :=smallint(strtoint('$'+copy(data,19,4)))*0.0625;
   RecvDataNew.SensorBound[1] :=smallint(strtoint('$'+copy(data,23,4)))*0.0625;
   RecvDataNew.SensorBound[2] :=smallint(strtoint('$'+copy(data,27,4)))*0.0625;
   RecvDataNew.SensorBound[3] :=smallint(strtoint('$'+copy(data,31,4)))*0.0625;
   RecvDataNew.ADValue        :=strtoint('$'+copy(data,35,6))/133.333333;
   RecvDataNew.Rate           :=strtoint('$'+copy(data,41,4));
   RecvDataNew.Total          :=strtoint('$'+copy(data,45,5));
   RecvDataNew.Dose           :=strtoint('$'+copy(data,50,4));
   RecvDataNew.Remain         :=strtoint('$'+copy(data,54,4));
   RecvDataNew.DrivesStatus   :=strtoint('$'+copy(data,58,1));
   RecvDataNew.Reaction[0]    :=strtoint('$'+copy(data,59,1));
   RecvDataNew.Reaction[1]    :=strtoint('$'+copy(data,60,1));
   RecvDataNew.Reaction[2]    :=strtoint('$'+copy(data,61,1));
   RecvDataNew.Reaction[3]    :=strtoint('$'+copy(data,62,1));
   RecvDataNew.AFlagsStatus   :=strtoint('$'+copy(data,63,1));
   RecvDataNew.TargetV        :=(strtoint('$'+copy(data,64,4)))/10;
   RecvDataNew.MeasuredV      :=(strtoint('$'+copy(data,68,4)))/10;
   RecvDataNew.StabModeNo     :=(strtoint('$'+copy(data,72,1)));
   RecvDataNew.HeatControlStatus    :=strtoint('$'+copy(data,73,1));
   RecvDataNew.HeatControlSensorNo  :=strtoint('$'+copy(data,74,1));
   RecvDataNew.HeatControlValue     :=strtoint('$'+copy(data,75,4));
   try RecvDataNew.XGZPPressure        :=strtoint('$'+copy(data,79,4))
   except
      RecvDataNew.XGZPPressure        :=-32768;
   end;
   if RecvDataNew.Rate <> 0 then
   begin
        RecvDataNew.RemainT   :=round(3600*RecvDataNew.Remain/RecvDataNew.Rate);
   end
        else
        RecvDataNew.RemainT   :=0;
   mainform.RemainTimePanel.Caption:=getstringtime(RecvDataNew.RemainT);
   mainform.XGZPLabel.Caption:=inttostr(RecvDataNew.XGZPPressure);
end;
//------------------------------------------------------------------------------
procedure parceU(data:string);
begin
dataSource:=ord('U');
  RecvDataNew.TargetV     :=(strtoint('$'+copy(data,3,4)))/10;
  RecvDataNew.MeasuredV   :=(strtoint('$'+copy(data,7,4)))/10;
  RecvDataNew.StabModeNo  :=(strtoint('$'+copy(data,11,1)));
  RecvDataNew.IsInRange   :=(strtoint('$'+copy(data,12,1)));
  RecvDataNew.IsMaxU      :=(strtoint('$'+copy(data,13,1)));
  updatePowerValues(true);
end;
//------------------------------------------------------------------------------
procedure parceV(data:string);
begin
  RecvDataNew.Dose        :=strtoint('$'+copy(data,3,4));
  RecvDataNew.Remain      :=strtoint('$'+copy(data,7,4));
  updatePumpValues(true);
end;
//------------------------------------------------------------------------------
procedure updatePumpValues(force:bool=false);
begin
// выводим темп
   if (RecvDataNew.Rate <> RecvDataOld.Rate) or force then
    begin
        if RecvDataNew.Rate>=0 then mainform.PumpSpeedPanel.Caption:=inttostr(RecvDataNew.Rate)
          else mainform.PumpSpeedPanel.Caption:='---';
        if RateForm.Visible then
        begin
          RateForm.RateTrackBar.Position  :=(RecvDataNew.Rate);
          RateForm.RateEdit.Text          :=inttostr(RecvDataNew.Rate);
        end;
    end;
// выводим итого
   if (RecvDataNew.Total <> RecvDataOld.Total) or force then
    begin
      if RecvDataNew.Total>=0 then mainform.PumpTotalPanel.Caption:=inttostr(RecvDataNew.Total)
      else mainform.PumpTotalPanel.Caption:='---';
    end;
// выводим до автостопа
    if (RecvDataNew.Remain <> RecvDataOld.Remain) or force then
    begin
      if RecvDataNew.Remain>=0 then mainform.PumpRemainPanel.Caption:=inttostr(RecvDataNew.Remain)
      else mainform.PumpRemainPanel.Caption:='---';
    end;
// шаг автостопа
    if (RecvDataNew.Dose <> RecvDataOld.Dose) or force then
    begin
      if RecvDataNew.Dose=0 then mainform.PumpRemainHeaderLabel.Caption:='Авто выкл'
        else
        if RecvDataNew.Dose>=0 then
          mainform.PumpRemainHeaderLabel.Caption:='Авто '+inttostr(RecvDataNew.Dose)
          else
            mainform.PumpRemainHeaderLabel.Caption:='Автостоп';
        if RemainForm.Visible then
        begin
          RemainForm.RemainTrackBar.Position:=(RecvDataNew.Dose);
            //RemainForm.RemainEdit.Text:=inttostr(RecvDataNew.Dose);
            //RemainForm.FormActivate(mainform);
        end;
    end;
       //-----------------------------------------------------------------------
end;
//------------------------------------------------------------------------------
procedure updatePowerValues(force:bool=false);
begin
  if (RecvDataNew.StabModeNo <> RecvDataOld.StabModeNo) or force then
    begin
      ShowForceControlStatus;
      case (RecvDataNew.StabModeNo and $07) of
        0:  begin  // Normal
                if not (mainform.StabModeButtonNormal.Down) then mainform.StabModeButtonNormal.Down:=true;
                mainform.StabLabel.Caption:=format31(RecvDataNew.TargetV);
                mainform.StabInfoPanel.Caption:='P = '+inttostr(round(sqr(RecvDataNew.MeasuredV/
                      HeaterDefaultVoltage)*HeaterDefaultPower))+' вт';
              end;
        1:  begin // Force
                if not (mainform.StabModeButtonForce.Down) then mainform.StabModeButtonForce.Down:=true;
                mainform.StabLabel.Caption:=format31(RecvDataNew.MeasuredV);
                mainform.StabInfoPanel.Caption:=format31(RecvDataNew.TargetV);
              end;
        2:  begin // Stop
                if not (mainform.StabModeButtonStop.Down) then mainform.StabModeButtonStop.Down:=true;
                mainform.StabLabel.Caption:='0';
                mainform.StabInfoPanel.Caption:=format31(RecvDataNew.TargetV);
              end;
        3:  begin
                mainform.StabLabel.Caption:='Авария';
                mainform.StabInfoPanel.Caption:='--';
                mainform.StabModeButtonStop.Down:=false;
                mainform.StabModeButtonNormal.Down:=false;
                mainform.StabModeButtonForce.Down:=false;
              end
          else
              begin
                mainform.StabModeButtonStop.Down:=false;
                mainform.StabModeButtonNormal.Down:=false;
                mainform.StabModeButtonForce.Down:=false;
                mainform.StabLabel.Caption:='---';
                mainform.StabInfoPanel.Caption:='---';
              end;
         end;
       end;
       //-----------------------------------------------------------------------
       // Индикация срыва стабилизации
       if (RecvDataNew.IsMaxU <> RecvDataOld.IsMaxU) or force then
       begin
          if RecvDataNew.IsMaxU<>0 then
            mainform.StabLabel2.Visible:=true
            else
            mainform.StabLabel2.Visible:=false;
       end;

end;
//------------------------------------------------------------------------------
procedure updateAllValues(force:bool=false);
var
  fc: TComponent;
  i:  integer;
  atmo:   Double;
  OH,H2O: Double;
begin
// выводим температуры
  for i:=0 to 3 do
    begin
      if (RecvDataNew.SensorValue[i] <> RecvDataOld.SensorValue[i]) or force then
       begin
        fc:=mainform.FindComponent('T'+inttostr(i)+'Label') as TLabel;
        if (RecvDataNew.SensorValue[i]>=minSensorT) and (RecvDataNew.SensorValue[i]<=maxSensorT)  then
          (fc as TLabel).Caption:=format32(RecvDataNew.SensorValue[i])
        else
          begin
            (fc as TLabel).Caption:='--.--';
          end;
        ShowForceControlStatus;
       end;
       // выводим пороги
       if ((RecvDataNew.SensorBound[i] <> RecvDataOld.SensorBound[i])
            or (RecvDataNew.Reaction[i] <> RecvDataOld.Reaction[i]))
            or force then
       begin
        fc:=mainform.FindComponent('T'+inttostr(i)+'BoundLabel') as TLabel;
        if RecvDataNew.Reaction[i]>=8 then
          (fc as TLabel).Caption:=format32(RecvDataNew.SensorBound[i])
          else
          (fc as TLabel).Caption:='';
       end;
       begin
         if (i=tindex) then
         begin
           sensorform.LabelCurrentT.Caption:=
                    CheckAndFormatValue(floattostr(RecvDataNew.SensorValue[i]),
                                           '----',minSensorT,maxSensorT,3,2,1);
         end;
       end;
    end;
// выводим давление
    if (RecvDataNew.ADValue <> RecvDataOld.ADValue) or force then
    begin
      if (RecvDataNew.ADValue>500)and(RecvDataNew.ADValue<1000) then
      begin
          atmo:=RecvDataNew.ADValue;
          H2O:=1/((1/373.15)-(461.5/2257000)*ln(atmo/760))-273.15;
          OH:=1/((1/351.3)-(180.74/850000)*ln(atmo/760))-273.15;
          mainform.ADLabel.Caption:=format32(atmo);
          InfoForm.AtmoLabel.Caption:=format32(atmo);
          InfoForm.H2OLabel.Caption:=format32(H2O);
          InfoForm.OHLabel.Caption:=format32(OH);
      end
      else
      begin
         mainform.ADLabel.Caption:='---.--';
          InfoForm.AtmoLabel.Caption:='--';
          InfoForm.H2OLabel.Caption:='--';
          InfoForm.OHLabel.Caption:='--';
      end;
    end;

    //    mainform.RemainTimePanel.Caption:=getstringtime(RecvDataNew.RemainT);

    if (RecvDataNew.XGZPPressure <> RecvDataOld.XGZPPressure) or force then
    begin
      if(RecvDataNew.XGZPPressure<>-32768) then
         mainform.XGZPLabel.Caption:=inttostr(RecvDataNew.XGZPPressure)
      else
        mainform.XGZPLabel.Caption:='--'
    end;
//-----------------------------------------------------------------------
        updatePumpValues();
        updatePowerValues();
// Кнопки насоса
       if RecvDataNew.AFlagsStatus=1 then mainform.PumpStartButton.Down:=true
                        else mainform.PumpStopButton.Down:=true;

// Вывод состояния и значений контроля разгона
// Статус контроля разгона
       if (RecvDataOld.HeatControlStatus<>RecvDataNew.HeatControlStatus) then
        begin
          RegulatorForm.ForceControlCheckBox.Checked:=bool(RecvDataNew.HeatControlStatus);
          ShowForceControlStatus;
        end;
       // Номер датчика
       if (RecvDataOld.HeatControlSensorNo<>RecvDataNew.HeatControlSensorNo) then
        begin
          RegulatorForm.SensorsNameComboBox.ItemIndex:=RecvDataNew.HeatControlSensorNo;
          ShowForceControlStatus;
        end;
       // Величина порога
       if (RecvDataOld.HeatControlValue<>RecvDataNew.HeatControlValue) then
        begin
          RegulatorForm.ForceBoundEdit.Text:=format32(RecvDataNew.HeatControlValue*0.0625);
          ShowForceControlStatus;
        end;

        // Astatus
        if (RecvDataOld.AFlagsStatus<>RecvDataNew.AFlagsStatus) then showPACStatus();

        // driveStatus
        if (RecvDataOld.DrivesStatus<>RecvDataNew.DrivesStatus) then showPACStatus();

        if (RecvDataOld.StabModeNo<>RecvDataNew.StabModeNo) then showPACStatus();

end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                                                          скрыть/показать график и значение давления XGZP
procedure showhideXGZP();
var
  isvisible:  bool;
begin
  isvisible:=mainsettingsform.PressureGrafVisibleCheckBox.Checked;
  if isvisible then
                begin
                  (AxisYT as TChartAxis).EndPosition:=70;
                end
                else
                begin
                  (AxisYT as TChartAxis).EndPosition:=85;
                end;
end;
//------------------------------------------------------------------------------
//                                                          показать теоретические значения температур кипения
procedure TMainForm.ADLabelClick(Sender: TObject);
begin
  InfoForm.Visible := not(InfoForm.Visible) ;
  InfoForm.Position:= poOwnerFormCenter;
end;
//------------------------------------------------------------------------------
//                                                          предварительная обработка принятого пакета данных
procedure TMainForm.ComDataPacketPacket(Sender: TObject; const Str: string);
var
  prefix:     string;
begin
  Timer2.Enabled:=false;
  HaveNewData:=true;
  RightPanel.Enabled:=true;
  StabPanel.Enabled:=true;
  PumpPanel.Enabled:=true;
  RecvDataOld:=RecvDataNew;

  prefix:=Str[1];
  if prefix='W' then  begin
                        parceW(Str);
                      end;
  if prefix='T' then  begin
                        parceT(Str);
                      end;
  if prefix='U' then parceU(Str);
  if prefix='V' then parceV(Str);
  if prefix='S' then RecvDataNew.Rate:=strtoint('$'+copy(Str,3,4));
  if prefix='Z' then
    begin
      stepsfor100ml:=strtoint('$'+copy(Str,3,8));
      mainsettingsform.Label100mlCount.Caption:=inttostr(stepsFor100ml);
    end;
    updateAllValues(false); // выводим новые данные на экран
  ComDataPacket.ResetBuffer;
  Timer2.Enabled:=true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ComPortAfterOpen(Sender: TObject);
begin
  ComPort.WriteStr('Z0'+#13);
end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                                                          рисовалка "курсора"
procedure TMainForm.DBChart1AfterDraw(Sender: TObject);
  var
  //xv,yv,yy:  double;
  x,dx,y,dy,v,w,tw,th: integer;
  z:  double;
  ww: TDateTime;
  v0,v1,v2,v3,v4,v5,time,data: string;
begin
  y:=DBChart1.ChartRect.Top;
  dx:=5;
  dy:=15;
  v:=round(vizirX);
  ww:=(vizirX+DBChart1.MinXValue(DBChart1.BottomAxis))/86400;
  datetimetostring(time,'hh:nn.ss',ww);
  if v>0 then
  begin
    z:=DBChart1.Series[0].YValue[v];
      if (z>=-55) and (z<128) then
      begin
        v0:=floattostrf(z,ffFixed,5,2)
      end
      else v0:='.....';
    z:=DBChart1.Series[1].YValue[v];
    if (z>=-55) and (z<128) then
      v1:=floattostrf(DBChart1.Series[1].YValue[v],ffFixed,5,2) else v1:='.....';
    z:=DBChart1.Series[2].YValue[v];
    if (z>=-55) and (z<128) then
      v2:=floattostrf(DBChart1.Series[2].YValue[v],ffFixed,5,2) else v2:='.....';
    z:=DBChart1.Series[3].YValue[v];
    if (z>=-55) and (z<128) then
      v3:=floattostrf(DBChart1.Series[3].YValue[v],ffFixed,5,2) else v3:='.....';
    z:=DBChart1.Series[4].YValue[v];
    if (z>=400) and (z<1000) then
      v4:=floattostrf(DBChart1.Series[4].YValue[v],ffFixed,5,2) else v4:='.....';
    z:=DBChart1.Series[5].YValue[v];
    if (z<>9999) then
      v5:=floattostrf(DBChart1.Series[5].YValue[v],ffFixed,5,0) else v5:='.....';

    x:=cursorX;//DBChart1.GetCursorPos.X;
    if (x>DBChart1.ChartRect.Left) and (x < DBChart1.ChartRect.Right) then
    begin
    With DBChart1 do
          begin
                Canvas.Pen.Color:=$3399FF;
                Canvas.Pen.Width:=3;
                Canvas.Pen.Style:=psdot;

//                Canvas.MoveTo( X, ChartRect.Top);
//                Canvas.LineTo( X, ChartRect.Bottom);

                //Canvas.Font.Name := 'Arial';
                //Canvas.Font.Size := 10;
                th:=(ChartRect.Bottom-ChartRect.Top) div 40;
                Canvas.Font.Height:=-th;
                //MainForm.Label1.Caption:=inttostr(th);
                dy:=th+1;
                //Canvas.Font.Style := [fsbold];
                //Brush.Color := DBChart1.Color;
                //Brush.Style := bssolid;

                tw:=Canvas.TextWidth('T0 = 88.88');
                dy:=Canvas.TextHeight('T');

                if (x>(DBChart1.ChartRect.Right-tw)) then
                begin
                    //dx := Round(DBChart1.ChartRect.Right*(-0.07));
                    tw := 0-tw;
                end
                else
                    tw := 5;

                Canvas.Font.Color := sensorColor[0];
                if (Series[0] as TLineSeries).Visible=true then
                  begin
                    //tw:=Canvas.TextWidth('T0 = '+v0);
                    Canvas.TextOut(X+tw,(y),'T0 = '+v0);
                    y:=y+dy;
                  end;
                Canvas.Font.Color := sensorColor[1];
                
                if (Series[1] as TLineSeries).Visible=true then
                  begin
                    Canvas.TextOut(X+tw,(y),'T1 = '+v1);
                    y:=y+dy;
                  end;
                Canvas.Font.Color := sensorColor[2];
                
                
                if (Series[2] as TLineSeries).Visible=true then
                  begin
                    Canvas.TextOut(X+tw,(y),'T2 = '+v2);
                    y:=y+dy;
                  end;
                Canvas.Font.Color := sensorColor[3];
                
                if (Series[3] as TLineSeries).Visible=true then
                  begin
                    Canvas.TextOut(X+tw,(y),'T3 = '+v3);
                    y:=y+dy;
                  end;

                Canvas.MoveTo( X, ChartRect.Top);
                Canvas.LineTo( X, ChartRect.Bottom);

               // атмосферное давление
                //y:=ChartRect.Bottom - dy;
                if (Series[4] as TLineSeries).Visible  then
                 begin
                   y:=Round(ChartRect.Bottom*AxisYP.StartPosition/100-dy*0.8);
                   Canvas.Font.Color := sensorColor[4];
                 if tw<0 then
                  begin
                   Canvas.TextOut(X-Canvas.TextWidth(v4),y,v4);
                  end
                  else
                    Canvas.TextOut(X+tw,(y),v4);
                end;
               // давление
                //y:=ChartRect.Bottom - dy;
                if (Series[5] as TLineSeries).Visible  then
                begin
                  y:=Round(ChartRect.Bottom*AxisYX.StartPosition/100-dy*0.8);
                  Canvas.Font.Color := sensorColor[5];
                 if tw<0 then
                 begin
                    Canvas.TextOut(X-Canvas.TextWidth(v5),y,v5);
                 end
                 else
                   Canvas.TextOut(X+tw,(y),v5);
                end;
                // метка времени
                //y:=Round(ChartRect.Bottom*AxisYT.EndPosition/100);
                y:=DBChart1.ChartRect.Bottom-dy;
                Canvas.Font.Color:=clWhite;
                if tw<0 then
                begin
                  Canvas.TextOut(X-Canvas.TextWidth(time),y,time);
                end
                else
                //Canvas.TextOut(X+dx,y-3*dy,data);
                Canvas.TextOut(X+tw,y,time);
          end;
    end;
  end;
end;
//------------------------------------------------------------------------------
//                                                          включение/выключение "курсора"
procedure TMainForm.DBChart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
  if Button=mbLeft then
  begin
    DBChart1.Series[0].GetCursorValues(vizirX,vizirY);
    vizirX:=vizirX-DBChart1.MinXValue(DBChart1.BottomAxis);
    cursorX:=DBChart1.GetCursorPos.X;
    DBChart1.Invalidate;
    VizirTimer:=180;
  end;
  if Button=mbRight then
  begin
    cursorX:=0;
    DBChart1.Invalidate;
  end;
end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                                                          установка начальных значений при старте
procedure TMainForm.FormCreate(Sender: TObject);
begin
  vizirX := 0;
  vizirY := 0;
  mute := false;
  formatsettings.DecimalSeparator:='.';
    // Настраиваем начальные точки отсчета
  moment:=now;
  appStartMoment:=moment;
  step:=DateTimeToUnix(moment);
  starttime:=DateTimeToUnix(moment);
  timestampOld:=0;
  timestamp:=DateTimeToUnix(moment);

  mainFileName:=StringReplace(ExtractFileName(ParamStr(0)),ExtractFileExt(ParamStr(0)),'',[]);
  createAxes();
  createSeries();
  StabLabel2.Caption:='Стабилизации нет.'+#13+'Требуемое'+#13+'напряжение'+#13+'выше входного.';
end;
//------------------------------------------------------------------------------
//                                                          чтение и применение настроек программы
procedure TMainForm.FormShow(Sender: TObject);
begin
  loadSettingsFromFile();
  saveSettingsToFile();
  createTimeWindowButtons();
  createFileSystem();
  createDB();
  //createAxes();
  //createSeries();
  reLoadDataFromDB();
  SetOutBoundValues();
  RecvDataOld:=RecvDataNew;
  updateAllValues(true);
  ComDataPacket.StartString:='<';
  ComDataPacket.StopString:='>';
  setSize();
end;
//------------------------------------------------------------------------------
//                                                          сохранение перед закрытием программы
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=false;
    saveSettingsToFile();
    ComPort.Close;
    try CloseFile(logfile) except end;
  CanClose:=true;
end;
//------------------------------------------------------------------------------
//                                                          настройка "горячих" клавиш
procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  x:  TObject;
begin
  if (ssCtrl) in Shift then
  begin
    case Key of
      ord('U'):StabLabelClick(mainform.StabLabel);
      ord('S'):PumpSpeedPanelClick(Self);
      ord('A'):PumpRemainPanelClick(Self);
      ord('0'):T0Label.OnClick(T0Label);
      ord('1'):T0Label.OnClick(T1Label);
      ord('2'):T0Label.OnClick(T2Label);
      ord('3'):T0Label.OnClick(T3Label);
      ord('X'):PumpTotalPanelClick(Sender);
    end;

  end
  else
  if ((ssAlt) in Shift) and (Key in [Ord('0')..Ord('9')])  then
  begin
     x:=mainform.FindComponent('TimeWindowButton'+inttostr(Key-48));
      if x <> nil then
      begin
        (x as TSpeedButton).Down:=true;
        mainform.TimeSelectButtonClick(x as TSpeedButton);
      end;
      //
  end
  else
  if ((ssShift) in Shift) then
  begin
    //
  end
  else
  begin
    case Key of
      ord('Q'):StabModeButtonStopMouseDown(mainform,mbLeft,shift,0,0);
      ord('W'):StabModeButtonNormalMouseDown(mainform,mbLeft,shift,0,0);
      ord('E'):StabModeButtonForceMouseDown(mainform,mbLeft,shift,0,0);
      ord(' '):PumpStartButtonMouseDown(Sender,mbLeft,shift,0,0);
      112:HelpForm.ShowModal;//F1
      27:begin
            if ((RecvDataNew.AFlagsStatus<>1) or (RecvDataNew.StabModeNo=3)) then
                mute:=not mute;//Esc
            if (mute) then
                mainform.Label1.Caption:=#9+'Звук отключен, ESC для включения.'
                else
                begin
                  mainform.Label1.Caption:='';
                  backcounter0:=0;
                end;
        end;
    end;
  end;

end;
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//                                                          изменение размеров элементов дизайна
procedure TMainForm.FormResize(Sender: TObject);
begin
    setSize();
    vizirX := 0;
    InfoForm.Position:= poOwnerFormCenter;
end;
//------------------------------------------------------------------------------
//                                                          установка размеров панелей, шрифтов и т.п.
procedure setSize();
var
  basewidth,baseheight:   integer;
  k                   :   double;
  w,h,ha                :   integer;

begin
  //  ширина и высота основной формы
  basewidth       :=  mainform.Width;
  baseheight      :=  mainform.Height;

  k:=0.12;
  w:=round(basewidth*k);
  //  ширина левой и правой панелей
  mainform.leftpanel.Width     :=  w;
  mainform.rightpanel.Width    :=  w;

  // высоты панелей стабилизатора и насоса
  k:=0.152;
  h:=round(baseheight*k);

  mainform.T0Panel.Height:=h;
  mainform.T1Panel.Height:=h;
  mainform.T2Panel.Height:=h;
  mainform.T3Panel.Height:=h;
  mainform.ADPanel.Height:=h;//round(4*h/5);
  mainform.XGZPPanel.Height:=round(4*h/5);

  ha:=round(h*0.2);
  mainform.T0TopPanel.Height   :=ha;
  mainform.T0BottomPanel.Height:=ha;
  mainform.T1TopPanel.Height   :=ha;
  mainform.T1BottomPanel.Height:=ha;
  mainform.T2TopPanel.Height   :=ha;
  mainform.T2BottomPanel.Height:=ha;
  mainform.T3TopPanel.Height   :=ha;
  mainform.T3BottomPanel.Height:=ha;
  mainform.ADTopPanel.Height   :=ha;
  mainform.ADBottomPanel.Height:=ha;
  mainform.XGZPTopPanel.Height :=ha;


  mainform.StabPanel.Height:=  h+8;
  mainform.StabPanel.Top:=0;
  mainform.StabLabel2.Top:=mainform.StabPanel.Height;
  mainform.PumpPanel.Top:=mainform.StabLabel2.Top+mainform.StabLabel2.Height+2;

  mainform.PumpSpeedPanel.Height:=round(h*0.6)-10;
  mainform.PumpTotalPanel.Height:=round(h*0.6)-10;
  mainform.PumpRemainPanel.Height:=round(h*0.5)-10;

  // высота верхних и нижних частей панелей
  h:=round(h*0.2);

  mainform.StabModePanel.Height  := h;
  mainform.StabInfoPanel.Height  := h;

  mainform.PumpModePanel.Height  := h;
  mainform.PumpSpeedHeaderLabel.Height := h;
  mainform.PumpTotalHeaderLabel.Height := h;
  mainform.PumpRemainHeaderLabel.Height:=h;
  mainform.RemainTimePanel.Height:=h;

 // размер шрифта отображения величин в панелях
  h:=round(baseheight*k*0.55);
  w:=round(w/2.9);

  if (h>w) then h:=w;

  mainform.T0Label.Font.Height       := h ;
  mainform.T1Label.Font.Height       := h ;
  mainform.T2Label.Font.Height       := h ;
  mainform.T3Label.Font.Height       := h ;
  mainform.ADLabel.Font.Height       := h ;
  mainform.ADBottomPanel.Font.Height := h ;
  mainform.XGZPLabel.Font.Height     := h ;


  mainform.StabLabel.Font.Height:=h;
  mainform.PumpSpeedPanel.Font.Height:=h;
  mainform.PumpTotalPanel.Font.Height:=h;
  mainform.PumpRemainPanel.Font.Height:=h;

  // размер шрифта в верхних и нижних частях панелей
  h:=(mainform.T0TopPanel.Height);
  h:=round(0.7*h)+3;

  mainform.T0TopPanel.Font.Height  :=  h;
  mainform.T1TopPanel.Font.Height  :=  h;
  mainform.T2TopPanel.Font.Height  :=  h;
  mainform.T3TopPanel.Font.Height  :=  h;

  mainform.ADTopPanel.Font.Height  := h;
  mainform.XGZPTopPanel.Font.Height  := h;

  mainform.T0BoundLabel.Font.Height  :=  h;
  mainform.T1BoundLabel.Font.Height  :=  h;
  mainform.T2BoundLabel.Font.Height  :=  h;
  mainform.T3BoundLabel.Font.Height  :=  h;

  mainform.ADLabelMin.Font.Height    :=  h;
  mainform.ADLabelMax.Font.Height    :=  h;

  mainform.StabInfoPanel.Font.Height:=h;

  mainform.PumpSpeedHeaderLabel.Font.Height:=h;
  mainform.PumpTotalHeaderLabel.Font.Height:=h;
  mainform.PumpRemainHeaderLabel.Font.Height:=h;
  mainform.RemainTimePanel.Font.Height:=h;
  mainform.ForceInfoLabel.Font.Height:=h;

  // ширина кнопок управления стабилизатором
  w:=mainform.StabPanel.Width;
  w:=round(w/3);
  h:=mainform.StabModePanel.Height;

  mainform.StabModeButtonStop.Width:=w;
  mainform.StabModeButtonStop.Height:=h;
  mainform.StabModeButtonStop.Left:=0;

  mainform.StabModeButtonNormal.Width:=w;
  mainform.StabModeButtonNormal.Height:=h;
  mainform.StabModeButtonNormal.Left:=mainform.StabModeButtonStop.Left+mainform.StabModeButtonStop.Width;

  mainform.StabModeButtonForce.Width:=w;
  mainform.StabModeButtonForce.Height:=h;
  mainform.StabModeButtonForce.Left:=mainform.StabModeButtonNormal.Left+mainform.StabModeButtonNormal.Width;

  w:=round(mainform.PumpModePanel.Width/2 - 5);

  mainform.PumpStopButton.Width:=w;
  mainform.PumpStartButton.Width:=w;

  mainform.MsgLabel.Height:=round(mainform.CenterPanel.Height/20)+0;
  mainform.MsgLabel.Font.Size:=12+round((mainform.CenterPanel.Height-400)/100);
  //---------------------------
end;
//------------------------------------------------------------------------------
//                                                          вызов формы общих настроек
procedure TMainForm.ServiceSpeedButtonClick(Sender: TObject);
var
  n : integer;
  txt:  string;
begin
  txt:='Z0'+#13;
  try comport.WriteStr(txt) ; except  end;

  portList:=listComPorts;

  with mainsettingsform do
  begin
      ComComboBox.Items.Clear;
      ComComboBox.Items.Assign(portList);
      ComComboBox.Text:=portName;
  //  ComComboBox.ApplySettings;
      ComComboBox.Show;

      HeaterSettingsEnableCheckBox.Checked:=false;
      Save100mlCheckBox.Checked:=false;
      Save100mlCheckBox.Enabled:=false;
      EditNominalPower.Enabled:=false;
      EditNominalVoltage.Enabled:=false;
      EditNominalPower.Text:=inttostr(HeaterDefaultPower);
      EditNominalVoltage.Text:=inttostr(HeaterDefaultVoltage);

      CheckBox100mlEnabled.Checked:=false;
      Label100mlCount.Caption:=inttostr(StepsFor100ml);
      Edit100mlCount.Enabled:=false;
      Edit100mlCount.Text:=inttostr(StepsFor100ml);

      CheckBoxSoundsOn.Checked:=sounds;
      CheckBoxDisconnect.Checked:=lostconnSnd;
      CheckBoxOverheat.Checked:=overheatSnd;
      CheckBoxAutostop.Checked:=autostopSnd;
  end;

  n:=mainsettingsform.ShowModal;

  if n=mrOk then
  begin
//------------------------------------------------------------------------------
    portName:=mainsettingsform.ComComboBox.Text;
    ComPort.Port:=portName;
    try n:=strtoint(mainsettingsform.EditNominalPower.Text) except n:=HeaterDefaultPower end;
    HeaterDefaultPower:=n;
    try n:=strtoint(mainsettingsform.EditNominalVoltage.Text) except n:=HeaterDefaultVoltage end;
    HeaterDefaultVoltage:=n;
    try n:=strtoint(mainsettingsform.Edit100mlCount.Text) except n:=StepsFor100ml end;
    if(mainsettingsform.CheckBox100mlEnabled.Checked) then
    begin
    if (n <> StepsFor100ml) then
      begin
        txt:='Z'+inttostr(ord(mainsettingsform.Save100mlCheckBox.Checked))+inttohex(n,8)+#13;
        try mainform.ComPort.WriteStr(txt) except end;
      end;
    end;
    savesettingstofile;
//------------------------------------------------------------------------------
  end;
  if mainsettingsform.PressureGrafVisibleCheckBox.Checked then (AxisYT as TChartAxis).EndPosition:=70
                  else (AxisYT as TChartAxis).EndPosition:=85;

end;
//------------------------------------------------------------------------------
//                                                          вызов настройки дозатора
procedure TMainForm.PumpRemainPanelClick(Sender: TObject);
var
  n:    integer;
  txt:  string;
begin
  n:=RemainForm.ShowModal;
  if n=mrOk then
  begin
    txt:='V'+inttohex(strtoint(RemainForm.RemainEdit.Text),4)+#13;
    try mainform.ComPort.WriteStr(txt) ; except  end;
  end;
end;
//------------------------------------------------------------------------------
//                                                          вызов настройки скорости отбора
procedure TMainForm.PumpSpeedPanelClick(Sender: TObject);
var
  txt:  string;
  n:  integer;
begin
  n:=RateForm.ShowModal;
  if n=mrOk then
  begin
    txt:='P'+inttohex(strtoint(RateForm.RateEdit.Text),4)+#13;
    try mainform.ComPort.WriteStr(txt) ; except  end;
  end;
end;
//------------------------------------------------------------------------------
//                                                          старт стоп отбора
procedure TMainForm.PumpStartButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  txt:  string;
begin
    txt:='R0'+#13;
    try comport.WriteStr(txt) ; except  end;
end;
//------------------------------------------------------------------------------
//                                                          запрос на обнуление счетчика отбора
procedure TMainForm.PumpTotalPanelClick(Sender: TObject);
var
  buttonSelected : Integer;
  txt:  string;
begin
    buttonSelected := MessageDlg('Обнулить счетчик отбора?',mtConfirmation,
                              [mbYes,mbNo], 0);
    if buttonSelected=mrYes then
    begin
      txt:='Z1'+#13;
      try mainform.comport.WriteStr(txt) ; except  end;
    end;
end;
//------------------------------------------------------------------------------
//                                                          вызов формы управления стабилизатором
procedure TMainForm.StabLabelClick(Sender: TObject);
begin
  RegulatorForm.ShowModal;
end;
//------------------------------------------------------------------------------
//                                                          включение режима разгона
procedure TMainForm.StabModeButtonForceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  txt:  string;
begin
  if ((not StabModeButtonForce.Down) and(RecvDataNew.StabModeNo<>3)) then
    begin
      txt:='U1'+#13;
      try comport.WriteStr(txt) ; except  end;
    end;
end;
//------------------------------------------------------------------------------
//                                                          включение режима стабилизации
procedure TMainForm.StabModeButtonNormalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  txt:  string;
begin
  if ((not StabModeButtonNormal.Down) and(RecvDataNew.StabModeNo<>3)) then
    begin
      txt:='U0'+#13;
      try comport.WriteStr(txt) ; except  end;
    end;
    //mainform.StabLabel.Caption:='*|*';
end;
//------------------------------------------------------------------------------
//                                                          включение режима стоп
procedure TMainForm.StabModeButtonStopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  txt:  string;
begin
//  StabModeButtonStop.Down:=true;
  if ((not StabModeButtonStop.Down) and(RecvDataNew.StabModeNo<>3)) then
    begin
      txt:='U2'+#13;
      try comport.WriteStr(txt) ; except  end;
    end;
    //mainform.StabLabel.Caption:='*|*';
end;
//------------------------------------------------------------------------------
//                                                          настройка температурных сенсоров
procedure TMainForm.T_LabelClick(Sender: TObject);
var
  i:  integer;
  n,txt,marginT,reactCode,newname:  string;
  fc: TComponent;
begin
  n:=(Sender as TLabel).Name[2];
  i:=strtoint(n);
  tindex:=i;

  Sensorform.Caption:='Настройка датчика '+n;
  Sensorform.EditName.Text:=Sensorname[i];
  //Sensorform.EEPROMCheckBox.Checked:=false;

  n:=floattostr(RecvDataNew.SensorBound[i]);
  Sensorform.EditMargin.Text:=CheckAndFormatValue(n,'~~~',MinSensorT,maxSensorT,3,2);
  n:=floattostr(RecvDataNew.SensorValue[i]);
  Sensorform.LabelCurrentT.Caption:=CheckAndFormatValue(n,'~~~',minSensorT,maxSensorT,3,2);
    marginT:=inttohex(round((RecvDataNew.SensorBound[i])*16),4);
    reactCode:=inttohex(RecvDataNew.Reaction[i],1);
    txt:='M'+inttostr(tindex)+marginT+reactCode+#13;
    newname:=SensorForm.EditName.Text;

  i:=SensorForm.ShowModal;
  if (i=mrOk) then
  begin
    marginT:=inttohex(round(strtofloat(SensorForm.EditMargin.Text)*16),4);
    reactCode:=inttohex(8*ord(SensorForm.CheckBoxReactionOn.Checked)+
                    1*ord(SensorForm.CheckBoxSound.Checked)+
                    2*ord(SensorForm.CheckBoxPumpStop.Checked)+
                    4*ord(SensorForm.CheckBoxHeaterOff.Checked),1);
    txt:='M'+inttostr(tindex)+marginT+reactCode+#13;
    try mainform.ComPort.WriteStr(txt) except end ;
    newname:=SensorForm.EditName.Text;
    if (SensorName[tindex] <> newname) then
    begin
      n:='T'+inttostr(tindex)+'TopPanel';
      fc:=findcomponent(n);
      (fc as TPanel).Caption:=newname;
      SensorName[tindex]:=newname;
      saveSettingsToFile;
    end;

  end
  else
  if (i=mrCancel) then
  begin
    try mainform.ComPort.WriteStr(txt) except end ;
    //newname:=SensorForm.EditName.Text;
    if (SensorName[tindex] <> newname) then
    begin
      n:='T'+inttostr(tindex)+'TopPanel';
      fc:=findcomponent(n);
      (fc as TPanel).Caption:=newname;
      SensorName[tindex]:=newname;
      saveSettingsToFile;
    end;
  end;
end;
//------------------------------------------------------------------------------
//                                                          таймер временной сетки 1 сек
procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  moment:=now;
  timestamp:=DateTimeToUnix(moment);
  if not(timestamp=timestampOld) then
  begin
    if ComPort.Connected then mainform.Shape1.Brush.Color:=clGreen
                              else mainform.Shape1.Brush.Color:=clRed;
    step:=step+1;
    timestampold:=timestamp;

    saveDataToFileAndToDB();    // записываем данные в файл и базу
    if VizirTimer>0 then VizirTimer:=VizirTimer-1 else VizirX:=0;
    if HaveNewData=true then
    begin
      addPointsToGraph(RecvDataNew);
      end
      else
    begin
      addNullToGraph;
    end;
    //
    if backcounter0=0 then
    begin
      case voiceNo of
        0:;
        1:begin
            backcounter0:=2;
            if (sounds and (not mute)) then PlaySoundW('overheat', hInstance, SND_RESOURCE or SND_ASYNC);
          end;
        2:
          begin
            backcounter0:=4;
            if (sounds and (not mute)) then PlaySoundW('autostop', hInstance, SND_RESOURCE or SND_ASYNC);
          end;
        3:;
      end;
    end
    else
    begin
      dec(backcounter0);
    end;
  end;

end;
//------------------------------------------------------------------------------
//                                                          таймер отсутствия входных данных
procedure TMainForm.Timer2Timer(Sender: TObject);
var
  x,y:  boolean;
  n:  integer;
  txt:  string;
begin
  Timer2.Interval:=5000;

  RightPanel.Enabled:=false;
  StabPanel.Enabled:=false;
  PumpPanel.Enabled:=false;
  if RateForm.Visible       then RateForm.RateCancel.Click;
  if RegulatorForm.Visible  then RegulatorForm.RegulatorCancel.Click;
  if SensorForm.Visible     then SensorForm.SensorCancel.Click;
  SetOutBoundValues;
  updateAllValues(true);
  HaveNewData:=false;
  mainform.RemainTimePanel.Caption:='-----';

  voiceNo:=0;
  backcounter0:=0;
  n:=0;

  portList:=ListComPorts();
  x:=portList.Find(PortName,n);
  if x then txt:=portList[n] else txt:='Null';
  y:=comPort.Connected;
  if x then
  begin
    if not y then
    begin
      try comport.Connected:=true; except  end;
      mainform.Shape1.Brush.Color:=clRed;
        MsgLabel.Visible:=true;
        MsgLabel.Caption:='Порт '+portName+' нет связи.'
                    +' '+'Попытка подключиться.';
    end
    else
    begin
      if backcounter1=2 then
      begin
        try comport.Connected:=false; except  end;
        ComDataPacket.ResetBuffer;
        backcounter1:=0;
      end
      else
      begin
        inc(backcounter1);
      end;
        MsgLabel.Visible:=true;
        MsgLabel.Caption:='Не поступают данные с порта '+portName+'.'
                 +' '+'Возможно надо изменить порт.';
    end;
  end
  else
  begin
    if y then
    begin
      try comport.Connected:=false; except  end;
      ComDataPacket.ResetBuffer;
    end;
    MsgLabel.Visible:=true;
        MsgLabel.Caption:='Порт '+portName+' отсутствует в системе.'
                    +' '+'Измените порт или проверьте связь.';
  end;
  y:=comPort.Connected;
  if (lostconnSnd and sounds and (not y) and (not mute))
  then
    PlaySoundW('nodata', hInstance, SND_RESOURCE or SND_ASYNC);
    //sndPlaySound('./sounds/nodata.wav', SND_NODEFAULT Or SND_ASYNC or SND_NOSTOP);
end;
//------------------------------------------------------------------------------
end.
