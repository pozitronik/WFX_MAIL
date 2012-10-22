unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, IniFiles, Plugin_Main, Buttons, ExtCtrls, Menus,
  XPMan, Spin, Gradient;

type
  TFWX_MAIL_PROP = class(TForm)
    MCMAIN: TPageControl;
    TSMBOX: TTabSheet;
    GBMailBoxList: TGroupBox;
    LBMBList: TListBox;
    BMBAdd: TButton;
    BMBDel: TButton;
    GBGetMail: TGroupBox;
    LServer: TLabel;
    LUser: TLabel;
    LPass: TLabel;
    Label1: TLabel;
    EServer: TEdit;
    EUser: TEdit;
    EPass: TEdit;
    EPort: TEdit;
    GBSendmail: TGroupBox;
    LSMTPServer: TLabel;
    Label3: TLabel;
    ESMTPServ: TEdit;
    ESMTPPort: TEdit;
    GBUserInfo: TGroupBox;
    LFIO: TLabel;
    LEmail: TLabel;
    LOrganization: TLabel;
    EFIO: TEdit;
    EEmail: TEdit;
    EOrganization: TEdit;
    BApply: TButton;
    TSOPTIONS: TTabSheet;
    GBLang: TGroupBox;
    LngSelect: TListBox;
    BBOk: TBitBtn;
    Label2: TLabel;
    TSViewerOptions: TTabSheet;
    LEAttachSavePath: TLabeledEdit;
    BBSelectPath: TBitBtn;
    GNAltEnterSel: TGroupBox;
    GBEnterSel: TGroupBox;
    CBTabsPosSelect: TComboBox;
    LViewAttach: TLabel;
    LTabsPosSelect: TLabel;
    CBViewAttach: TComboBox;
    CBAltEnter: TComboBox;
    CBEnter: TComboBox;
    PMMBList: TPopupMenu;
    MBAdd: TMenuItem;
    MBDelete: TMenuItem;
    MBRename: TMenuItem;
    MBCopy: TMenuItem;
    BBCancel: TBitBtn;
    CBCacheMessages: TCheckBox;
    XPManifest1: TXPManifest;
    LUnsaved: TLabel;
    CBMBDefault: TCheckBox;
    GBConnection: TGroupBox;
    SEConnectionTimeout: TSpinEdit;
    LTimeout: TLabel;
    LSMTPAuth: TLabel;
    CBSMTPAuth: TComboBox;
    TSAbout: TTabSheet;
    LSMTPPass: TLabel;
    ESMTPPass: TEdit;
    ESMTPUSER: TEdit;
    LSMTPUser: TLabel;
    LPassAlert: TLabel;
    CBCloseAfterSending: TCheckBox;
    GBButtonsOpts: TGroupBox;
    GBGradient: TGroupBox;
    CBEnableGradient: TCheckBox;
    CBVerticalGradient: TCheckBox;
    LGFrom: TLabel;
    LGTo: TLabel;
    CDialog: TColorDialog;
    PGradientFrom: TPanel;
    PGradientTo: TPanel;
    GradientPreview: TImage;
    LIconSize: TLabel;
    CBIconSize: TComboBox;
    LTextCaptions: TLabel;
    CBTextCaptions: TComboBox;
    LGradient: TLabel;
    CBFlatButtons: TCheckBox;
    RGConnection: TRadioGroup;
    CBTLS: TCheckBox;
    CBPOPAuth: TLabel;
    CBPOP3Auth: TComboBox;
    CBAOnTop: TCheckBox;
    CBViewHeaders: TCheckBox;
    CBCloseProgressAfterSending: TCheckBox;
    CBRememberSize: TCheckBox;
    CBClearHeadersCache: TCheckBox;
    GBSendProperties: TGroupBox;
    CBUseBlat: TCheckBox;
    LEBlatPath: TLabeledEdit;
    BBSelectBlatPath: TBitBtn;
    LEBlatParams: TLabeledEdit;
    ODBlatOpen: TOpenDialog;
    STAbout: TStaticText;
    Label4: TLabel;
    Image1: TImage;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GBCopying: TGroupBox;
    LOnEMLCopy: TLabel;
    LOnOtherFileCopy: TLabel;
    CBOnEmlCopy: TComboBox;
    CBOnFileCopy: TComboBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    GBAddrBookSettings: TGroupBox;
    BBOpenAdrBook: TBitBtn;
    CBSaveEmailsAutomatically: TCheckBox;
    procedure BBOpenAdrBookClick(Sender: TObject);
    procedure BBSelectBlatPathClick(Sender: TObject);
    procedure CBEnableGradientClick(Sender: TObject);
    procedure LGradientClick(Sender: TObject);
    procedure CBVerticalGradientClick(Sender: TObject);
    procedure PGradientToClick(Sender: TObject);
    procedure PGradientFromClick(Sender: TObject);
    procedure CBTLSClick(Sender: TObject);
    procedure CBSMTPAuthChange(Sender: TObject);
    procedure CBMBDefaultClick(Sender: TObject);
    procedure BBSelectPathClick(Sender: TObject);
    procedure CBTabsPosSelectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LngSelectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MBCopyClick(Sender: TObject);
    procedure MBRenameClick(Sender: TObject);
    procedure MBDeleteClick(Sender: TObject);
    procedure MBAddClick(Sender: TObject);
    procedure EServerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBCancelClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure LngSelectClick(Sender: TObject);
    procedure LBMBListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BMBAddKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BMBAddKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BApplyClick(Sender: TObject);
    procedure LBMBListClick(Sender: TObject);
    procedure EPortKeyPress(Sender: TObject; var Key: Char);
    procedure LBMBListDblClick(Sender: TObject);
    procedure LBMBListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BMBDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BMBAddClick(Sender: TObject);
  private
    { Private declarations }
    Procedure PreviewGradient;
  public
    { Public declarations }
    ShowWithBox:String;
    Procedure RefreshBoxList;
    Procedure Readlng;
    procedure LoadLanguageList(From: String; ToLBox: TListBox);
    Procedure SaveEditedSettings;//сохраняет все изменения настроек сразу же
    Procedure SaveMBEditSettings(MBIndex:Integer);//Сохраняет изменения для указанного ящика
  end;

