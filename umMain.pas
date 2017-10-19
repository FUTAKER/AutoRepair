unit umMain;

interface

uses
  uvMain;

type
  TmMain = class
  private
    FView: TFvForm;
  public
    constructor create(AView: TFvForm);
    procedure AddCar;
    procedure Clean_Fields;
    procedure AddMaster;
    procedure MasterСhoose;
    procedure CarInfoUpdate;
    procedure CarSearch;
    procedure OverCar;
    procedure LoadMasters;
    procedure CarChoose;
  end;

var
  Auto_Repair_Model: TmMain;

implementation

uses
  Dialogs;

{ TmMain }

procedure TmMain.AddCar;
begin
  if (FView.edt2.Text = '') or (FView.edt3.Text = '') or (FView.edt4.Text = '') or (FView.edt5.Text = '') or (FView.mmo2.Lines[0] = '') then
  begin
    ShowMessage('Введены не все данные');
  end
  else
  begin
    try
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'INSERT INTO inwork (State_Number,Client_Name,Tel_Number,Car_Model,Breakage) Values ';
      FView.zqry1.SQL.Add('(''' + FView.edt5.Text + ''',''' + FView.edt2.Text + ''',''' + FView.edt3.Text + ''',''' + FView.edt4.Text + ''',''' + FView.mmo2.Text + ''')');
      FView.zqry1.ExecSQL;
      FView.lst1.Items.Add(FView.edt5.Text);
    //
      FView.btn6.Visible := False;
      FView.btn5.Visible := True;
      FView.btn4.Visible := True;
      FView.btn3.Visible := True;
      FView.cbb1.Visible := True;
      FView.btn2.Visible := True;
      FView.lbl3.Visible := True;
      FView.lbl8.Visible := True;
      FView.edt6.Visible := True;
    except
      ShowMessage('Ошибка сохранения данных');
    end;
  end;
end;

procedure TmMain.AddMaster;
begin
  try
    FView.zqry1.SQL.Clear;
    FView.zqry1.SQL.Text := 'UPDATE inwork SET Master_Name = ''' + FView.cbb1.Text + ''' WHERE State_Number = ''' + FView.edt5.Text + '''';
    FView.zqry1.ExecSQL;
    FView.cbb1.Items.Add(FView.cbb1.Text);
  except
    ShowMessage('Ошибка добавления мастера');
  end;
end;

procedure TmMain.CarChoose;
begin
  if FView.rb1.Checked = true then
  begin
    try
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'SELECT Master_Name,Client_Name, Tel_Number, Car_Model,Breakage FROM inwork WHERE State_Number =''' + fview.lst1.Items[FView.lst1.ItemIndex] + ''' ';
      FView.zqry1.Open;
      FView.dbgrd1.DataSource.DataSet.First;
      FView.cbb1.Text := FView.dbgrd1.Columns[0].Field.Text;
      FView.edt2.Text := FView.dbgrd1.Columns[1].Field.Text;
      FView.edt3.Text := FView.dbgrd1.Columns[2].Field.Text;
      FView.edt4.Text := FView.dbgrd1.Columns[3].Field.Text;
      FView.mmo2.Text := FView.dbgrd1.Columns[4].Field.Text;
      FView.edt5.Text := fview.lst1.Items[FView.lst1.ItemIndex];
    except
      ShowMessage('Ошибка Вывода данных с БД');
    end;
  end;
  if FView.rb2.Checked = true then
  begin
    try
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'SELECT Master_Name,Client_Name, Tel_Number, Car_Model,Breakage, End_Time FROM overcars WHERE State_Number =''' + fview.lst1.Items[FView.lst1.ItemIndex] + ''' ';
      FView.zqry1.Open;
      FView.dbgrd1.DataSource.DataSet.First;
      FView.cbb1.Text := FView.dbgrd1.Columns[0].Field.Text;
      FView.edt2.Text := FView.dbgrd1.Columns[1].Field.Text;
      FView.edt3.Text := FView.dbgrd1.Columns[2].Field.Text;
      FView.edt4.Text := FView.dbgrd1.Columns[3].Field.Text;
      FView.mmo2.Text := FView.dbgrd1.Columns[4].Field.Text;
      FView.edt6.Text := FView.dbgrd1.Columns[5].Field.Text;
      FView.edt5.Text := fview.lst1.Items[FView.lst1.ItemIndex];
    except
      ShowMessage('Ошибка Вывода данных с БД');
    end;
  end;
end;

procedure TmMain.CarInfoUpdate;
begin
  try
    FView.zqry1.SQL.Clear;
    FView.zqry1.SQL.Text := ('UPDATE inwork SET State_Number = ''' + FView.edt5.Text + ''',  Client_Name = ''' + FView.edt2.Text + ''',Tel_Number = ''' + FView.edt3.Text + ''',Car_Model = ''' + FView.edt4.Text + ''',Breakage = ''' + FView.mmo2.Text + ''' WHERE State_Number = ''' + fview.lst1.Items[FView.lst1.ItemIndex] + '''');
    FView.zqry1.ExecSQL;
  except
    ShowMessage('Ошибка Обновления данных');
  end;
end;

procedure TmMain.CarSearch;
var
  i: Integer;
begin

  if FView.rb1.Checked = true then
  begin
    if FView.edt1.Text = '' then
    begin
      try
        FView.zqry1.SQL.Clear;
        FView.zqry1.SQL.Text := ('SELECT State_Number FROM inwork');
        FView.zqry1.Open;
        FView.dbgrd1.DataSource.DataSet.First;
        i := 0;
        while not (FView.dbgrd1.DataSource.DataSet.Eof) do
        begin
          FView.lst1.Items.Insert(i, FView.dbgrd1.Fields[0].AsString);
          i := i + 1;
          FView.dbgrd1.DataSource.DataSet.Next;
        end;
      except
        ShowMessage('Ошибка загруски Автомобилей');
      end;
      FView.btn6.Visible := False;
      FView.btn5.Visible := True;
      FView.btn4.Visible := True;
      FView.btn3.Visible := True;
      FView.cbb1.Visible := True;
      FView.btn2.Visible := True;
      FView.lbl3.Visible := True;
      FView.lbl8.Visible := True;
      FView.edt6.Visible := True;
    end
    else
    begin
      try
        FView.zqry1.SQL.Clear;
        FView.zqry1.SQL.Text := ('SELECT State_Number FROM inwork');
        FView.zqry1.Open;
        FView.dbgrd1.DataSource.DataSet.First;
        i := 0;
        while not (FView.dbgrd1.DataSource.DataSet.Eof) do
        begin
          if (Pos(FView.edt1.Text, FView.dbgrd1.Fields[0].AsString) > 0) then
          begin
            FView.lst1.Items.Insert(i, FView.dbgrd1.Fields[0].AsString);
            i := i + 1;
          end;
          FView.dbgrd1.DataSource.DataSet.Next;
        end;
      except
        ShowMessage('Ошибка Поиска');
      end;
      FView.btn6.Visible := False;
      FView.btn5.Visible := True;
      FView.btn4.Visible := True;
      FView.btn3.Visible := True;
      FView.cbb1.Visible := True;
      FView.btn2.Visible := True;
      FView.lbl3.Visible := True;
      FView.lbl8.Visible := True;
      FView.edt6.Visible := True;
    end;
  end;
//


  if FView.rb2.Checked = true then
  begin
    if FView.edt1.Text = '' then
    begin
      try
        FView.zqry1.SQL.Clear;
        FView.zqry1.SQL.Text := ('SELECT State_Number FROM overcars');
        FView.zqry1.Open;
        FView.dbgrd1.DataSource.DataSet.First;
        i := 0;
        while not (FView.dbgrd1.DataSource.DataSet.Eof) do
        begin
          FView.lst1.Items.Insert(i, FView.dbgrd1.Fields[0].AsString);
          i := i + 1;
          FView.dbgrd1.DataSource.DataSet.Next;
        end;
      except
        ShowMessage('Ошибка загруски Автомобилей');
      end;
      FView.btn6.Visible := False;
      FView.btn5.Visible := True;
      FView.btn4.Visible := True;
      FView.btn3.Visible := True;
      FView.cbb1.Visible := True;
      FView.btn2.Visible := True;
      FView.lbl3.Visible := True;
      FView.lbl8.Visible := True;
      FView.edt6.Visible := True;
    end
    else
    begin
      try
        FView.zqry1.SQL.Clear;
        FView.zqry1.SQL.Text := ('SELECT State_Number FROM overcars');
        FView.zqry1.Open;
        FView.dbgrd1.DataSource.DataSet.First;
        i := 0;
        while not (FView.dbgrd1.DataSource.DataSet.Eof) do
        begin
          if (Pos(FView.edt1.Text, FView.dbgrd1.Fields[0].AsString) > 0) then
          begin
            FView.lst1.Items.Insert(i, FView.dbgrd1.Fields[0].AsString);
            i := i + 1;
          end;
          FView.dbgrd1.DataSource.DataSet.Next;
        end;
      except
        ShowMessage('Ошибка поиска');
      end;
      FView.btn6.Visible := False;
      FView.btn5.Visible := True;
      FView.btn4.Visible := True;
      FView.btn3.Visible := True;
      FView.cbb1.Visible := True;
      FView.btn2.Visible := True;
      FView.lbl3.Visible := True;
      FView.lbl8.Visible := True;
      FView.edt6.Visible := True;
    end;
  end;

end;

procedure TmMain.Clean_Fields;
begin
  FView.lst1.Items.Clear;
  FView.mmo2.Clear;
  FView.edt2.Text := '';
  FView.edt3.Text := '';
  FView.edt4.Text := '';
  FView.edt5.Text := '';
  FView.edt6.Text := '';
  FView.cbb1.Visible := False;
  FView.btn2.Visible := False;
  FView.btn4.Visible := False;
  FView.btn3.Visible := False;
  FView.lbl3.Visible := False;
  FView.lbl8.Visible := False;
  FView.edt6.Visible := False;
  FView.cbb1.Text := '';
  FView.btn6.Visible := True;
end;

constructor TmMain.create(AView: TFvForm);
begin
  FView := AView;
end;

procedure TmMain.LoadMasters;
var
  i: Integer;
begin
  try
    FView.zqry1.SQL.Clear;
    FView.zqry1.SQL.Text := ('SELECT Master_Name FROM overcars');
    FView.zqry1.Open;
    FView.dbgrd1.DataSource.DataSet.First;
    i := 0;
    while not (FView.dbgrd1.DataSource.DataSet.Eof) do
    begin
      if (FView.dbgrd1.Fields[0].AsString <> '') and (Pos(FView.dbgrd1.Fields[0].AsString, FView.cbb1.Items.Text) = 0) then
      begin
        FView.cbb1.Items.Insert(i, FView.dbgrd1.Fields[0].AsString);
        i := i + 1;
      end;
      FView.dbgrd1.DataSource.DataSet.Next;
    end;
  except
    ShowMessage('Ошибка загруски мастеров с бд');
  end;
end;

procedure TmMain.MasterСhoose;
begin
  try
    FView.zqry1.SQL.Clear;
    FView.zqry1.SQL.Text := 'UPDATE inwork SET Master_Name = ''' + FView.cbb1.Text + ''' WHERE State_Number = ''' + FView.edt5.Text + '''';
    FView.zqry1.ExecSQL;
  except
    ShowMessage('Ошибка выбора мастера');
  end;
end;

procedure TmMain.OverCar;
begin
  if (FView.edt2.Text = '') or (FView.edt3.Text = '') or (FView.edt4.Text = '') or (FView.edt5.Text = '') or (FView.mmo2.Lines[0] = '') or (FView.edt6.Text = '') or (FView.cbb1.Text = '') then
  begin
    ShowMessage('Введены не все данные');
  end
  else
  begin
    try
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'INSERT INTO overcars (Master_Name,State_Number,Client_Name,Tel_Number,Car_Model,Breakage,End_Time) VALUES (''' + FView.cbb1.Text + ''',''' + FView.edt5.Text + ''',''' + FView.edt2.Text + ''',''' + FView.edt3.Text + ''',''' + FView.edt4.Text + ''',''' + FView.mmo2.Text + ''',''' + Fview.edt6.Text + ''')';
      FView.zqry1.ExecSQL;
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'DELETE FROM inwork WHERE State_Number = ''' + FView.edt5.Text + '''';
      FView.zqry1.ExecSQL;
    except
      ShowMessage('Ошибка Перевода машины');
    end;
  end;
end;

end.

