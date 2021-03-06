unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  PlayersCount:byte;
  Names:array[1..8] of string[20];

implementation

uses Unit1, Unit3, Unit2;

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0;
  Edit3.Enabled:=false;
  Edit4.Enabled:=false;
  Edit5.Enabled:=false;
  Edit6.Enabled:=false;
  Edit7.Enabled:=false;
  Edit8.Enabled:=false;
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
    begin
      Edit3.Enabled:=false;
      Edit4.Enabled:=false;
      Edit5.Enabled:=false;
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      PlayersCount:=2;
    end;
  if ComboBox1.ItemIndex=1 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=false;
      Edit5.Enabled:=false;
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      PlayersCount:=3;
    end;
  if ComboBox1.ItemIndex=2 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=true;
      Edit5.Enabled:=false;
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      PlayersCount:=4;
    end;
  if ComboBox1.ItemIndex=3 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=true;
      Edit5.Enabled:=true;
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      PlayersCount:=5;
    end;
  if ComboBox1.ItemIndex=4 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=true;
      Edit5.Enabled:=true;
      Edit6.Enabled:=true;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      PlayersCount:=6;
    end;
  if ComboBox1.ItemIndex=5 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=true;
      Edit5.Enabled:=true;
      Edit6.Enabled:=true;
      Edit7.Enabled:=true;
      Edit8.Enabled:=false;
      PlayersCount:=7;
    end;
  if ComboBox1.ItemIndex=6 then
    begin
      Edit3.Enabled:=true;
      Edit4.Enabled:=true;
      Edit5.Enabled:=true;
      Edit6.Enabled:=true;
      Edit7.Enabled:=true;
      Edit8.Enabled:=true;
      PlayersCount:=8;
    end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  PlayersCount:=ComboBox1.ItemIndex+2;
  Names[1]:=Edit1.Text;
  Names[2]:=Edit2.Text;
  Names[3]:=Edit3.Text;
  Names[4]:=Edit4.Text;
  Names[5]:=Edit5.Text;
  Names[6]:=Edit6.Text;
  Names[7]:=Edit7.Text;
  Names[8]:=Edit8.Text;
  Form1.Show;
  Form2.Show;
  Form4.Hide;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.Show;
end;

end.