var
  FWX_MAIL_PROP: TFWX_MAIL_PROP;
  MainIni:TIniFile;
  DataChanged:Boolean;
  EditedBoxIndex:Integer;

implementation

uses text_dialog, addr_book;

{$R *.dfm}



procedure TFWX_MAIL_PROP.MBAddClick(Sender: TObject);
begin
BMBAdd.Click;
end;

procedure TFWX_MAIL_PROP.MBCopyClick(Sender: TObject);
var
Oldname,MBName:String;
i:Integer;
begin
i:=LBMBList.ItemIndex;
if i<0 then exit;
Oldname:=LBMBList.Items.Strings [i];
if not TTEXT_DIALOG_FORM.ShowDialog(LNG_CopyMailBox,LNG_CopyMailBoxName,OldName,MBName) then exit;
CopyMailBox (Oldname,MBName);
LBMBList.Items := ReadMBList;
LBMBList.ItemIndex:=LBMBList.Items.Count-1;
RefreshBoxList;
BApply.Enabled :=False;
DataChanged:=False;
end;

procedure TFWX_MAIL_PROP.MBDeleteClick(Sender: TObject);
begin
BMBDel.Click;
end;

procedure TFWX_MAIL_PROP.MBRenameClick(Sender: TObject);
begin
LBMBList.OnDblClick (self);
end;

procedure TFWX_MAIL_PROP.PreviewGradient;
begin
if CBVerticalGradient.Checked then
 begin
 VGradientRect (GradientPreview.Canvas,0,0,GradientPreview.Width,GradientPreview.Height,PGradientFrom.Color,PGradientTo.Color);
 end else
 begin
 HGradientRect (GradientPreview.Canvas,0,0,GradientPreview.Width,GradientPreview.Height,PGradientFrom.Color,PGradientTo.Color);
 end;
end;

procedure TFWX_MAIL_PROP.PGradientFromClick(Sender: TObject);
begin
CDialog.Color :=PGradientFrom.Color;
if CDialog.Execute then PGradientFrom.Color :=CDialog.Color;
PreviewGradient;
end;

