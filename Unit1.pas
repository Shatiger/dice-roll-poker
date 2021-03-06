unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DrawGrid1: TDrawGrid;
    Memo1: TMemo;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    DrawGrid2: TDrawGrid;
    DrawGrid3: TDrawGrid;
    DrawGrid4: TDrawGrid;
    DrawGrid5: TDrawGrid;
    DrawGrid6: TDrawGrid;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Button1: TButton;
    DrawGrid7: TDrawGrid;
    Label5: TLabel;
    Image8: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DrawGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DrawGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DrawGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DrawGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DrawGrid6SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DrawGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid5DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid6DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  States=(move_start,cube_opers,from_stakan,from_slot,wait); //��� ��������� ����
  TPlayer=record   //��� ������
    Name:string[20];    //���
    One:string[2];      //����������
    Two:string[2];
    Three:string[2];
    Four:string[2];
    Five:string[2];
    Six:string[2];
    Pair:string[2];
    TwoPair:string[2];
    Trio:string[2];
    SmallStreet:string[2];
    LongStreet:string[2];
    FullHouse:string[2];
    Kare:string[2];
    Poker:string[2];
    Chance:string[2];
  end;

var
  Form1: TForm1;
  Slot:array[0..4] of 0..6; //������ ������, � ������� ������������, ����� ����� ��������� ������ ������� ���������� �����
  Stakan:array[0..4] of 0..6; //������ ������ �������, � ������� ������������, ����� ����� ��������� ������ ������� ���������� �����
  Cubes:array[0..4] of 0..6; //������ ������� �� ������� � ������ (��� �������� ���������� �������)
  Players:array[1..8] of TPlayer; //������ �������
  State:States; //������� ��������� ����
  ChosenCube:0..6; //��������� �����
  ChosenPos:byte; //��������� �������
  CurrentPlayer:byte; //������� �����
  NextPlayer:byte; //��������� �����
  CurrentMove:byte; //����� �������� ����
  CurrentThrow:byte; //����� �������� ������
  PlayersCount:byte; //���������� �������
  CubesCount:byte; //���������� ������� � �������
  CellChosen:byte; //��������� ������

implementation

uses Unit4, Unit2, Unit5, Unit6;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
  var i:integer;
begin
  Form2.Top:=Form1.Top;
  Form2.Left:=Form1.Left-330;
  Memo1.Clear;
  PlayersCount:=Unit4.PlayersCount;
  for i:=1 to PlayersCount do
    begin
      Players[i].Name:=Unit4.Names[i];
    end;
  for i:=1 to PlayersCount do
    begin
      Players[i].One:='NA';
      Players[i].Two:='NA';
      Players[i].Three:='NA';
      Players[i].Four:='NA';
      Players[i].Five:='NA';
      Players[i].Six:='NA';
      Players[i].Pair:='NA';
      Players[i].TwoPair:='NA';
      Players[i].Trio:='NA';
      Players[i].SmallStreet:='NA';
      Players[i].LongStreet:='NA';
      Players[i].Six:='NA';
      Players[i].FullHouse:='NA';
      Players[i].Kare:='NA';
      Players[i].Poker:='NA';
      Players[i].Chance:='NA';
    end;
  label1.Caption:='������� �����: '+Players[1].Name;
  label2.Caption:='��������� �����: '+Players[2].Name;
  State:=move_start;
  CurrentThrow:=0;
  CurrentMove:=1;
  //CurrentMove:=15;
  CurrentPlayer:=1;
  NextPlayer:=2;
  ChosenCube:=0;
  for i:=0 to 4 do
    Slot[i]:=0;
  CubesCount:=5;
  Label4.Caption:='��� ������ '+Players[1].Name+'. ������� �� ������, ����� ��������� �����.';
  Image2.Visible:=true;
  Button1.Enabled:=false;
end;

procedure SlotStakanToCube;             //����������� ������ �� �������
var i,j:integer;                        //� �� ������
begin
j:=-1;
  for i:=0 to 4 do
    begin
      if Stakan[i]<>0 then
        begin
          inc(j);
          Cubes[j]:=Stakan[i];
        end;
      if Slot[i]<>0 then
        begin
          inc(j);
          Cubes[j]:=Slot[i];
        end;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure CombTableEdit;                  //��������� ������� ����������
