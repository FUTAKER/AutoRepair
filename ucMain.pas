unit ucMain;

interface

uses
  uvMain, umMain;
type TcMain= class
  private
  FView:TFvForm;
  FModel:TmMain;
  public
  constructor create(AView:TFvForm;AModel:TmMain);
  procedure AddClick(Sender:TObject);
  procedure CleanClick(Sender:TObject);
  procedure MasterAddClick(Sender:TObject);
  procedure MasterChooseClick(Sender:TObject);
  procedure CarInfoUpdateClick(Sender:TObject);
  procedure CarSearchClick(Sender:TObject);
  procedure OverCarClick(Sender:TObject);
  procedure CarChooseClick(Sender:TObject);
end;
var
Auto_Repair_Controller:TcMain;

implementation

{ TcMain }

procedure TcMain.AddClick(Sender: TObject);
begin
FModel.AddCar;
end;

procedure TcMain.CarChooseClick(Sender: TObject);
begin
FModel.CarChoose;
end;

procedure TcMain.CarInfoUpdateClick(Sender: TObject);
begin
FModel.CarInfoUpdate;
end;

procedure TcMain.CarSearchClick(Sender: TObject);
begin
FModel.CarSearch;
end;

procedure TcMain.CleanClick(Sender: TObject);
begin
FModel.Clean_Fields;
end;

constructor TcMain.create(AView: TFvForm; AModel: TmMain);
begin
FView:=AView;
FModel:=AModel;
FView.btn6.OnClick:=AddClick;
FView.btn5.OnClick:=CleanClick;
FView.btn2.OnClick:=MasterAddClick;
FView.btn4.OnClick:=CarInfoUpdateClick;
FView.btn1.OnClick:=CarSearchClick;
FView.btn3.OnClick:=OverCarClick;
FView.cbb1.OnSelect:=MasterChooseClick;
FView.lst1.OnClick:=CarChooseClick;
end;

procedure TcMain.MasterAddClick(Sender: TObject);
begin
FModel.AddMaster;
end;

procedure TcMain.MasterChooseClick(Sender: TObject);
begin
FModel.Master—hoose;
end;

procedure TcMain.OverCarClick(Sender: TObject);
begin
FModel.OverCar;
end;

end.