procedure TFWX_MAIL_PROP.PGradientToClick(Sender: TObject);
begin
CDialog.Color :=PGradientTo.Color;
if CDialog.Execute then PGradientTo.Color :=CDialog.Color;
PreviewGradient;
end;


procedure TFWX_MAIL_PROP.BApplyClick(Sender: TObject);
var
I:Integer;
begin
i:=LBMBList.ItemIndex;
if i<0 then exit;
SaveMBEditSettings (i);
BApply.Enabled :=False;
DataChanged:=False;
LUnsaved.Visible :=False;
end;

procedure TFWX_MAIL_PROP.BBCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFWX_MAIL_PROP.BBOkClick(Sender: TObject);
begin
SaveEditedSettings;
Close;
end;

procedure TFWX_MAIL_PROP.BBOpenAdrBookClick(Sender: TObject);
begin
AddrBook:=TAddrBook.Create(self);
AddrBook.ShowModal;
Addrbook.Destroy;
end;

procedure TFWX_MAIL_PROP.BBSelectBlatPathClick(Sender: TObject);
begin
OdblatOpen.Title :=LNG_SelectBlat;
if (OdblatOpen.Execute) and (OdblatOpen.FileName<>'') then
 begin
 LEBlatPath.Text:=OdblatOpen.FileName;
 end;
end;

procedure TFWX_MAIL_PROP.BBSelectPathClick(Sender: TObject);
var
s:String;
begin
S:= GiveFolder (LNG_SelAttachSaveDir);
if s<>'' then LEAttachSavePath.Text :=S;
end;

procedure TFWX_MAIL_PROP.BMBAddClick(Sender: TObject);
var
MBName:String;
begin
if not TTEXT_DIALOG_FORM.ShowDialog(LNG_AddMailBox,LNG_NewMailBoxName,'',MBName) then exit;
AddMailBox(MBName);
LBMBList.Items := ReadMBList;
LBMBList.ItemIndex:=LBMBList.Items.Count-1;
RefreshBoxList;
BApply.Enabled :=False;
DataChanged:=False;
LUnsaved.Visible :=False;
end;

procedure TFWX_MAIL_PROP.BMBAddKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key=VK_ESCAPE then Close;
end;

procedure TFWX_MAIL_PROP.BMBAddKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key=VK_ESCAPE then Close;
end;

procedure TFWX_MAIL_PROP.BMBDelClick(Sender: TObject);
var
i:integer;
s:String;
begin
i:=LBMBList.ItemIndex;
if i>-1 then
 begin
 s:=LBMBList.Items.Strings [i];
 DeleteMailBox (S);
 LBMBList.Items := ReadMBList;
 LBMBList.ItemIndex:=LBMBList.Items.Count-1;
 RefreshBoxList;
 end;
BApply.Enabled :=False;
LUnsaved.Visible :=False;
DataChanged:=False;
end;

procedure TFWX_MAIL_PROP.CBSMTPAuthChange(Sender: TObject);
begin
if CBSMTPAuth.ItemIndex =3 then
 begin
 ESMTPUSER.Enabled :=true;
 ESMTPPass.Enabled :=true;
 LSMTPPass.Enabled :=true;
 LSMTPUser.Enabled :=true;
 end else
 begin
 ESMTPUSER.Enabled :=false;
 ESMTPPass.Enabled :=false;
 LSMTPPass.Enabled :=false;
 LSMTPUser.Enabled :=false;
 end;

BApply.Enabled :=True;
DataChanged:=True;
EditedBoxIndex:=LBMBList.ItemIndex;
LUnsaved.Visible :=true;
end;

procedure TFWX_MAIL_PROP.CBEnableGradientClick(Sender: TObject);
begin
if CBEnableGradient.Checked  then
 begin
 LGFrom.Enabled :=True;
 LGTo.Enabled :=True;
 CBVerticalGradient.Enabled :=True;
 GradientPreview.Visible :=True;
 PGradientFrom.Enabled :=True;
 PGradientTo.Enabled :=True;
 end else
 begin
 LGFrom.Enabled :=False;
 LGTo.Enabled :=False;
 CBVerticalGradient.Enabled :=False;
 GradientPreview.Visible :=False;
 PGradientFrom.Enabled :=False;
 PGradientTo.Enabled :=False;
 end;
