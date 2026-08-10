unit viewer_main;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Windows,
  TAGraph, TASeries, TATools;

type
  TSOMAShmem = packed record
    magic:           UInt32;
    generation:      UInt64;
    active_colonies: UInt32;
    best_fitness:    Double;
    avg_fitness:     Double;
    diversity:       Double;
    codon_count:     UInt32;
    uptime_secs:     UInt64;
    pad:             array[0..11] of Byte;
  end;

  { TViewerForm }

  TViewerForm = class(TForm)
    BestSeries: TLineSeries;
    AvgSeries: TLineSeries;
    Chart: TChart;
    StatusLabel: TLabel;
    PollTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PollTimerTimer(Sender: TObject);
  private
    ShmemHandle: THandle;
    Shmem: ^TSOMAShmem;
    SampleX: Double;
    Connected: Boolean;
    procedure TryConnect;
  end;

var
  ViewerForm: TViewerForm;

implementation

{$R *.lfm}

const
  SHMEM_NAME = 'SOMA_LiveView';

procedure TViewerForm.FormCreate(Sender: TObject);
begin
  Caption := 'SOMA Live Viewer';
  Width   := 800;
  Height  := 500;

  Chart := TChart.Create(Self);
  Chart.Parent := Self;
  Chart.Align  := alClient;
  Chart.Title.Text.Text := 'Fitness over generations';
  Chart.AxisList.BottomAxis.Title.Caption := 'Sample';
  Chart.AxisList.LeftAxis.Title.Caption   := 'Fitness';

  BestSeries := TLineSeries.Create(Chart);
  BestSeries.Title := 'Best';
  BestSeries.SeriesColor := clRed;
  Chart.AddSeries(BestSeries);

  AvgSeries := TLineSeries.Create(Chart);
  AvgSeries.Title := 'Avg';
  AvgSeries.SeriesColor := clBlue;
  Chart.AddSeries(AvgSeries);

  StatusLabel := TLabel.Create(Self);
  StatusLabel.Parent := Self;
  StatusLabel.Align  := alTop;
  StatusLabel.Caption := 'Connecting...';

  SampleX   := 0;
  Connected := False;
  Shmem     := nil;
  ShmemHandle := 0;

  PollTimer.Enabled  := True;
end;

procedure TViewerForm.TryConnect;
begin
  ShmemHandle := OpenFileMapping(FILE_MAP_READ, False, SHMEM_NAME);
  if ShmemHandle = 0 then
  begin
    Connected := False;
    Exit;
  end;

  Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_READ, 0, 0, SizeOf(TSOMAShmem));
  if Shmem = nil then
  begin
    CloseHandle(ShmemHandle);
    ShmemHandle := 0;
    Connected := False;
    Exit;
  end;

  if Shmem^.magic <> $534F4D41 then
  begin
    UnmapViewOfFile(Shmem);
    CloseHandle(ShmemHandle);
    Shmem := nil;
    ShmemHandle := 0;
    Connected := False;
    Exit;
  end;

  Connected := True;
end;

procedure TViewerForm.PollTimerTimer(Sender: TObject);
begin
  if not Connected then
  begin
    TryConnect;
    if not Connected then
    begin
      StatusLabel.Caption := 'Waiting for SOMA hypervisor...';
      Exit;
    end;
  end;

  // shmem might vanish if hypervisor stops - guard reads
  if Shmem = nil then
  begin
    Connected := False;
    Exit;
  end;

  StatusLabel.Caption := Format(
    'Generation: %d   Colonies: %d   Uptime: %ds   Best: %.4f   Avg: %.4f',
    [Shmem^.generation, Shmem^.active_colonies, Shmem^.uptime_secs,
     Shmem^.best_fitness, Shmem^.avg_fitness]
  );

  BestSeries.AddXY(SampleX, Shmem^.best_fitness);
  AvgSeries.AddXY(SampleX, Shmem^.avg_fitness);
  SampleX := SampleX + 1;

  // keep the chart from growing unbounded over a long run
  if BestSeries.Count > 500 then
  begin
    BestSeries.Delete(0);
    AvgSeries.Delete(0);
  end;
end;

procedure TViewerForm.FormDestroy(Sender: TObject);
begin
  if Shmem <> nil then UnmapViewOfFile(Shmem);
  if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
end;

end.
