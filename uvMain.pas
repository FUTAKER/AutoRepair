unit uvMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, ZAbstractTable,
  CheckLst, Menus;

type
  TFvForm = class(TForm)
    rg1: TRadioGroup;
    rb1: TRadioButton;
    rb2: TRadioButton;
    edt1: TEdit;
    btn1: TButton;
    cbb1: TComboBox;
    btn2: TButton;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    mmo2: TMemo;
    edt6: TEdit;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    scrlbx1: TScrollBox;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    lst1: TListBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lst1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FvForm: TFvForm;

implementation

{$R *.dfm}

procedure TFvForm.FormCreate(Sender: TObject);
begin
  dbgrd1 := TDBGrid.Create(FvForm);
  con1 := TZConnection.Create(FvForm);
  ds1 := TDataSource.Create(FvForm);
  zqry1 := TZQuery.Create(FvForm);
//
  try
    con1.HostName := '127.0.0.1';
    con1.Port := 0;
    con1.Protocol := 'mysql-5';
    con1.Database := 'test';
    con1.User := 'serj';
    con1.Password := 'root';
    con1.Connect;
    zqry1.Connection := con1;
    ds1.DataSet := zqry1;
    dbgrd1.DataSource := ds1;
  except
    ShowMessage('Ошибка соединения с БД');
  end;
  cbb1.Visible := False;
  btn2.Visible := False;
  btn4.Visible := False;
  btn3.Visible := False;
  //btn5.Visible := False;
  lbl3.Visible:= False;
  lbl8.Visible:= False;
  edt6.Visible:= False;
  lst1.Items.Clear;
  cbb1.Items.Clear;
end;

procedure TFvForm.lst1Click(Sender: TObject);
begin
//edt1.Text:= lst1.Items[lst1.ItemIndex];
end;

end.