end;

procedure TFWX_MAIL_PROP.CBMBDefaultClick(Sender: TObject);
begin
BApply.Enabled :=True;
DataChanged:=True;
EditedBoxIndex:=LBMBList.ItemIndex;
LUnsaved.Visible :=true;
end;

procedure TFWX_MAIL_PROP.CBTabsPosSelectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then Close;
end;

procedure TFWX_MAIL_PROP.CBTLSClick(Sender: TObject);
begin
BApply.Enabled :=True;
DataChanged:=True;
EditedBoxIndex:=LBMBList.ItemIndex;
LUnsaved.Visible :=true;
end;

procedure TFWX_MAIL_PROP.CBVerticalGradientClick(Sender: TObject);
begin
PreviewGradient;
end;

procedure TFWX_MAIL_PROP.EPortKeyPress(Sender: TObject; var Key: Char);
var
Int: set of char;
begin
int:=['0'..'9'];
if not (Key in int) then key:=#0;
end;

procedure TFWX_MAIL_PROP.EServerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
IgnoredKeys: Set of byte;
begin
IgnoredKeys:=[VK_LBUTTON,VK_RBUTTON,VK_CANCEL,VK_TAB,VK_RETURN,VK_SHIFT,VK_CONTROL,VK_PAUSE..VK_ESCAPE,  VK_PRIOR..VK_SNAPSHOT,VK_HELP,VK_LWIN..VK_SLEEP,VK_F1..VK_LAUNCH_APP2];
if not (key in Ignoredkeys) then
 begin
 BApply.Enabled :=True;
 DataChanged:=True;
 EditedBoxIndex:=LBMBList.ItemIndex;
 LUnsaved.Visible :=true;
 end;
end;

procedure TFWX_MAIL_PROP.FormShow(Sender: TObject);
begin
MCMain.Pages [0].Show;
Readlng;
//чтение и отображение настроек
LoadLanguageList(GetPluginDir,LngSelect);
if FileExists (GetPluginDir+LoadSettings.LNGFile) then
 begin
 LngSelect.ItemIndex :=LngSelect.Items.IndexOf (LoadSettings.LNGFile+' ('+GetAboutFromLng(GetPluginDir+LoadSettings.LNGFile)+')');
 end;
CbAltEnter.ItemIndex :=LoadSettings.DoOnAltEnter;
CbEnter.ItemIndex :=LoadSettings.DoOnEnter;
CBTabsPosSelect.ItemIndex :=LoadSettings.ViewerTabPos;
CBViewAttach.ItemIndex :=LoadSettings.AttachViewMode;
LEAttachSavePath.Text :=LoadSettings.AttachSaveDir;
CBCacheMessages.Checked:=LoadSettings.CacheMessages;
SEConnectionTimeout.Value :=LoadSettings.ConnectionTimeout;
CBCloseAfterSending.Checked :=LoadSettings.EditorCloseAfterSending;
CBCloseProgressAfterSending.Checked :=LoadSettings.EditorCloseProgressAfterSending; 
CBEnableGradient.Checked :=loadSettings.EditorGradientButton ;
CBVerticalGradient.Checked :=LoadSettings.EditorGradientVertical;
PGradientFrom.Color :=StringToColor (LoadSettings.EditorGradientStart);
PGradientTo.Color :=StringToColor (LoadSettings.EditorGradientEnd);
CBIconSize.ItemIndex :=LoadSettings.EditorIconSize;
CBTextCaptions.ItemIndex :=LoadSettings.EditorCaptionsMode;
CBFlatButtons.Checked :=LoadSettings.EditorFlatButtons;
CBAOnTop.Checked:=LoadSettings.EditorAlwaysOnTop;
CBViewHeaders.Checked:=LoadSettings.EditorShowRFCHeaders;
CBRememberSize.Checked :=LoadSettings.EditorSavePos;
CBClearHeadersCache.Checked :=LoadSettings.ClearCachedHeaders;
CBUseBlat.Checked :=LoadSettings.UseBlat;
LEBlatPath.Text :=LoadSettings.BlatPath;
LEBlatParams.Text :=LoadSettings.BlatParams;
CBOnEmlCopy.ItemIndex :=LoadSettings.OnEmlCopy;
CBOnFileCopy.ItemIndex :=LoadSettings.OnOtherFileCopy;
CBSaveEmailsAutomatically.Checked:=LoadSettings.AddrAutoSaveMails;
CBEnableGradient.OnClick (Self);
PreviewGradient;
LBMBList.Items := ReadMBList;
if ShowWithBox='' then LBMBList.ItemIndex:=0 else
 begin
 LBMBList.SetFocus;
 LBMBList.ItemIndex :=LBMBList.Items.IndexOf(ShowWithBox);
 end;