var i,j,Sum:integer;
cas:boolean;
cubeCount:array[1..6] of integer;
begin
  Sum:=0;
  SlotStakanToCube;
  //������ � ����������� "�������"
  if(Players[CurrentPlayer].One = 'NA') then
    begin
      for i:=0 to 4 do
        begin
          if(Cubes[i]=1) then Sum:=Sum+1;
        end;
      Form2.StringGrid1.Cells[CurrentPlayer,1]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "������"
  if(Players[CurrentPlayer].Two = 'NA') then
    begin
      for i:=0 to 4 do
        begin
          if(Cubes[i]=2) then Sum:=Sum+2;
        end;
      Form2.StringGrid1.Cells[CurrentPlayer,2]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "������"
  if(Players[CurrentPlayer].Three = 'NA') then
    begin
      for i:=0 to 4 do
        begin
          if(Cubes[i]=3) then Sum:=Sum+3;
        end;
      Form2.StringGrid1.Cells[CurrentPlayer,3]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "��������"
  if(Players[CurrentPlayer].Four = 'NA') then
    begin
      for i:=0 to 4 do
        begin
          if(Cubes[i]=4) then Sum:=Sum+4;
        end;
      Form2.StringGrid1.Cells[CurrentPlayer,4]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "�������"
  if(Players[CurrentPlayer].Five = 'NA') then
    begin
      for i:=0 to 4 do
        begin
          if(Cubes[i]=5) then Sum:=Sum+5;
        end;
      Form2.StringGrid1.Cells[CurrentPlayer,5]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "��������"
  if(Players[CurrentPlayer].Six = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]=6) then Sum:=Sum+6;
      Form2.StringGrid1.Cells[CurrentPlayer,6]:=inttostr(Sum);
    end;
  Sum:=0;
  //������ � ����������� "����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].Pair = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if(CubeCount[j]>=2) then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,7]:='10';
            break;
          end
          else Form2.StringGrid1.Cells[CurrentPlayer,7]:='0'
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  //������ � ����������� "��� ����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].TwoPair = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if(CubeCount[j]>=2)and(cas=true) then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,8]:='15';
            break;
          end
        else
          if(CubeCount[j]>=2)and(cas=false) then
              cas:=true
          else
            Form2.StringGrid1.Cells[CurrentPlayer,8]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "������"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].Trio = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if(CubeCount[j]>=3) then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,9]:='15';
            break;
          end
          else Form2.StringGrid1.Cells[CurrentPlayer,9]:='0'
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  //������ � ����������� "�������� �����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].SmallStreet = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      if((CubeCount[1]>=1)and(CubeCount[2]>=1)and(CubeCount[3]>=1)and(CubeCount[4]>=1))
      or((CubeCount[2]>=1)and(CubeCount[3]>=1)and(CubeCount[4]>=1)and(CubeCount[5]>=1))
      or((CubeCount[3]>=1)and(CubeCount[4]>=1)and(CubeCount[5]>=1)and(CubeCount[6]>=1)) then
        Form2.StringGrid1.Cells[CurrentPlayer,10]:='20' else Form2.StringGrid1.Cells[CurrentPlayer,10]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "������� �����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].LongStreet = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      if((CubeCount[1]>=1)and(CubeCount[2]>=1)and(CubeCount[3]>=1)and(CubeCount[4]>=1)and(CubeCount[5]>=1))
      or((CubeCount[2]>=1)and(CubeCount[3]>=1)and(CubeCount[4]>=1)and(CubeCount[5]>=1)and(CubeCount[6]>=1)) then
        Form2.StringGrid1.Cells[CurrentPlayer,11]:='25' else Form2.StringGrid1.Cells[CurrentPlayer,11]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "��� ����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].FullHouse = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if CubeCount[j]=2 then cas:=true;
      for j:=1 to 6 do
        if (CubeCount[j]=3)and(cas=true) then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,12]:='30';
            break;
          end
        else Form2.StringGrid1.Cells[CurrentPlayer,12]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].Kare = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if CubeCount[j]>=4 then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,13]:='40';
            break;
          end
        else Form2.StringGrid1.Cells[CurrentPlayer,13]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "�����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].Poker = 'NA') then
    begin
      for i:=0 to 4 do
        if(Cubes[i]<>0) then inc(cubeCount[Cubes[i]]);
      for j:=1 to 6 do
        if CubeCount[j]=5 then
          begin
            Form2.StringGrid1.Cells[CurrentPlayer,14]:='50';
            break;
          end
        else Form2.StringGrid1.Cells[CurrentPlayer,14]:='0';
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
  //������ � ����������� "����"
  for j:=1 to 6 do
    CubeCount[j]:=0;
  if(Players[CurrentPlayer].Chance = 'NA') then
    begin
      for i:=0 to 4 do
        Sum:=Sum+Cubes[i];
      Form2.StringGrid1.Cells[CurrentPlayer,15]:=inttostr(Sum);
    end;
  for j:=1 to 6 do
    CubeCount[j]:=0;
  cas:=false;
end;
////////////////////////////////////////////////////////////////////////////////
procedure endgame;                            //����� ����
var i,j,k,max,tempSum:integer;
tempName:string[20];
rating:array[1..8] of
  record
    name:string[20];
    sum:integer;
  end;
begin
  Form5.ShowModal;
end;
////////////////////////////////////////////////////////////////////////////////
procedure GetChosenCube;                          //��������� �����
begin
  if (State=from_stakan)or(State=from_slot) then
    begin
      Form1.Label5.Visible:=true;
      Form1.DrawGrid7.Visible:=true;
      if ChosenCube=1 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid7.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
      Form1.Label4.Caption:='������� �� ����� ������, ����� �������� ����� '+inttostr(ChosenCube)+'.';
      Form1.Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ���� ����� '+inttostr(ChosenCube)+'.');
    end;
  if (State=cube_opers)or(State=move_start) then
    begin
      Form1.Label5.Visible:=false;
      Form1.DrawGrid7.Visible:=false;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure FillWithChosenCube;                      //���������� �����
