unit progress_dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, PLUGIN_Main;

type
  TPROGRESS_DLG = class(TForm)
    LStatus: TLabel;
    Progress: TProgressBar;
    BtnOKCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOKCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PROGRESS_DLG: TPROGRESS_DLG;

implementation

uses TotalMailer;

{$R *.dfm}

procedure TPROGRESS_DLG.BtnOKCancelClick(Sender: TObject);
begin
PROGRESS_DLG_CNCL:=True;
Close;
end;

procedure TPROGRESS_DLG.FormDestroy(Sender: TObject);
begin
TOTAL_MAILER.Enabled :=True;
end;

procedure TPROGRESS_DLG.FormShow(Sender: TObject);
begin
PROGRESS_DLG_CNCL:=False;
end;


end.