RefreshBoxList;
LUnsaved.Visible:=False;
BApply.Enabled :=False;
if CBSMTPAuth.ItemIndex =3 then
 begin
 ESMTPUSER.Enabled :=true;
 ESMTPPass.Enabled :=true;
 LSMTPPass.Enabled :=true;
 LSMTPUser.Enabled :=true;
 end else
 begin
 ESMTPUSER.Enabled :=false;
 ESMTPPass.Enabled :=false;
 LSMTPPass.Enabled :=false;
 LSMTPUser.Enabled :=false;
 end;
end;

procedure TFWX_MAIL_PROP.LBMBListClick(Sender: TObject);
Begin
RefreshBoxList;
BApply.Enabled :=False;
DataChanged:=False;
LUnsaved.Visible :=False;
if CBSMTPAuth.ItemIndex =3 then
 begin
 ESMTPUSER.Enabled :=true;
 ESMTPPass.Enabled :=true;
 LSMTPPass.Enabled :=true;
 LSMTPUser.Enabled :=true;
 end else
 begin
 ESMTPUSER.Enabled :=false;
 ESMTPPass.Enabled :=false;
 LSMTPPass.Enabled :=false;
 LSMTPUser.Enabled :=false;
 end;
end;

procedure TFWX_MAIL_PROP.LBMBListDblClick(Sender: TObject);
var
Oldname,MBName:String;
i:Integer;
begin
i:=LBMBList.ItemIndex;
if i<0 then exit;
Oldname:=LBMBList.Items.Strings [i];
if not TTEXT_DIALOG_FORM.ShowDialog(LNG_RenMailBox,LNG_RenMailBoxName,Oldname,MBName) then exit;
RenameMailBox (Oldname,MBName);
LBMBList.Items := ReadMBList;
LBMBList.ItemIndex:=LBMBList.Items.Count-1;
RefreshBoxList;
BApply.Enabled :=False;
DataChanged:=False;
end;

procedure TFWX_MAIL_PROP.LBMBListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var 
    myColor: TColor;
    myBrush: TBrush;       
begin
  myBrush := TBrush.Create;
  with (Control as TListBox).Canvas do 
  begin 
    if not Odd(Index) then 
      myColor := TColor($c1c1c1)
    else
      myColor := TColor($cFcFcF);
    myBrush.Style := bsSolid;
    myBrush.Color := myColor;  
    Windows.FillRect(handle, Rect, myBrush.Handle);  
    Brush.Style := bsClear;   
    TextOut(Rect.Left, Rect.Top,  
            (Control as TListBox).Items[Index]);   
    MyBrush.Free; 
  end;
end;

procedure TFWX_MAIL_PROP.LBMBListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_UP) or (key=VK_DOWN) then LBMBList.OnClick (Self);
if Key=VK_DELETE then BMBDel.Click;
if Key=VK_INSERT then BMBAdd.Click;
if (KEY=VK_F2) or ((Key=VK_F6) and (ssShift in Shift)) then LBMBList.OnDblClick (self);
if Key=VK_F5 then MBCopy.Click;

if Key=VK_ESCAPE then Close;
end;

procedure TFWX_MAIL_PROP.LGradientClick(Sender: TObject);
begin
CBEnableGradient.Checked:=not CBEnableGradient.Checked;
CBEnableGradient.OnClick (Self);
end;

