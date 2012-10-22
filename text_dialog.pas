unit text_dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Plugin_Main;

type
  TTEXT_DIALOG_FORM = class(TForm)
    DIALOG_ICON: TImage;
    LPWDREQMESSAGE: TLabel;
    ETEXTEDIT: TEdit;
    BBCancel: TBitBtn;
    BBOk: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
//    ExCaption,ExMessage,ExDefault:String;
    class Function ShowDialog (Caption,_Message,Default:String; out ResultString:String):Boolean;
    Procedure ReadLng;
  end;


implementation

{$R *.dfm}

{ TTEXT_DIALOG_FORM }

procedure TTEXT_DIALOG_FORM.ReadLng;
begin
BBOk.Caption:=LNG_OK;
BBCancel.Caption:=LNG_Cancel;
end;

class function TTEXT_DIALOG_FORM.ShowDialog(Caption,_Message,Default:String; out ResultString:String):Boolean;
var
  TEXT_DIALOG_FORM: TTEXT_DIALOG_FORM;
begin
try
 TEXT_DIALOG_FORM:=TTEXT_DIALOG_FORM.Create(nil);
 TEXT_DIALOG_FORM.ReadLng;
 TEXT_DIALOG_FORM.Caption := Caption;
 TEXT_DIALOG_FORM.LPWDREQMESSAGE.Caption :=_Message;
 TEXT_DIALOG_FORM.ETEXTEDIT.Text :=Default;
 result := TEXT_DIALOG_FORM.ShowModal = mrOk;
 if result then ResultString:=TEXT_DIALOG_FORM.ETEXTEDIT.text else ResultString:=Default;
 finally
 FreeAndNil(TEXT_DIALOG_FORM);
 end;
end;
end.
