unit pwd_dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Plugin_Main, ExtCtrls, jpeg;

type
  TPWD_DIALOG_FORM = class(TForm)
    BBOk: TBitBtn;
    BBCancel: TBitBtn;
    EPWDEDIT: TEdit;
    DIALOG_ICON: TImage;
    LPWDREQMESSAGE: TLabel;
    LPWD: TLabel;
    CBSAVEPWD: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BBCancelClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultPwd:String;
    SavePwd:Boolean;
    Procedure ReadLng;
  end;

var
  PWD_DIALOG_FORM: TPWD_DIALOG_FORM;

implementation

{$R *.dfm}

procedure TPWD_DIALOG_FORM.BBCancelClick(Sender: TObject);
begin
Close;
end;

procedure TPWD_DIALOG_FORM.BBOkClick(Sender: TObject);
begin
SavePwd:=CBSAVEPWD.Checked;
ResultPwd:=EPWDEDIT.Text;
Close;
end;

procedure TPWD_DIALOG_FORM.FormShow(Sender: TObject);
begin
Readlng
end;

procedure TPWD_DIALOG_FORM.ReadLng;
begin
BBOk.Caption:=LNG_OK;
BBCancel.Caption:=LNG_Cancel;
PWD_DIALOG_FORM.Caption:=LNG_PassRequest;
LPWDREQMESSAGE.Caption:=LNG_PassReqMsg;
LPWD.Caption:=LNG_Password2;
CBSAVEPWD.Caption:=LNG_SavePvd;
end;

end.