procedure TFWX_MAIL_PROP.LngSelectClick(Sender: TObject);
var
a,b,c,d,e,f,g,h:Byte;
begin
if LngSelect.ItemIndex<0 then exit;
SaveEditedSettings;
a:=CBAltEnter.ItemIndex;
b:=CBEnter.ItemIndex;
c:=CBTabsPosSelect.ItemIndex;
d:=CBViewAttach.ItemIndex;
e:=CBtextCaptions.ItemIndex;
f:=CBOnEmlCopy.ItemIndex;
g:=CBOnFileCopy.ItemIndex;
h:=CBSMTPAuth.ItemIndex;
LoadLanguage (GetPluginDir+LoadSettings.LNGFile);
ReadLng;
CBAltEnter.ItemIndex:=a;
CBEnter.ItemIndex:=b;
CBTabsPosSelect.ItemIndex:=c;
CBViewAttach.ItemIndex:=d;
CBtextCaptions.ItemIndex:=e;
CBOnEmlCopy.ItemIndex:=f;
CBOnFileCopy.ItemIndex:=g;
CBSMTPAuth.ItemIndex :=h;
end;

procedure TFWX_MAIL_PROP.LngSelectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then Close;
end;

procedure TFWX_MAIL_PROP.LoadLanguageList(From: String; ToLBox: TListBox);
var
sr: TSearchRec;
Begin
ToLBox.Clear;
if FindFirst(From+'*.mpl', faAnyFile, sr) = 0 then
 begin
  repeat
  TOLBox.Items.Add(sr.Name+' ('+GetAboutFromLng(from+sr.Name)+')');
  until FindNext(sr) <> 0;
 FindClose(sr);
 end;
end;

procedure TFWX_MAIL_PROP.Readlng;
begin
GBMailBoxList.Caption:=LNG_MailList;
GBGetMail.Caption:=LNG_MailRec;
LServer.Caption:=LNG_POP3;
LUser.Caption:=LNG_User;
LPass.Caption:=LNG_password;
LPassAlert.Caption:=LNG_PassAttention;
GBSendmail.Caption:=LNG_mailSend;
LSMTPServer.Caption:=LNG_SMTP;
GBUserInfo.Caption:=LNG_From;
LFIO.Caption:=LNG_FromName;
LEmail.Caption:=LNG_Email;
LOrganization.Caption:=LNG_Org;
BMBAdd.Caption:=LNG_Add;
BMBDel.Caption:=LNG_Del;
BApply.Caption:=LNG_Apply;
TSMBox.Caption:=LNG_MailOpts;
TSOPtions.Caption:=LNG_PlugOpts;
GBLang.caption:=LNG_OptsLang;
BBOk.Caption:=LNG_OK;
BBCancel.Caption:=LNG_Cancel;
MBAdd.Caption := LNG_AddMailBox;
MBDelete.Caption := LNG_DeleteMailBox;
MBRename.Caption := LNG_RenMailBox;
MBCopy.Caption := LNG_CopyMailBox;
GNAltEnterSel.Caption := LNG_OnAltEnter;
GBEnterSel.Caption := LNG_OnEnter;
CBAltEnter.Items [0] := LNG_DoOnPressSel0;
CBAltEnter.Items [1] := LNG_DoOnPressSel1;
//CBAltEnter.Items [2] := LNG_DoOnPressSel2;
CBEnter.Items [0] := LNG_DoOnPressSel0;
CBEnter.Items [1] := LNG_DoOnPressSel1;
CBEnter.Items [2] := LNG_DoOnPressSel2;
LTabsPosSelect.Caption := LNG_TabsPos;
CBTabsPosSelect.Items [0] := LNG_TabPosSel0;
CBTabsPosSelect.Items [1] := LNG_TabPosSel1;
CBTabsPosSelect.Items [2] := LNG_TabPosSel2;
CBTabsPosSelect.Items [3] := LNG_TabPosSel3;
LViewAttach.Caption := LNG_AttachView;
CBViewAttach.Items [0] := LNG_SeeAttachSel0;
CBViewAttach.Items [1] := LNG_SeeAttachSel1;
CBViewAttach.Items [2] := LNG_SeeAttachSel2;
LEAttachSavePath.EditLabel.Caption := LNG_AttachSaveDir;
TSViewerOptions.Caption := LNG_ViewerOptions;
BBSelectPath.Caption := LNG_Select;
CBCacheMessages.Caption :=LNG_CacheMessages;
LUnsaved.Caption :=LNG_UnsavedChanges;
CBMBDefault.Caption :=LNG_UseDefault;
GBConnection.Caption :=LNG_ConnectionOpts;
LTimeout.Caption :=LNG_Timeout;
LSMTPAuth.Caption:=LNG_SMTPAuth;
CBSMTPAuth.Items [0]:=LNG_SMTPAuthDisabled;
CBSMTPAuth.Items [1]:=LNG_SMTPAuthPOPFirst;
CBSMTPAuth.Items [2]:=LNG_SMTPAuthAsPOP;
CBSMTPAuth.Items [3]:=LNG_SMTPAuthSelf;
RGConnection.Caption :=LNG_Connection;
CBTLS.Caption := LNG_UseTLS;
TSAbout.Caption :=LNG_About;
LSMTPUser.Caption:=LNG_User;
LSMTPPass.Caption:=LNG_password;
CBCloseAfterSending.Caption :=LNG_CloseAfterSending;
GBButtonsOpts.Caption :=LNG_BBOptions;
LGradient.Caption := LNG_BBGradient;
LGFrom.Caption := LNG_BBFrom;
LGTo.Caption := LNG_BBTo;
CBVerticalGradient.Caption:= LNG_BBVerticalGradient;
CBFlatButtons.Caption := LNG_BBFlatButtons;
LTextCaptions.Caption := LNG_BBCaptions;
LIconSize.Caption := LNG_BBIcons;
CBTextCaptions.Items [0]:= LNG_BBonlyIcons;
CBTextCaptions.Items [1]:= LNG_BBOnlyText;
CBTextCaptions.Items [2]:= LNG_BBTextRight;
CBTextCaptions.Items [3]:= LNG_BBTextBelow;
CBPOPAuth.Caption :=LNG_POP3Auth;
CBAOnTop.Caption :=LNG_EditorAlwaysOnTop;
CBViewHeaders.Caption :=LNG_EditorShowHeaders;
CBCloseProgressAfterSending.Caption :=LNG_CloseProgressAfterSending;
CBRememberSize.Caption :=LNG_RememberEDSizePos;
CBClearheadersCache.Caption :=LNG_ClearHeadersCache;
GBSendProperties.Caption :=LNG_SendProperties;
CBuseBlat.Caption :=LNG_UseBlat;
LEBlatPath.EditLabel.Caption:=LNG_BlatPath;
LEBlatParams.EditLabel.Caption :=LNG_BlatAdditionalParams;
BBSelectBlatPath.Caption:=LNG_Select;

