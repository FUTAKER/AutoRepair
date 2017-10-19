program Project1;

uses
  Forms,
  uvMain in 'uvMain.pas' {FvForm},
  umMain in 'umMain.pas',
  ucMain in 'ucMain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFvForm, FvForm);
  Auto_Repair_Model:=TmMain.create(FvForm);
  Auto_Repair_Controller:=TcMain.create(FvForm,Auto_Repair_Model);
  Auto_Repair_Model.LoadMasters;
  Application.Run;
end.
