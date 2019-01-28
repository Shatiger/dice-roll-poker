unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Rectt:TRect;
  Col,Row:integer;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
s:string;
begin
  s:='Результаты:';
  for i:=1 to Unit1.PlayersCount do
    begin
      s:=s+#13#10+Unit1.Players[i].Name+': '+Form2.StringGrid1.Cells[i,16]+' очков.';
    end;
  MessageDlg(s,mtInformation,[mbOk],0);
  Application.Terminate;
end;

procedure TForm2.FormCreate(Sender: TObject);
var i,j:integer;
begin
  StringGrid1.ColCount:=Unit1.PlayersCount+1;
  StringGrid1.ColWidths[0]:=90;
  StringGrid1.Cells[0,1]:='Единицы';
  StringGrid1.Cells[0,2]:='Двойки';
  StringGrid1.Cells[0,3]:='Тройки';
  StringGrid1.Cells[0,4]:='Четверки';
  StringGrid1.Cells[0,5]:='Пятерки';
  StringGrid1.Cells[0,6]:='Шестерки';
  StringGrid1.Cells[0,7]:='Пара';
  StringGrid1.Cells[0,8]:='Две пары';
  StringGrid1.Cells[0,9]:='Тройка';
  StringGrid1.Cells[0,10]:='Короткий стрит';
  StringGrid1.Cells[0,11]:='Длинный стрит';
  StringGrid1.Cells[0,12]:='Фулхаус';
  StringGrid1.Cells[0,13]:='Каре';
  StringGrid1.Cells[0,14]:='Покер';
  StringGrid1.Cells[0,15]:='Шанс';
  StringGrid1.Cells[0,16]:='СУММА';
  for i:=1 to PlayersCount do
    begin
    StringGrid1.Cells[i,16]:='0';
    for j:=1 to 15 do
      StringGrid1.Cells[i,j]:='';
    StringGrid1.Cells[i,0]:=Unit1.Players[i].Name;
    end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FormCreate(Self);
  Form2.Top:=Form1.Top;
  Form2.Left:=Form1.Left-320;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var Rect:TRect; i,temp:integer;
