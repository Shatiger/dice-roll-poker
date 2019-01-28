unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1, Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
var i,j,k,max,tempSum:integer;
tempName:string[20];
rating:array[1..8] of
  record
    name:string[20];
    sum:integer;
  end;
begin
  for i:=1 to Unit1.PlayersCount do
    begin
      rating[i].name:=Form2.StringGrid1.Cells[i,0];
      rating[i].sum:=StrToInt(Form2.StringGrid1.Cells[i,16]);
    end;
  j:=0;
  k:=1;
  max:=0;
  repeat
    for i:=k to PlayersCount do
        if rating[i].sum>=max then
          begin
            j:=i;
            max:=rating[i].sum;
          end;
    tempSum:=rating[k].sum;
    tempName:=rating[k].name;
    rating[k].sum:=rating[j].sum;
    rating[k].name:=rating[j].name;
    rating[j].sum:=tempSum;
    rating[j].name:=tempName;
    inc(k);
    max:=0;
    j:=0;
  until k=PlayersCount;
  for i:=1 to PlayersCount do
    Memo1.Lines.Add(inttostr(i)+' место: '+rating[i].name+' ('+inttostr(rating[i].sum)+' очков)');
  Label2.Caption:=rating[1].name;
  Label3.Caption:='с результатом '+inttostr(rating[1].sum)+' очков';
  Form1.Memo1.Lines.Add('Побеждает игрок '+rating[1].name+' с результатом '+inttostr(rating[1].sum)+' очков!');
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