GBCopying.Caption := LNG_OnFilesCopying;
LOnEmlCopy.Caption := LNG_EmlFiles;
LOnOtherFileCopy.Caption := LNG_OtherFile;
CBOnEmlCopy.Items [0]:=LNG_FilesDoNothing;
CBOnEmlCopy.Items [1]:=LNG_EmlFilesDo1;
CBOnEmlCopy.Items [2]:=LNG_EmlFilesDo2;
CBOnEmlCopy.Items [3]:=LNG_EmlFilesDo3;
CBOnFileCopy.Items [0]:=LNG_FilesDoNothing;
CBOnFileCopy.Items [1]:=LNG_OtherFilesDo1;
CBOnFileCopy.Items [2]:=LNG_OtherFilesDo2;

GBAddrBookSettings.Caption :=LNG_AddrBookOptions;
CBSaveEmailsAutomatically.Caption :=LNG_AutoSaveEnteredAddress;
BBOpenAdrBook.Caption :=LNG_OpenAddressBook;

end;


procedure TFWX_MAIL_PROP.RefreshBoxList;
var
MBName:String;
I:Integer;
Mbox:TMBox;
begin
i:=LBMBList.ItemIndex;
if i<0 then exit;
MBName:=LBMBList.Items.Strings [i];
MBox:=ReadMBoxData (MBName);
EServer.Text :=MBox.POP3;
EPort.Text :=IntToStr(MBox.POP3PORT);
EUser.Text :=MBox.USER;
EPass.Text :=MBox.PASS;
ESMTPServ.Text :=MBox.SMTP;
ESMTPPort.Text :=IntToStr(MBox.SMTPPORT);
EFIO.Text :=MBox.FIO;
EEMAIL.Text :=MBox.EMAIL;
EOrganization.Text :=MBox.ORG;
CBMBDefault.Checked :=MBox.DEFAULT;
CBSMTPAuth.ItemIndex :=MBox.SMTPAUTH;
CBPOP3Auth.ItemIndex :=MBox.POP3AUTH;
ESMTPUser.Text :=MBox.SMTPUSER;
ESMTPPass.Text :=MBox.SMTPPASS;
CBTLS.Checked :=MBox.USETLS;
end;