prov:boolean;
begin
  CanSelect:=false;
  prov:=false;
  if (ARow=1)and(Unit1.Players[CurrentPlayer].One='NA') then prov:=true;
  if (ARow=2)and(Unit1.Players[CurrentPlayer].Two='NA') then prov:=true;
  if (ARow=3)and(Unit1.Players[CurrentPlayer].Three='NA') then prov:=true;
  if (ARow=4)and(Unit1.Players[CurrentPlayer].Four='NA') then prov:=true;
  if (ARow=5)and(Unit1.Players[CurrentPlayer].Five='NA') then prov:=true;
  if (ARow=6)and(Unit1.Players[CurrentPlayer].Six='NA') then prov:=true;
  if (ARow=7)and(Unit1.Players[CurrentPlayer].Pair='NA') then prov:=true;
  if (ARow=8)and(Unit1.Players[CurrentPlayer].TwoPair='NA') then prov:=true;
  if (ARow=9)and(Unit1.Players[CurrentPlayer].Trio='NA') then prov:=true;
  if (ARow=10)and(Unit1.Players[CurrentPlayer].SmallStreet='NA') then prov:=true;
  if (ARow=11)and(Unit1.Players[CurrentPlayer].LongStreet='NA') then prov:=true;
  if (ARow=12)and(Unit1.Players[CurrentPlayer].FullHouse='NA') then prov:=true;
  if (ARow=13)and(Unit1.Players[CurrentPlayer].Kare='NA') then prov:=true;
  if (ARow=14)and(Unit1.Players[CurrentPlayer].Poker='NA') then prov:=true;
  if (ARow=15)and(Unit1.Players[CurrentPlayer].Chance='NA') then prov:=true;
  if(ACol=Unit1.CurrentPlayer)and(ARow<>0)and(ACol<>0)and(Unit1.State=cube_opers)and(prov=true) then
    begin
      Rect:=StringGrid1.CellRect(ACol,ARow);
      StringGrid1.Canvas.Brush.Color:=clWindowFrame;
      StringGrid1.Canvas.FillRect(Rect);
      StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol,ARow]);
      if ARow=1 then Unit1.Players[CurrentPlayer].One:=StringGrid1.Cells[ACol,ARow];
      if ARow=2 then Unit1.Players[CurrentPlayer].Two:=StringGrid1.Cells[ACol,ARow];
      if ARow=3 then Unit1.Players[CurrentPlayer].Three:=StringGrid1.Cells[ACol,ARow];
      if ARow=4 then Unit1.Players[CurrentPlayer].Four:=StringGrid1.Cells[ACol,ARow];
      if ARow=5 then Unit1.Players[CurrentPlayer].Five:=StringGrid1.Cells[ACol,ARow];
      if ARow=6 then Unit1.Players[CurrentPlayer].Six:=StringGrid1.Cells[ACol,ARow];
      if ARow=7 then Unit1.Players[CurrentPlayer].Pair:=StringGrid1.Cells[ACol,ARow];
      if ARow=8 then Unit1.Players[CurrentPlayer].TwoPair:=StringGrid1.Cells[ACol,ARow];
      if ARow=9 then Unit1.Players[CurrentPlayer].Trio:=StringGrid1.Cells[ACol,ARow];
      if ARow=10 then Unit1.Players[CurrentPlayer].SmallStreet:=StringGrid1.Cells[ACol,ARow];
      if ARow=11 then Unit1.Players[CurrentPlayer].LongStreet:=StringGrid1.Cells[ACol,ARow];
      if ARow=12 then Unit1.Players[CurrentPlayer].FullHouse:=StringGrid1.Cells[ACol,ARow];
      if ARow=13 then Unit1.Players[CurrentPlayer].Kare:=StringGrid1.Cells[ACol,ARow];
      if ARow=14 then Unit1.Players[CurrentPlayer].Poker:=StringGrid1.Cells[ACol,ARow];
      if ARow=15 then Unit1.Players[CurrentPlayer].Chance:=StringGrid1.Cells[ACol,ARow];
      temp:=StrToInt(StringGrid1.Cells[ACol,ARow]);
      StringGrid1.Cells[ACol,16]:=IntToStr(StrToInt(StringGrid1.Cells[ACol,16])+temp);
      Rect.Left:=0; Rect.Top:=0; Rect.Right:=50; Rect.Bottom:=50;
      Form1.DrawGrid1.Canvas.FillRect(Rect);
      Rect.Top:=51; Rect.Bottom:=101;
      Form1.DrawGrid1.Canvas.FillRect(Rect);
      Rect.Top:=102; Rect.Bottom:=152;
      Form1.DrawGrid1.Canvas.FillRect(Rect);
      Rect.Top:=153; Rect.Bottom:=203;
      Form1.DrawGrid1.Canvas.FillRect(Rect);
      Rect.Top:=204; Rect.Bottom:=254;
      Form1.DrawGrid1.Canvas.FillRect(Rect);
      Form1.DrawGrid2.Visible:=false;
      Form1.DrawGrid3.Visible:=false;
      Form1.DrawGrid4.Visible:=false;
      Form1.DrawGrid5.Visible:=false;
      Form1.DrawGrid6.Visible:=false;
      Form1.Image2.Visible:=false;
      Form1.Image8.Visible:=true;
      Form1.Button1.Enabled:=true;
      if Unit1.Players[CurrentPlayer].One='NA' then StringGrid1.Cells[CurrentPlayer,1]:='';
      if Unit1.Players[CurrentPlayer].Two='NA' then StringGrid1.Cells[CurrentPlayer,2]:='';
      if Unit1.Players[CurrentPlayer].Three='NA' then StringGrid1.Cells[CurrentPlayer,3]:='';
      if Unit1.Players[CurrentPlayer].Four='NA' then StringGrid1.Cells[CurrentPlayer,4]:='';
      if Unit1.Players[CurrentPlayer].Five='NA' then StringGrid1.Cells[CurrentPlayer,5]:='';
      if Unit1.Players[CurrentPlayer].Six='NA' then StringGrid1.Cells[CurrentPlayer,6]:='';
      if Unit1.Players[CurrentPlayer].Pair='NA' then StringGrid1.Cells[CurrentPlayer,7]:='';
      if Unit1.Players[CurrentPlayer].TwoPair='NA' then StringGrid1.Cells[CurrentPlayer,8]:='';
      if Unit1.Players[CurrentPlayer].Trio='NA' then StringGrid1.Cells[CurrentPlayer,9]:='';
      if Unit1.Players[CurrentPlayer].SmallStreet='NA' then StringGrid1.Cells[CurrentPlayer,10]:='';
      if Unit1.Players[CurrentPlayer].LongStreet='NA' then StringGrid1.Cells[CurrentPlayer,11]:='';
      if Unit1.Players[CurrentPlayer].FullHouse='NA' then StringGrid1.Cells[CurrentPlayer,12]:='';
      if Unit1.Players[CurrentPlayer].Kare='NA' then StringGrid1.Cells[CurrentPlayer,13]:='';
      if Unit1.Players[CurrentPlayer].Poker='NA' then StringGrid1.Cells[CurrentPlayer,14]:='';
      if Unit1.Players[CurrentPlayer].Chance='NA' then StringGrid1.Cells[CurrentPlayer,15]:='';
      Unit1.State:=wait;
      Form1.Label4.Caption:='Нажмите на кнопку "Закончить ход", чтобы передать ход следующему игроку.';
      Form1.Memo1.Lines.Add('Игрок '+Unit1.Players[Unit1.CurrentPlayer].Name+' записал комбинацию '+StringGrid1.Cells[0,ARow]+' ('+StringGrid1.Cells[Unit1.CurrentPlayer,ARow]+' очков).');
      for i:=0 to 4 do
        begin
          Slot[i]:=0;
          Stakan[i]:=0;
        end;
    end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var i:integer;
begin
  for i:=1 to PlayersCount do
    begin
      if Players[i].One<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,1);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,1]);
        end;
      if Players[i].Two<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,2);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,2]);
        end;
      if Players[i].Three<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,3);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,3]);
        end;
      if Players[i].Four<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,4);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,4]);
        end;
      if Players[i].Five<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,5);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,5]);
        end;
      if Players[i].Six<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,6);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,6]);
        end;
      if Players[i].Pair<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,7);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,7]);
        end;
      if Players[i].TwoPair<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,8);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,8]);
        end;
      if Players[i].Trio<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,9);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,9]);
        end;
      if Players[i].SmallStreet<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,10);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,10]);
        end;
      if Players[i].LongStreet<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,11);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,11]);
        end;
      if Players[i].FullHouse<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,12);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,12]);
        end;
      if Players[i].Kare<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,13);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,13]);
        end;
      if Players[i].Poker<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,14);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,14]);
        end;
      if Players[i].Chance<>'NA' then
        begin
          Rect:=StringGrid1.CellRect(i,15);
          StringGrid1.Canvas.Brush.Color:=clWindowFrame;
          StringGrid1.Canvas.FillRect(Rect);
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[i,15]);
        end;
    end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=False;
  if MessageDlg('Вы действительно хотите выйти?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    CanClose:=True;
end;

end.
 