begin
  if CellChosen=1 then
    begin
      if ChosenCube=1 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if CellChosen=2 then
    begin
      if ChosenCube=1 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if CellChosen=3 then
    begin
      if ChosenCube=1 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if CellChosen=4 then
    begin
      if ChosenCube=1 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if CellChosen=5 then
    begin
      if ChosenCube=1 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure FillWithChosenPos;                  //���������� �����
begin
  if(ChosenPos=1) then
    begin
      if ChosenCube=1 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if(ChosenPos=2) then
    begin
      if ChosenCube=1 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if(ChosenPos=3) then
    begin
      if ChosenCube=1 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if(ChosenPos=4) then
    begin
      if ChosenCube=1 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
  if(ChosenPos=5) then
    begin
      if ChosenCube=1 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
      if ChosenCube=2 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
      if ChosenCube=3 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
      if ChosenCube=4 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
      if ChosenCube=5 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
      if ChosenCube=6 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);                  //��������� ����������� �����
var TempCube:integer;
begin
  if (State=from_stakan)and(Slot[ARow]=0) then
    begin
      Slot[ARow]:=ChosenCube;
      if (ChosenCube=1) then DrawGrid1.Canvas.Draw(0,ARow*51,Image1.Picture.Graphic);
      if (ChosenCube=2) then DrawGrid1.Canvas.Draw(0,ARow*51,Image3.Picture.Graphic);
      if (ChosenCube=3) then DrawGrid1.Canvas.Draw(0,ARow*51,Image4.Picture.Graphic);
      if (ChosenCube=4) then DrawGrid1.Canvas.Draw(0,ARow*51,Image5.Picture.Graphic);
      if (ChosenCube=5) then DrawGrid1.Canvas.Draw(0,ARow*51,Image6.Picture.Graphic);
      if (ChosenCube=6) then DrawGrid1.Canvas.Draw(0,ARow*51,Image7.Picture.Graphic);
      State:=cube_opers;
      GetChosenCube;
      if CurrentThrow=3
        then Label4.Caption:='�������� ����������.' else
          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ����.');
      ChosenCube:=0;
    end else
      if (State=from_stakan)and(Slot[ARow]<>0) then
        begin
          TempCube:=Slot[ARow];
          Slot[ARow]:=ChosenCube;
          Stakan[ChosenPos-1]:=TempCube;
          State:=cube_opers;
          GetChosenCube;
          if CurrentThrow=3
            then Label4.Caption:='�������� ����������.' else
              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ����.');
          if (ChosenCube=1) then DrawGrid1.Canvas.Draw(0,ARow*51,Image1.Picture.Graphic);
          if (ChosenCube=2) then DrawGrid1.Canvas.Draw(0,ARow*51,Image3.Picture.Graphic);
          if (ChosenCube=3) then DrawGrid1.Canvas.Draw(0,ARow*51,Image4.Picture.Graphic);
          if (ChosenCube=4) then DrawGrid1.Canvas.Draw(0,ARow*51,Image5.Picture.Graphic);
          if (ChosenCube=5) then DrawGrid1.Canvas.Draw(0,ARow*51,Image6.Picture.Graphic);
          if (ChosenCube=6) then DrawGrid1.Canvas.Draw(0,ARow*51,Image7.Picture.Graphic);
          ChosenCube:=TempCube;
          if (ChosenPos=1) then
            begin
              if (ChosenCube=1) then DrawGrid2.Canvas.Draw(0,0,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid2.Canvas.Draw(0,0,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid2.Canvas.Draw(0,0,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid2.Canvas.Draw(0,0,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid2.Canvas.Draw(0,0,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid2.Canvas.Draw(0,0,Image7.Picture.Graphic);
            end;
          if (ChosenPos=2) then
            begin
              if (ChosenCube=1) then DrawGrid3.Canvas.Draw(0,0,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid3.Canvas.Draw(0,0,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid3.Canvas.Draw(0,0,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid3.Canvas.Draw(0,0,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid3.Canvas.Draw(0,0,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid3.Canvas.Draw(0,0,Image7.Picture.Graphic);
            end;
          if (ChosenPos=3) then
            begin
              if (ChosenCube=1) then DrawGrid4.Canvas.Draw(0,0,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid4.Canvas.Draw(0,0,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid4.Canvas.Draw(0,0,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid4.Canvas.Draw(0,0,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid4.Canvas.Draw(0,0,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid4.Canvas.Draw(0,0,Image7.Picture.Graphic);
            end;
          if (ChosenPos=4) then
            begin
              if (ChosenCube=1) then DrawGrid5.Canvas.Draw(0,0,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid5.Canvas.Draw(0,0,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid5.Canvas.Draw(0,0,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid5.Canvas.Draw(0,0,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid5.Canvas.Draw(0,0,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid5.Canvas.Draw(0,0,Image7.Picture.Graphic);
            end;
          if (ChosenPos=5) then
            begin
              if (ChosenCube=1) then DrawGrid6.Canvas.Draw(0,0,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid6.Canvas.Draw(0,0,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid6.Canvas.Draw(0,0,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid6.Canvas.Draw(0,0,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid6.Canvas.Draw(0,0,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid6.Canvas.Draw(0,0,Image7.Picture.Graphic);
            end;
          inc(CubesCount);
          ChosenCube:=0;
        end else
          if (State=from_slot)and(Slot[ARow]=0) then
            begin
              Slot[ARow]:=ChosenCube;
              if (ChosenCube=1) then DrawGrid1.Canvas.Draw(0,ARow*51,Image1.Picture.Graphic);
              if (ChosenCube=2) then DrawGrid1.Canvas.Draw(0,ARow*51,Image3.Picture.Graphic);
              if (ChosenCube=3) then DrawGrid1.Canvas.Draw(0,ARow*51,Image4.Picture.Graphic);
              if (ChosenCube=4) then DrawGrid1.Canvas.Draw(0,ARow*51,Image5.Picture.Graphic);
              if (ChosenCube=5) then DrawGrid1.Canvas.Draw(0,ARow*51,Image6.Picture.Graphic);
              if (ChosenCube=6) then DrawGrid1.Canvas.Draw(0,ARow*51,Image7.Picture.Graphic);
              ChosenPos:=0;
              State:=cube_opers;
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ����.');
              ChosenCube:=0;
            end else
              if (State=from_slot)and(Slot[ARow]<>0) then
                begin
                  State:=cube_opers;
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ����.');
                  TempCube:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,ARow*51,Form1.Image7.Picture.Graphic);
                  ChosenCube:=Slot[ARow];
                  Slot[ARow]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                end else
                  if (State=cube_opers)and(Slot[ARow]<>0) then
                    begin
                      DrawGrid1.Canvas.FillRect(Rect(0,(ARow)*51,50,ARow*51+50));
                      State:=from_slot;
                      ChosenCube:=Slot[ARow];
                      GetChosenCube;
                      Slot[ARow]:=0;
                      ChosenPos:=ARow+1;
                    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure randomCubes;                        //��������� ������
var i,Cube:integer;
begin
  Form1.DrawGrid2.Visible:=true;
  Form1.DrawGrid3.Visible:=true;
  Form1.DrawGrid4.Visible:=true;
  Form1.DrawGrid5.Visible:=true;
  Form1.DrawGrid6.Visible:=true;
  for i:=0 to CubesCount-1 do
    begin
      randomize;
      Cube:=Random(6)+1;
      if i=0 then
        begin
          if Cube=1 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
          if Cube=2 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
          if Cube=3 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
          if Cube=4 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
          if Cube=5 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
          if Cube=6 then Form1.DrawGrid2.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
        end;
      if i=1 then
        begin
          if Cube=1 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
          if Cube=2 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
          if Cube=3 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
          if Cube=4 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
          if Cube=5 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
          if Cube=6 then Form1.DrawGrid3.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
        end;
      if i=2 then
        begin
          if Cube=1 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
          if Cube=2 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
          if Cube=3 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
          if Cube=4 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
          if Cube=5 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
          if Cube=6 then Form1.DrawGrid4.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
        end;
      if i=3 then
        begin
          if Cube=1 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
          if Cube=2 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
          if Cube=3 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
          if Cube=4 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
          if Cube=5 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
          if Cube=6 then Form1.DrawGrid5.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
        end;
      if i=4 then
        begin
          if Cube=1 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
          if Cube=2 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
          if Cube=3 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
          if Cube=4 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
          if Cube=5 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
          if Cube=6 then Form1.DrawGrid6.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
        end;
      Stakan[i]:=Cube;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image2Click(Sender: TObject);  //������ ������
var i:integer;
begin
  if (State=move_start) then
    begin
      State:=cube_opers;
      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ��������� ������ ������.');
      CurrentThrow:=1;
      Label3.Caption:='������: 1/3';
      randomCubes;
      CombTableEdit;
    end else
      if (CurrentThrow=1)and(State=cube_opers) then
        begin
        Label3.Caption:='������: 2/3';
        Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������ ������ ������.');
        inc(CurrentThrow);
        for i:=0 to 4 do
          Stakan[i]:=0;
        DrawGrid2.Canvas.FillRect(Rect(0,0,50,50));
        DrawGrid3.Canvas.FillRect(Rect(0,0,50,50));
        DrawGrid4.Canvas.FillRect(Rect(0,0,50,50));
        DrawGrid5.Canvas.FillRect(Rect(0,0,50,50));
        DrawGrid6.Canvas.FillRect(Rect(0,0,50,50));
        randomCubes;
        CombTableEdit;
        end else
          if (CurrentThrow=2)and(State=cube_opers) then
            begin
            inc(CurrentThrow);
            Label4.Caption:='�������� ����������.';
            Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������ ������ � ��������� ������.');
            for i:=0 to 4 do
              Stakan[i]:=0;
            DrawGrid2.Canvas.FillRect(Rect(0,0,50,50));
            DrawGrid3.Canvas.FillRect(Rect(0,0,50,50));
            DrawGrid4.Canvas.FillRect(Rect(0,0,50,50));
            DrawGrid5.Canvas.FillRect(Rect(0,0,50,50));
            DrawGrid6.Canvas.FillRect(Rect(0,0,50,50));
            Label3.Caption:='������: 3/3';
            randomCubes;
            CombTableEdit;
            Image2.Visible:=False;
            Image8.Visible:=True;
            //Button1.Enabled:=true;
            end else
              if (CurrentThrow=3)and(State=cube_opers) then
                begin
                  MessageDlg('�� �� ������ ������� ������! �������� ����������.',mtWarning,[mbOK],0);
                end else
                  if (State=from_stakan)or(State=from_slot) then
                    begin
                      MessageDlg('�� �� ������ ������� ������! �������� � ��������� ������ ����� � ������ '+inttostr(ChosenCube)+'.',mtWarning,[mbOK],0);  
                    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Button1Click(Sender: TObject);    //�������� ����
var i:integer;
begin
  if (CurrentPlayer=PlayersCount)and(CurrentMove<>15) then
    begin
      CurrentPlayer:=1;
      inc(CurrentMove);
    end else
      if (CurrentPlayer<>PlayersCount) then inc(CurrentPlayer)
        else
          if (CurrentPlayer=PlayersCount)and(CurrentMove=15) then
            endgame;
  if CurrentPlayer=PlayersCount then NextPlayer:=1 else NextPlayer:=CurrentPlayer+1;
  CurrentThrow:=0;
  Image2.Visible:=True;
  Image8.Visible:=False;
  Label3.Caption:='������: 0/3';
  Label4.Caption:='��� ������ '+Players[CurrentPlayer].Name+'. ������� �� ������, ����� ��������� �����.';
  Memo1.Lines.Add('��� ������ '+Players[CurrentPlayer].Name+'.');
  State:=move_start;
  ChosenCube:=0;
  Button1.Enabled:=false;
  DrawGrid2.Visible:=false;
  DrawGrid3.Visible:=false;
  DrawGrid4.Visible:=false;
  DrawGrid5.Visible:=false;
  DrawGrid6.Visible:=false;
  label1.Caption:='������� �����: '+Players[CurrentPlayer].Name;
  label2.Caption:='��������� �����: '+Players[NextPlayer].Name;
  for i:=0 to 4 do
    begin
      Stakan[i]:=0;
      Slot[i]:=0;
    end;
  DrawGrid1.Canvas.FillRect(Rect(0,0,50,50));
  DrawGrid1.Canvas.FillRect(Rect(0,51,50,101));
  DrawGrid1.Canvas.FillRect(Rect(0,102,50,152));
  DrawGrid1.Canvas.FillRect(Rect(0,153,50,203));
  DrawGrid1.Canvas.FillRect(Rect(0,204,50,254));
  CubesCount:=5;

end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);       //��������� ����������� �����
var TempCube:integer;
begin
  CellChosen:=1;
  if(State=cube_opers)and(Stakan[0]<>0) then
    begin
      DrawGrid2.Canvas.FillRect(Rect(0,0,50,50));
      State:=from_stakan;
      ChosenCube:=Stakan[0];
      GetChosenCube;
      Stakan[0]:=0;
      ChosenPos:=1;
      CubesCount:=CubesCount-1;
    end else
          if(State=from_stakan)and(ChosenPos<>1)and(Stakan[0]<>0) then
            begin
              State:=cube_opers;
              TempCube:=ChosenCube;
              FillWithChosenCube;
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
              ChosenCube:=Stakan[0];
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Stakan[0]:=TempCube;
              Stakan[ChosenPos-1]:=ChosenCube;
              FillWithChosenPos;
              ChosenPos:=0;
              ChosenCube:=0;
              CubesCount:=CubesCount+1;
            end else
              if(State=from_slot)and(Stakan[0]<>0) then
                begin
                  State:=cube_opers;
                  TempCube:=ChosenCube;
                  FillWithChosenCube;
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                  ChosenCube:=Stakan[0];
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Stakan[0]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                  CubesCount:=CubesCount+1;
                end else
                  if(State=from_stakan)and(Stakan[0]=0) then
                    begin
                      State:=cube_opers;
                      GetChosenCube;
                      if CurrentThrow=3
                        then Label4.Caption:='�������� ����������.' else
                          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                      FillWithChosenCube;
                      Stakan[0]:=ChosenCube;
                      ChosenPos:=0;
                      ChosenCube:=0;
                      CubesCount:=CubesCount+1;
                    end else
                      if(State=from_slot)and(Stakan[0]=0) then
                        begin
                          State:=cube_opers;
                          GetChosenCube;
                          if CurrentThrow=3
                            then Label4.Caption:='�������� ����������.' else
                              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                          FillWithChosenCube;
                          Stakan[0]:=ChosenCube;
                          ChosenPos:=0;
                          ChosenCube:=0;
                          CubesCount:=CubesCount+1;
                        end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);       //��������� ����������� �����
var TempCube:integer;
begin
  CellChosen:=2;
  if(State=cube_opers)and(Stakan[1]<>0) then
    begin
      DrawGrid3.Canvas.FillRect(Rect(0,0,50,50));
      State:=from_stakan;
      ChosenCube:=Stakan[1];
      GetChosenCube;
      Stakan[1]:=0;
      ChosenPos:=2;
      CubesCount:=CubesCount-1;
    end else
          if(State=from_stakan)and(ChosenPos<>2)and(Stakan[1]<>0) then
            begin
              State:=cube_opers;
              TempCube:=ChosenCube;
              FillWithChosenCube;
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
              ChosenCube:=Stakan[1];
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Stakan[1]:=TempCube;
              Stakan[ChosenPos-1]:=ChosenCube;
              FillWithChosenPos;
              ChosenPos:=0;
              ChosenCube:=0;
              CubesCount:=CubesCount+1;
            end else
              if(State=from_slot)and(Stakan[1]<>0) then
                begin
                  State:=cube_opers;
                  TempCube:=ChosenCube;
                  FillWithChosenCube;
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                  ChosenCube:=Stakan[1];
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Stakan[1]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                  CubesCount:=CubesCount+1;
                end else
                  if(State=from_stakan)and(Stakan[1]=0) then
                    begin
                      State:=cube_opers;
                      GetChosenCube;
                      if CurrentThrow=3
                        then Label4.Caption:='�������� ����������.' else
                          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                      FillWithChosenCube;
                      Stakan[1]:=ChosenCube;
                      ChosenPos:=0;
                      ChosenCube:=0;
                      CubesCount:=CubesCount+1;
                    end else
                      if(State=from_slot)and(Stakan[1]=0) then
                        begin
                          State:=cube_opers;
                          GetChosenCube;
                          if CurrentThrow=3
                            then Label4.Caption:='�������� ����������.' else
                              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                          FillWithChosenCube;
                          Stakan[1]:=ChosenCube;
                          ChosenPos:=0;
                          ChosenCube:=0;
                          CubesCount:=CubesCount+1;
                        end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);        //��������� ����������� �����
var TempCube:integer;
begin
  CellChosen:=3;
  if(State=cube_opers)and(Stakan[2]<>0) then
    begin
      DrawGrid4.Canvas.FillRect(Rect(0,0,50,50));
      State:=from_stakan;
      ChosenCube:=Stakan[2];
      GetChosenCube;
      Stakan[2]:=0;
      ChosenPos:=3;
      CubesCount:=CubesCount-1;
    end else
          if(State=from_stakan)and(ChosenPos<>3)and(Stakan[2]<>0) then
            begin
              State:=cube_opers;
              TempCube:=ChosenCube;
              FillWithChosenCube;
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
              ChosenCube:=Stakan[2];
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Stakan[2]:=TempCube;
              Stakan[ChosenPos-1]:=ChosenCube;
              FillWithChosenPos;
              ChosenPos:=0;
              ChosenCube:=0;
              CubesCount:=CubesCount+1;
            end else
              if(State=from_slot)and(Stakan[2]<>0) then
                begin
                  State:=cube_opers;
                  TempCube:=ChosenCube;
                  FillWithChosenCube;
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                  ChosenCube:=Stakan[2];
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Stakan[2]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                  CubesCount:=CubesCount+1;
                end else
                  if(State=from_stakan)and(Stakan[2]=0) then
                    begin
                      State:=cube_opers;
                      GetChosenCube;
                      if CurrentThrow=3
                        then Label4.Caption:='�������� ����������.' else
                          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                      FillWithChosenCube;
                      Stakan[2]:=ChosenCube;
                      ChosenPos:=0;
                      ChosenCube:=0;
                      CubesCount:=CubesCount+1;
                    end else
                      if(State=from_slot)and(Stakan[2]=0) then
                        begin
                          State:=cube_opers;
                          GetChosenCube;
                          if CurrentThrow=3
                            then Label4.Caption:='�������� ����������.' else
                              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                          FillWithChosenCube;
                          Stakan[2]:=ChosenCube;
                          ChosenPos:=0;
                          ChosenCube:=0;
                          CubesCount:=CubesCount+1;
                        end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);       //��������� ����������� �����
var TempCube:integer;
begin
  CellChosen:=4;
  if(State=cube_opers)and(Stakan[3]<>0) then
    begin
      DrawGrid5.Canvas.FillRect(Rect(0,0,50,50));
      State:=from_stakan;
      ChosenCube:=Stakan[3];
      GetChosenCube;
      Stakan[3]:=0;
      ChosenPos:=4;
      CubesCount:=CubesCount-1;
    end else
          if(State=from_stakan)and(ChosenPos<>4)and(Stakan[3]<>0) then
            begin
              State:=cube_opers;
              TempCube:=ChosenCube;
              FillWithChosenCube;
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
              ChosenCube:=Stakan[3];
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Stakan[3]:=TempCube;
              Stakan[ChosenPos-1]:=ChosenCube;
              FillWithChosenPos;
              ChosenPos:=0;
              ChosenCube:=0;
              CubesCount:=CubesCount+1;
            end else
              if(State=from_slot)and(Stakan[3]<>0) then
                begin
                  State:=cube_opers;
                  TempCube:=ChosenCube;
                  FillWithChosenCube;
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                  ChosenCube:=Stakan[3];
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Stakan[3]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                  CubesCount:=CubesCount+1;
                end else
                  if(State=from_stakan)and(Stakan[3]=0) then
                    begin
                      State:=cube_opers;
                      GetChosenCube;
                      if CurrentThrow=3
                        then Label4.Caption:='�������� ����������.' else
                          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                      FillWithChosenCube;
                      Stakan[3]:=ChosenCube;
                      ChosenPos:=0;
                      ChosenCube:=0;
                      CubesCount:=CubesCount+1;
                    end else
                      if(State=from_slot)and(Stakan[3]=0) then
                        begin
                          State:=cube_opers;
                          GetChosenCube;
                          if CurrentThrow=3
                            then Label4.Caption:='�������� ����������.' else
                              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                          FillWithChosenCube;
                          Stakan[3]:=ChosenCube;
                          ChosenPos:=0;
                          ChosenCube:=0;
                          CubesCount:=CubesCount+1;
                        end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DrawGrid6SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);   //��������� ����������� �����
var TempCube:integer;
begin
  CellChosen:=5;
  if(State=cube_opers)and(Stakan[4]<>0) then
    begin
      DrawGrid6.Canvas.FillRect(Rect(0,0,50,50));
      State:=from_stakan;
      ChosenCube:=Stakan[4];
      GetChosenCube;
      Stakan[4]:=0;
      ChosenPos:=5;
      CubesCount:=CubesCount-1;
    end else
          if(State=from_stakan)and(ChosenPos<>5)and(Stakan[4]<>0) then
            begin
              State:=cube_opers;
              TempCube:=ChosenCube;
              FillWithChosenCube;
              Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
              ChosenCube:=Stakan[4];
              GetChosenCube;
              if CurrentThrow=3
                then Label4.Caption:='�������� ����������.' else
                  Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
              Stakan[4]:=TempCube;
              Stakan[ChosenPos-1]:=ChosenCube;
              FillWithChosenPos;
              ChosenPos:=0;
              ChosenCube:=0;
              CubesCount:=CubesCount+1;
            end else
              if(State=from_slot)and(Stakan[4]<>0) then
                begin
                  State:=cube_opers;
                  TempCube:=ChosenCube;
                  FillWithChosenCube;
                  Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                  ChosenCube:=Stakan[4];
                  GetChosenCube;
                  if CurrentThrow=3
                    then Label4.Caption:='�������� ����������.' else
                      Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                  Stakan[4]:=TempCube;
                  Slot[ChosenPos-1]:=ChosenCube;
                  if ChosenCube=1 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image1.Picture.Graphic);
                  if ChosenCube=2 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image3.Picture.Graphic);
                  if ChosenCube=3 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image4.Picture.Graphic);
                  if ChosenCube=4 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image5.Picture.Graphic);
                  if ChosenCube=5 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image6.Picture.Graphic);
                  if ChosenCube=6 then DrawGrid1.Canvas.Draw(0,(ChosenPos-1)*51,Form1.Image7.Picture.Graphic);
                  ChosenPos:=0;
                  ChosenCube:=0;
                  CubesCount:=CubesCount+1;
                end else
                  if(State=from_stakan)and(Stakan[4]=0) then
                    begin
                      State:=cube_opers;
                      GetChosenCube;
                      if CurrentThrow=3
                        then Label4.Caption:='�������� ����������.' else
                          Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                      Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                      FillWithChosenCube;
                      Stakan[4]:=ChosenCube;
                      ChosenPos:=0;
                      ChosenCube:=0;
                      CubesCount:=CubesCount+1;
                    end else
                      if(State=from_slot)and(Stakan[4]=0) then
                        begin
                          State:=cube_opers;
                          GetChosenCube;
                          if CurrentThrow=3
                            then Label4.Caption:='�������� ����������.' else
                              Label4.Caption:='�������� ����������, ����������� ����� ��� ������� �� ������, ����� ���������� � ��������� �����.';
                          Memo1.Lines.Add('����� '+Players[CurrentPlayer].Name+' ������� ����� '+inttostr(ChosenCube)+' � ������.');
                          FillWithChosenCube;
                          Stakan[4]:=ChosenCube;
                          ChosenPos:=0;
                          ChosenCube:=0;
                          CubesCount:=CubesCount+1;
                        end;
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  if CurrentMove=3 then Image2Click(Self);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FormCreate(Self);
  Memo1.Lines.Add('���� ����������!');
  Memo1.Lines.Add('��� ������ '+Players[1].Name+'.');
end;

procedure newgame;       //������ ����� ����
var i:integer;
s:string;
begin
  s:='����������:';
  for i:=1 to PlayersCount do
    begin
      s:=s+#13#10+Players[i].Name+': '+Form2.StringGrid1.Cells[i,16]+' �����.';
    end;
  MessageDlg(s,mtInformation,[mbOk],0);
  Form4.Show;
  Form1.DrawGrid2.Visible:=false;
  Form1.DrawGrid3.Visible:=false;
  Form1.DrawGrid4.Visible:=false;
  Form1.DrawGrid5.Visible:=false;
  Form1.DrawGrid6.Visible:=false;
  Form1.Visible:=false;
  Form2.Visible:=false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if MessageDlg('�� ������������� ������ ������ ����� ����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    newgame;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.DrawGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);      //���������� ������
begin
  if Stakan[0]=1 then DrawGrid2.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if Stakan[0]=2 then DrawGrid2.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if Stakan[0]=3 then DrawGrid2.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if Stakan[0]=4 then DrawGrid2.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if Stakan[0]=5 then DrawGrid2.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if Stakan[0]=6 then DrawGrid2.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);      //���������� ������
begin
  if Stakan[1]=1 then DrawGrid3.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if Stakan[1]=2 then DrawGrid3.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if Stakan[1]=3 then DrawGrid3.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if Stakan[1]=4 then DrawGrid3.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if Stakan[1]=5 then DrawGrid3.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if Stakan[1]=6 then DrawGrid3.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);     //���������� ������
begin
  if Stakan[2]=1 then DrawGrid4.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if Stakan[2]=2 then DrawGrid4.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if Stakan[2]=3 then DrawGrid4.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if Stakan[2]=4 then DrawGrid4.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if Stakan[2]=5 then DrawGrid4.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if Stakan[2]=6 then DrawGrid4.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid5DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);    //���������� ������
begin
  if Stakan[3]=1 then DrawGrid5.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if Stakan[3]=2 then DrawGrid5.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if Stakan[3]=3 then DrawGrid5.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if Stakan[3]=4 then DrawGrid5.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if Stakan[3]=5 then DrawGrid5.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if Stakan[3]=6 then DrawGrid5.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid6DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);    //���������� ������
begin
  if Stakan[4]=1 then DrawGrid6.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if Stakan[4]=2 then DrawGrid6.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if Stakan[4]=3 then DrawGrid6.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if Stakan[4]=4 then DrawGrid6.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if Stakan[4]=5 then DrawGrid6.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if Stakan[4]=6 then DrawGrid6.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);    //���������� ������
begin
  if ChosenCube=1 then DrawGrid7.Canvas.Draw(0,0,Form1.Image1.Picture.Graphic);
  if ChosenCube=2 then DrawGrid7.Canvas.Draw(0,0,Form1.Image3.Picture.Graphic);
  if ChosenCube=3 then DrawGrid7.Canvas.Draw(0,0,Form1.Image4.Picture.Graphic);
  if ChosenCube=4 then DrawGrid7.Canvas.Draw(0,0,Form1.Image5.Picture.Graphic);
  if ChosenCube=5 then DrawGrid7.Canvas.Draw(0,0,Form1.Image6.Picture.Graphic);
  if ChosenCube=6 then DrawGrid7.Canvas.Draw(0,0,Form1.Image7.Picture.Graphic);
end;

procedure TForm1.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);     //���������� ������
var i:integer;
begin
  for i:=0 to 4 do
    begin
      if Slot[i]=1 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image1.Picture.Graphic);
      if Slot[i]=2 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image3.Picture.Graphic);
      if Slot[i]=3 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image4.Picture.Graphic);
      if Slot[i]=4 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image5.Picture.Graphic);
      if Slot[i]=5 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image6.Picture.Graphic);
      if Slot[i]=6 then DrawGrid1.Canvas.Draw(0,51*i,Form1.Image7.Picture.Graphic);
    end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
s:string;
begin
  CanClose:=False;
  if MessageDlg('�� ������������� ������ �����?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    s:='����������:';
    for i:=1 to PlayersCount do
      begin
        s:=s+#13#10+Players[i].Name+': '+Form2.StringGrid1.Cells[i,16]+' �����.';
      end;
    MessageDlg(s,mtInformation,[mbOk],0);
    CanClose:=true;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm1.N5Click(Sender: TObject);
var n:boolean;
i:integer;
s:string;
begin
  if MessageDlg('�� ������������� ������ �����?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    s:='����������:';
    for i:=1 to PlayersCount do
      begin
        s:=s+#13#10+Players[i].Name+': '+Form2.StringGrid1.Cells[i,16]+' �����.';
      end;
    MessageDlg(s,mtInformation,[mbOk],0);
    Application.Terminate;
  end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS,0); 
end;

end.
