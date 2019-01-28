unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit4, Unit1, Unit2, Unit6, Unit7;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form3.Visible:=false;
  Form4.Show;
end;

procedure TForm3.N4Click(Sender: TObject);
begin
  Button1Click(Self);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.N3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.N6Click(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button3Click(Self);
end;

procedure TForm3.N7Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS,0); 
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=False;
  if MessageDlg('Вы действительно хотите выйти?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    CanClose:=True;
end;

end.