procedure TFWX_MAIL_PROP.SaveEditedSettings;
var
s:TPluginOptions;
LString:String;
begin
if LngSelect.ItemIndex>-1 then LString:=LngSelect.Items.Strings [LngSelect.ItemIndex];
LString:=Copy(LString,0,Pos('(',LString)-2);
S.LNGFile :=LString;
S.DoOnAltEnter :=CbAltEnter.ItemIndex;
S.DoOnEnter :=CbEnter.ItemIndex;
S.AttachSaveDir :=LEAttachSavePath.Text;
S.ViewerTabPos :=CBTabsPosSelect.ItemIndex;
S.AttachViewMode :=CBViewAttach.ItemIndex;
S.CacheMessages :=CBCacheMessages.Checked;
S.ConnectionTimeout :=SEConnectionTimeout.Value;
S.EditorCloseAfterSending :=CBCloseAfterSending.Checked;
S.EditorGradientButton :=CBEnableGradient.Checked;
S.EditorGradientVertical :=CBVerticalGradient.Checked;
S.EditorGradientStart :=ColorToString (PGradientFrom.Color);
S.EditorGradientEnd :=ColorToString (PGradientTo.Color);
S.EditorIconSize :=CBIconSize.ItemIndex;
S.EditorCaptionsMode :=CBTextCaptions.ItemIndex;
S.EditorFlatButtons :=CBFlatButtons.Checked;
S.EditorAlwaysOnTop :=CBAOnTop.Checked;
S.EditorShowRFCHeaders :=CBViewHeaders.Checked;
S.EditorCloseProgressAfterSending :=CBCloseProgressAfterSending.Checked;
S.EditorSavePos :=CBRememberSize.Checked;
S.ClearCachedHeaders :=CBClearHeadersCache.Checked;
S.UseBlat := CBUseblat.Checked;
S.BlatPath :=LEBlatPath.Text;
S.BlatParams :=LEBlatParams.Text;
S.OnEmlCopy :=CBOnEmlCopy.ItemIndex;
S.OnOtherFileCopy :=CbOnFileCopy.ItemIndex;
S.AddrAutoSaveMails :=CBSaveEmailsAutomatically.Checked;
SaveSettings (S);
end;

procedure TFWX_MAIL_PROP.SaveMBEditSettings(MBIndex: Integer);
var
Mbox:TMbox;
begin
if MBIndex<0 then exit;
MBox.MBName :=LBMBList.Items.Strings [MBIndex];
MBox.POP3:=EServer.Text;
MBox.POP3PORT:=StrToInt(EPort.Text);
MBox.USER:=EUser.Text;
MBox.PASS:=EPass.Text;
MBox.SMTP:=ESMTPServ.Text;
MBox.SMTPPORT:=StrToInt(ESMTPPort.Text);
MBox.FIO:=EFIO.Text;
MBox.EMAIL:=EEMAIL.Text;
MBox.ORG:=EOrganization.Text;
MBox.DEFAULT :=CBMBDefault.Checked;
if CBSMTPAuth.ItemIndex <0 then MBox.SMTPAUTH :=0 else MBox.SMTPAUTH:=CBSMTPAuth.ItemIndex;
if CBPOP3Auth.ItemIndex <0 then MBox.POP3AUTH :=0 else MBox.POP3AUTH:=CBPOP3Auth.ItemIndex;
MBox.SMTPUSER :=ESmtpUser.Text;
MBox.SMTPPASS :=ESmtpPass.Text;
MBox.USETLS :=CBTLS.Checked;
SaveMBoxData (Mbox);
end;

end.
