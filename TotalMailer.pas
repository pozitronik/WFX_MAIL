unit TotalMailer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdPOP3,
  ComCtrls, ExtCtrls, StdCtrls,  IdMessage, Menus, PLUGIN_MAIN,IdText,
  ImgList, XPMan, ToolWin, IdAttachmentFile, Plugin_types, ShellApi, GraphUtil,
  Buttons;

Const
Tab_ViewMessage=0;
Tab_CreateMessage=1;

type
  TTOTAL_MAILER = class(TForm)
    PGTMail: TPageControl;
    TSViewMail: TTabSheet;
    TSAnswer: TTabSheet;
    REViewMail: TRichEdit;
    InfoPanel: TPanel;
    LFromC: TLabel;
    LToC: TLabel;
    LSubjectC: TLabel;
    EFrom: TEdit;
    ETo: TEdit;
    ESubject: TEdit;
    Splitter1: TSplitter;
    AttachList: TListView;
    PMAttachList: TPopupMenu;
    Save: TMenuItem;
    SaveAll: TMenuItem;
    N1: TMenuItem;
    Saveto: TMenuItem;
    SaveAllTo: TMenuItem;
    IconsList: TImageList;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    LTo: TLabel;
    LCarbonCopy: TLabel;
    LSubject: TLabel;
    ESCC: TEdit;
    ESSubj: TEdit;
    RESendText: TRichEdit;
    Splitter2: TSplitter;
    AttachListSend: TListView;
    TBSMessage: TToolBar;
    TBSend: TToolButton;
    TBtnOpen: TToolButton;
    TBOpenAnswer: TToolButton;
    TBSaveEdit: TToolButton;
    TBAddAttach: TToolButton;
    TBSender: TToolButton;
    TBPriority: TToolButton;
    MailFromSelect: TPopupMenu;
    Default1: TMenuItem;
    MailPrioritySelect: TPopupMenu;
    Highest: TMenuItem;
    High: TMenuItem;
    Normal: TMenuItem;
    Low: TMenuItem;
    Lowest: TMenuItem;
    ODMessage: TOpenDialog;
    TBSView: TToolBar;
    TBOpenView: TToolButton;
    TBSendEditorView: TToolButton;
    TBSaveMsgView: TToolButton;
    SDMessage: TSaveDialog;
    ODAttach: TOpenDialog;
    TBStayOnTop: TToolButton;
    TBStayOnTop2: TToolButton;
    PMAttachListDel: TPopupMenu;
    Delete1: TMenuItem;
    Deleteall1: TMenuItem;
    HotKeyz: TMainMenu;
    AltO: TMenuItem;
    Alts: TMenuItem;
    AltEnter1: TMenuItem;
    AltT: TMenuItem;
    CtrlEnter1: TMenuItem;
    ShiftCtrlO1: TMenuItem;
    AltA: TMenuItem;
    Esc1: TMenuItem;
    MenuImages48: TImageList;
    SMTP: TIdSMTP;
    ViewedMessage: TIdMessage;
    MenuImages32: TImageList;
    MenuImages24: TImageList;
    SendMsg: TIdMessage;
    HDRView: TMemo;
    Splitter3: TSplitter;
    AltH1: TMenuItem;
    _UnknownEdit: TEdit;
    ESTo: TEdit;
    TBAddrBook: TToolButton;
    ToolButton2: TToolButton;
    LBContactList: TListBox;
    BBAddContact: TBitBtn;
    BBStoreContact: TBitBtn;
    BBStoreContact2: TBitBtn;
    BBAddContact2: TBitBtn;
    FuckedDummyButton: TSpeedButton;
    procedure BBStoreContact2Click(Sender: TObject);
    procedure BBStoreContactClick(Sender: TObject);
    procedure BBAddContact2Click(Sender: TObject);
    procedure BBAddContactClick(Sender: TObject);
    procedure LBContactListDblClick(Sender: TObject);
    procedure TBAddrBookClick(Sender: TObject);
    procedure TBPriorityClick(Sender: TObject);
    procedure TBSenderClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure REViewMailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RESendTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RESendTextMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RESendTextMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure REViewMailMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure REViewMailMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure AltH1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AttachListSendKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMTPDisconnected(Sender: TObject);
    procedure SMTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Integer);
    procedure SMTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure Esc1Click(Sender: TObject);
    procedure AltAClick(Sender: TObject);
    procedure ShiftCtrlO1Click(Sender: TObject);
    procedure CtrlEnter1Click(Sender: TObject);
    procedure AltTClick(Sender: TObject);
    procedure AltEnter1Click(Sender: TObject);
    procedure AltsClick(Sender: TObject);
    procedure AltOClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Deleteall1Click(Sender: TObject);
    procedure TBStayOnTop2Click(Sender: TObject);
    procedure TBStayOnTopClick(Sender: TObject);
    procedure TBAddAttachClick(Sender: TObject);
    procedure TBSaveEditClick(Sender: TObject);
    procedure TBOpenAnswerClick(Sender: TObject);
    procedure TBSendEditorViewClick(Sender: TObject);
    procedure TBSaveMsgViewClick(Sender: TObject);
    procedure TBOpenViewClick(Sender: TObject);
    procedure TBtnOpenClick(Sender: TObject);
    procedure LowestClick(Sender: TObject);
    procedure LowClick(Sender: TObject);
    procedure NormalClick(Sender: TObject);
    procedure HighClick(Sender: TObject);
    procedure HighestClick(Sender: TObject);
    procedure Default1Click(Sender: TObject);
    procedure TBSendClick(Sender: TObject);
    procedure AttachListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveAllToClick(Sender: TObject);
    procedure SavetoClick(Sender: TObject);
    procedure SaveAllClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure AttachListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure SaveAttach (FromMessage:TIdMessage; ToFile:String;AttachName:String);
    Procedure DeleteAttach (var FromMsg:TIdMessage;AttachName:String);
    Procedure ReadLng;
    Procedure ShowAttachments (Msg:TIdMessage;List:TListView);
    Procedure CopyAttachments (MsgFrom:TidMessage;var MsgTo:TIdmessage);
    Procedure ClearAttachments (var Msg:TIdMessage);
    Function CheckAttachFilename (Msg:TIdMessage;aname:string):Boolean;
    Procedure ProcessSettings;
    Procedure ProcessViewMessage (VMessage:TIDmessage);
    procedure ProcessMsgAnswer(const MSG: TIdMessage;AsOpen:Boolean=False);
    Function ProcessCreateMessage (var Msg:TIdMessage):Boolean; //при ответе на письмо выбираем из исходного письма необходимую информацию;


  protected
    procedure WMDROPFILES (var Msg: TMessage); message WM_DROPFILES;
  private
    { Private declarations }
    procedure OnFromMenuSelect(Sender: TObject);
    Procedure ProgressShow (DefaultCaption:String='';DefaultStatus:String='';BTNCaption:String='';ProgressVisible:Boolean=False;ProgressPos:Integer=0;BTNEnabled:Boolean=True);
    Function SMTPConnect:Boolean;
    Function ReadSMTPParams:Boolean;
    Function MakeBlatString:String;
  public
    { Public declarations }
    ShowTab:byte;
    procedure SetVM (FromM:TIdMessage;GlobalPath:String);
  end;

var
  TOTAL_MAILER: TTOTAL_MAILER;
  DefaultMailUsed:Boolean=true;
  NoDefaultEMail:String;
  Priority:TIdMessagePriority;

  Pic: TPicture;
  Fname : String;
  TempFile: array[0..255] of Char;
  Icon : TIcon;
  Drop : THandle; {Handle for Msg.wParam}

implementation

uses progress_dialog, addr_book;

{$R *.dfm}

{-----------------------------UNCHECKED CODE HERE-------------------------------}

procedure TTOTAL_MAILER.TBSaveMsgViewClick(Sender: TObject);
begin
SDMessage.FileName :=ReplaceUnsupportedSymbols(ViewedMessage.Subject);
if SDMessage.Execute and (SDMessage.FileName<>'') then
 begin
 ViewedMessage.SaveToFile(SDMessage.FileName);
 end;
end;

procedure TTOTAL_MAILER.TBSaveEditClick(Sender: TObject);
begin
SDMessage.FileName :=ReplaceUnsupportedSymbols(EsSubj.Text);
if SDMessage.Execute and (SDMessage.FileName<>'') then
 begin
 ProcessCreateMessage (Sendmsg);
 SendMsg.SaveToFile(SDMessage.FileName);
 end;
end;

procedure TTOTAL_MAILER.TBOpenViewClick(Sender: TObject);
begin
if ODMessage.Execute and (ODMessage.FileName<>'') then
 begin
 ViewedMessage.LoadFromFile(ODMessage.FileName);
 ProcessViewMessage (ViewedMessage);
 end;
end;

procedure TTOTAL_MAILER.SetVM (FromM:TIdMessage;GlobalPath:String);
begin
//ViewedMessage:=TIdMessage.Create(TOTAL_MAILER);
CopyMessage (ExcludeTrailingBackSlash(GlobalPath),FromM,ViewedMessage);
end;

procedure TTOTAL_MAILER.TBSendEditorViewClick(Sender: TObject);
begin
if ViewedMessage<>nil then
 begin
 ProcessMsgAnswer (ViewedMessage);
 PGTmail.TabIndex :=1;
 end;
end;

procedure TTOTAL_MAILER.TBtnOpenClick(Sender: TObject);
begin
if ODMessage.Execute and (ODMessage.FileName<>'') then
 begin
 SendMsg.LoadFromFile(ODMessage.FileName);
 ProcessMsgAnswer (Sendmsg,True);
 ShowAttachments (SendMsg,AttachListSend);
 SendMsg.ClearHeader;
 end;
end;

procedure TTOTAL_MAILER.TBAddrBookClick(Sender: TObject);
var
i:Integer;
S:String;
begin
AddrBook:=TAddrBook.Create(self);
AddrBook.AllowDblClickResult :=true;
AddrBook.ShowModal;
if Assigned(AddrBook.RecResult) then
 begin
 for I := 0 to AddrBook.RecResult.Count - 1 do
  begin
  S := S+AddrBook.RecResult[i]+' '
  end;
 Delete (S,Length(S),1);
 end;
if EsTo.Text='' then EsTo.Text:=s else EsTo.Text:=EsTo.Text+' '+s;
AddrBook.Destroy;
end;

procedure TTOTAL_MAILER.TBAddAttachClick(Sender: TObject);
begin
if ODAttach.Execute and (ODAttach.FileName<>'') then
 begin
 if Not CheckAttachFilename (Sendmsg,ODAttach.FileName) then
  begin
  TIdAttachmentFile.Create(SendMsg.MessageParts, ODAttach.FileName);
  ShowAttachments (Sendmsg,AttachListSend);
  end else //аттач с таким именем существует
  begin
  MessageBox (TOTAL_MAILER.Handle,pchar('Attachment with '+ODAttach.FileName+' already exist'),'Info',Mb_ok+Mb_iconexclamation);
  end;
 end;
end;

procedure TTOTAL_MAILER.TBOpenAnswerClick(Sender: TObject);
begin
if ODMessage.Execute and (ODMessage.FileName<>'') then
 begin
 SendMsg.LoadFromFile(ODMessage.FileName);
 ProcessMsgAnswer (SendMsg,False);
 ClearAttachments (SendMsg);
 SendMsg.ClearHeader;
 end;
end;

{------------------------------CHECKED CODE HERE-------------------------------}

procedure TTOTAL_MAILER.RESendTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ssCtrl in Shift then
 begin
 if key=VK_ADD then RESendtext.Font.Size:=RESendtext.Font.Size+1 else
 if key=VK_SUBTRACT then RESendtext.Font.Size:=RESendtext.Font.Size-1;
 end;
end;

procedure TTOTAL_MAILER.RESendTextMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if ssCtrl in Shift then RESendtext.Font.Size:=RESendtext.Font.Size-1;
end;

procedure TTOTAL_MAILER.RESendTextMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if ssCtrl in Shift then RESendtext.Font.Size:=RESendtext.Font.Size+1;
end;

procedure TTOTAL_MAILER.AttachListDblClick(Sender: TObject);
var
i:integer;
begin
//Save selected only
if AttachList.SelCount =0 then exit;
for i:=0 to AttachList.Items.Count-1 do
 begin
 if AttachList.Items.Item [i].Selected then
  begin
  //сохранять в указанный каталог!
  SaveAttach (ViewedMessage,IncludeTrailingBackslash(ReplaceCMDRVars(LoadSettings.AttachSaveDir))+AttachList.Items.Item [i].Caption,AttachList.Items.Item [i].Caption);
  end;
 end;
end;

procedure TTOTAL_MAILER.SaveAllClick(Sender: TObject);
var
i:integer;
begin
if AttachList.Items.Count<1 then exit;
//Сохраняем все аттачи
for i:=0 to AttachList.Items.Count-1 do
 begin
 //сохранять в указанный каталог!
 SaveAttach (ViewedMessage, IncludeTrailingBackslash(ReplaceCMDRVars(LoadSettings.AttachSaveDir)) +AttachList.Items.Item [i].Caption,AttachList.Items.Item [i].Caption);
 end;
end;

procedure TTOTAL_MAILER.SaveAllToClick(Sender: TObject);
var
SaveDir:String;
i:integer;
begin
if AttachList.Items.Count<1 then exit;
SaveDir:=GiveFolder (LNG_SaveAttachments);
if SaveDir='' then exit;
SaveDir:=IncludeTrailingBackSlash(SaveDir);
for i:=0 to AttachList.Items.Count-1 do
 begin
 //сохранять в указанный каталог!
 SaveAttach (ViewedMessage,SaveDir+AttachList.Items.Item [i].Caption,AttachList.Items.Item [i].Caption);
 end;
end;

procedure TTOTAL_MAILER.SaveClick(Sender: TObject);
begin
AttachListDblClick (Self);
end;

procedure TTOTAL_MAILER.SavetoClick(Sender: TObject);
var
SaveDir:String;
i:integer;
begin
if AttachList.SelCount =0 then exit;
SaveDir:=GiveFolder (LNG_SaveAttachments);
if SaveDir='' then exit;
SaveDir:=IncludeTrailingBackSlash(SaveDir);
for i:=0 to AttachList.Items.Count-1 do
 begin
 if AttachList.Items.Item [i].Selected then
  begin
  //сохранять в указанный каталог!
  SaveAttach (ViewedMessage,SaveDir+AttachList.Items.Item [i].Caption,AttachList.Items.Item [i].Caption);
  end;
 end;
end;

procedure TTOTAL_MAILER.ShiftCtrlO1Click(Sender: TObject);
begin
if PGTmail.TabIndex =1 then TBOpenAnswer.CLick;
end;

procedure TTOTAL_MAILER.TBPriorityClick(Sender: TObject);
begin
TBPriority.DropDownMenu.Popup(mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TTOTAL_MAILER.REViewMailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ssCtrl in Shift then
 begin
 if key=VK_ADD then REViewmail.Font.Size:=REViewmail.Font.Size+1 else
 if key=VK_SUBTRACT then REViewmail.Font.Size:=REViewmail.Font.Size-1;;
 end;
end;

procedure TTOTAL_MAILER.REViewMailMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if ssCtrl in Shift then REViewmail.Font.Size:=REViewmail.Font.Size-1;
end;

procedure TTOTAL_MAILER.REViewMailMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if ssCtrl in Shift then REViewmail.Font.Size:=REViewmail.Font.Size+1;
end;

procedure TTOTAL_MAILER.TBSenderClick(Sender: TObject);
begin
TBSender.DropDownMenu.Popup(mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TTOTAL_MAILER.TBStayOnTop2Click(Sender: TObject);
begin
if TBStayOnTop2.Down then
 begin
 TOTAL_MAILER.FormStyle :=FsStayOnTop;
 TBStayOnTop.Down :=True;
 TBStayOnTop.ImageIndex :=8;
 TBStayOnTop2.ImageIndex :=8;
 end else
 begin
 TOTAL_MAILER.FormStyle:=fsNormal;
 TBStayOnTop.Down :=false;
 TBStayOnTop.ImageIndex :=7;
 TBStayOnTop2.ImageIndex :=7;
 end;
end;

procedure TTOTAL_MAILER.TBStayOnTopClick(Sender: TObject);
begin
if TBStayOnTop.Down then
 begin
 TOTAL_MAILER.FormStyle :=FsStayOnTop;
 TBStayOnTop2.Down :=True;
 TBStayOnTop.ImageIndex :=8;
 TBStayOnTop2.ImageIndex :=8;
 end else
 begin
 TOTAL_MAILER.FormStyle:=fsNormal;
 TBStayOnTop2.Down :=false;
 TBStayOnTop.ImageIndex :=7;
 TBStayOnTop2.ImageIndex :=7;
 end;
end;

procedure TTOTAL_MAILER.WMDROPFILES(var Msg: TMessage);
var
i, amount, size: integer;
Filename: PChar;
begin
inherited;
Amount := DragQueryFile(Msg.WParam, $FFFFFFFF, Filename, 255);
for i := 0 to (Amount - 1) do
 begin
 size := DragQueryFile(Msg.WParam, i , nil, 0) + 1;
 Filename:= StrAlloc(size);
 DragQueryFile(Msg.WParam,i , Filename, size);
 TIdAttachmentFile.Create(SendMsg.MessageParts, StrPas(FileName));
 StrDispose(Filename);
 end;
ShowAttachments (Sendmsg,AttachListSend);
DragFinish(Msg.WParam);
end;

procedure TTOTAL_MAILER.AltEnter1Click(Sender: TObject);
begin
if PGTMail.TabIndex =0 then TBSendEditorView.Click;
end;

procedure TTOTAL_MAILER.AltH1Click(Sender: TObject);
begin
if AltH1.Checked then
 begin
 HDRView.Visible :=True;
 Splitter3.Visible :=True;
 end else
 begin
 HDRView.Visible :=False;
 Splitter3.Visible :=False;
 end;
end;

procedure TTOTAL_MAILER.AttachListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
 begin
 AttachList.OnDblClick (self);
 end;
end;

procedure TTOTAL_MAILER.AttachListSendKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if KEY=VK_DELETE then
 begin
 Delete1.Click;
 end;
end;

procedure TTOTAL_MAILER.BBAddContact2Click(Sender: TObject);
var
S:TStrings;
begin
if BBAddContact2.Tag=1 then BBAddContact2.Tag:=0 else BBAddContact2.Tag:=1;
LBContactList.Visible:=False;
BBAddContact.Tag:=0;
if BBAddContact2.Tag=1 then
 begin
 LBContactList.Left :=ESCC.Left;
 LBContactList.Width :=EsCC.Width;
 LBContactList.Top :=EsCC.Top +EsCC.Height+panel1.top;
 LBContactList.Visible :=True;
 S:=TStringList.Create;
 ReadContactList (s);
 LBContactList.Items.Assign(S);
 LbContactList.Tag :=1;
 s.Free;
 end else LBContactList.Visible:=False;
end;

procedure TTOTAL_MAILER.BBAddContactClick(Sender: TObject);
var
S:TStrings;
begin
if BBAddContact.Tag=1 then BBAddContact.Tag:=0 else BBAddContact.Tag:=1;
LBContactList.Visible:=False;
BBAddContact2.Tag:=0;
if BBAddContact.Tag=1 then
 begin
 LBContactList.Left :=ESTo.Left;
 LBContactList.Width :=EsTo.Width;
 LBContactList.Top :=EsTo.Top +EsTo.Height+panel1.top;
 LBContactList.Visible :=True;
 S:=TStringList.Create;
 ReadContactList (s);
 LBContactList.Items.Assign(S);
 LbContactList.Tag :=1;
 s.Free;
 end else LBContactList.Visible:=False;
end;

procedure TTOTAL_MAILER.BBStoreContact2Click(Sender: TObject);
begin
AddAdrBookRecord (ESCC.Text,'');
end;

procedure TTOTAL_MAILER.BBStoreContactClick(Sender: TObject);
begin
AddAdrBookRecord (ESCC.Text,'');
end;

procedure TTOTAL_MAILER.AltAClick(Sender: TObject);
begin
if PGTmail.TabIndex =1 then TBAddAttach.CLick;
end;

procedure TTOTAL_MAILER.CtrlEnter1Click(Sender: TObject);
begin
if PGTmail.TabIndex =1 then TBSend.Click;
end;

procedure TTOTAL_MAILER.AltOClick(Sender: TObject);
begin
if PGTMail.TabIndex =0 then
 begin
 TBOpenView.Click;
 end else
 begin
 TBtnOpen.Click;
 end;
end;

procedure TTOTAL_MAILER.AltsClick(Sender: TObject);
begin
if PGTMail.TabIndex =0 then
 begin
 TBSaveMsgView.Click;
 end else
 begin
 TBSaveEdit.Click;
 end;
end;

procedure TTOTAL_MAILER.AltTClick(Sender: TObject);
begin
TBStayOnTop.Down := not TBStayOnTop.Down;
TBStayOnTop.Click;
end;

procedure TTOTAL_MAILER.Esc1Click(Sender: TObject);
begin
TTOTAL_MAILER(HotKeyz.Owner).Close;
end;

procedure TTOTAL_MAILER.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if LoadSettings.EditorSavePos then SaveEWindowPos (TOTAL_MAILER.Left,TOTAL_MAILER.Top,TOTAL_MAILER.Width,TOTAL_MAILER.Height);
 begin
 end;
end;

procedure TTOTAL_MAILER.FormCreate(Sender: TObject);
begin
DragAcceptFiles(Handle, True);
end;

procedure TTOTAL_MAILER.FormDestroy(Sender: TObject);
begin
DragAcceptFiles(Handle, False);
end;

procedure TTOTAL_MAILER.HighClick(Sender: TObject);
begin
Priority:=mpHigh;
end;

procedure TTOTAL_MAILER.HighestClick(Sender: TObject);
begin
Priority:=mpHighest;
end;

procedure TTOTAL_MAILER.NormalClick(Sender: TObject);
begin
Priority:=mpNormal;
end;


procedure TTOTAL_MAILER.LBContactListDblClick(Sender: TObject);
var
I:Integer;
begin
for i:= 0 to LBContactList.Count - 1 do if LBContactList.Selected [i] then break;
case LBContactList.Tag of
 1: if EsTo.Text='' then EsTo.Text:=LBContactList.Items.Strings [i] else EsTo.Text:=EsTo.Text+' '+LBContactList.Items.Strings [i];
 2: if EsCC.Text='' then EsCC.Text:=LBContactList.Items.Strings [i] else EsCC.Text:=EsTo.Text+' '+LBContactList.Items.Strings [i];
end;
LBContactList.Visible :=False;
BBAddContact.Tag:=0;
BBAddContact2.Tag:=0;
end;

procedure TTOTAL_MAILER.LowClick(Sender: TObject);
begin
Priority:=mpLow;
end;

procedure TTOTAL_MAILER.LowestClick(Sender: TObject);
begin
Priority:=mpLowest;
end;


{----------------------------IMPORTANT CODE HERE-------------------------------}

procedure TTOTAL_MAILER.SaveAttach(FromMessage:TIdMessage; ToFile: String; AttachName:String);
var
i:Integer;
begin
for i:=0 to FromMessage.MessageParts.Count-1 do
 begin
 if FromMessage.MessageParts.items[i] is TIdAttachmentFile then
  begin
   try
   if TIdAttachmentFile (FromMessage.MessageParts.items[i]).FileName =AttachName then
    begin
    TIdAttachmentFile(FromMessage.MessageParts.items[i]).SaveToFile(ToFile);
    exit;
    end;
   except
   //error
   end;
  end;
 end;
end;

procedure TTOTAL_MAILER.ShowAttachments(Msg: TIdMessage; List: TListView);
var
i:Integer;
AIcon:TIcon;
begin
List.Clear;
for i:=0 to Msg.MessageParts.Count-1 do
 begin
 if Msg.MessageParts.items[i] is TIdAttachmentFile then
  begin
  if List.Width <2 then List.Width :=180;
  try
  Case LoadSettings.AttachViewMode of
   0: begin
      AIcon:=TIcon.Create;
      AIcon :=GetIcon (TIdAttachmentFile(Msg.MessageParts.items[i]).FileName);
      with List.Items.Add do
       begin
       Caption:=TIdAttachmentFile(Msg.MessageParts.items[i]).FileName;
       ImageIndex:=IconsList.AddIcon(AIcon);
       end;
      AIcon.Free;
      end;
   1: begin
      AIcon:=TIcon.Create;
      AIcon :=GetIcon (TIdAttachmentFile(Msg.MessageParts.items[i]).FileName);
      with List.Items.Add do
       begin
       Caption:=TIdAttachmentFile(Msg.MessageParts.items[i]).FileName;
       ImageIndex:=IconsList.AddIcon(AIcon);
       end;
      AIcon.Free;
      end;
   2: List.AddItem(TIdAttachmentFile(Msg.MessageParts.items[i]).FileName,Self);
   end;
   except
   //error
   end;
  end;
 end;
end;

function TTOTAL_MAILER.ReadSMTPParams:boolean;
var
MBox:TMbox;
begin
Result:=true;
if DefaultMailUsed then
 begin
 MBox:=ReadMBoxData (GetDefaultEmail);
 end else
 begin
 MBox:=ReadMboxData (SendMsg.From.Text);
 end;
SMTP.ConnectTimeout :=LoadSettings.ConnectionTimeout*1000;
if MBox.SMTP='' then
 begin
 Result:=false;
 exit;
 end;
SMTP.Host :=MBox.SMTP;


SMTP.Port :=MBox.SMTPPORT;
case MBox.SMTPAUTH of
  0: begin //no auth required
     SMTP.AuthType :=atNone;
     end;
  1: begin //pop before smtp
     SMTP.AuthType :=atNone;
     end;
  2: begin //as pop
     SMTP.AuthType :=atDefault;
     SMTP.Username :=Mbox.USER;
     SMTP.Password :=Mbox.PASS;
     if SMTP.Password='' then
      begin //запрос POP3/SMTP пароля
      SMTP.Password :=RequestPOP3PWD (MBox.MBName);
      end;
     end;
  3: begin //own settings
     SMTP.AuthType :=atDefault;
     SMTP.Username :=Mbox.SMTPUSER;
     SMTP.Password :=Mbox.SMTPPASS;
     if SMTP.Password ='' then
      begin
      SMTP.Password :=RequestSMTPPWD (MBox.MBName);
      end;
     end;
end;
end;

function TTOTAL_MAILER.SMTPConnect: Boolean;
var
UsedMBOX:TMBox;
begin
result:=true;
if SMTP.Host ='' then
 begin
 ProgressShow (LNG_ErrorConnection,LNG_ErrorHostSpecified,LNG_OK);
 TOTAL_MAILER.Enabled :=True;
 Result:=False;
 exit;
 end;
try

if DefaultMailUsed then //нужно для POP before SMTP
 begin
 UsedMBOX:=ReadMBoxData (GetDefaultEmail);
 end else
 begin
 UsedMBOX:=ReadMboxData (SendMsg.From.Text);
 end;
if UsedMBOX.SMTPAUTH =1 then //POP before SMTP
 begin
 INITPOP3(UsedMBOX);
// CopyMBDataToPop3 (UsedMBOX,POP3);
 if POP3.Password ='' then POP3.Password := RequestPOP3PWD (UsedMBOX.MBName);
 if POP3Connect then MyLogProc (PluginNum,MSGTYPE_CONNECT,pchar('CONNECT '+POP3.host))
 else MyLogProc (PluginNum,MSGTYPE_IMPORTANTERROR ,pchar(LNG_ConnectErr));
 end;
 ProgressShow (LNG_Connection,LNG_Connecting,LNG_OK,false,0,False);
 SMTP.Connect;
 PROGRESS_DLG.Close;
except
 On e: Exception do
  begin
  PROGRESS_DLG.Close;
  if e.Message ='' then e.Message :=LNG_ErrorUnknown;
  ProgressShow (LNG_ErrorConnection,DeleteCRLF (e.Message),LNG_OK);
  Result:=False;
  TOTAL_MAILER.Enabled :=True;
  end;
end;
end;

procedure TTOTAL_MAILER.SMTPDisconnected(Sender: TObject);
begin
if not LoadSettings.EditorCloseProgressAfterSending then
 begin
 PROGRESS_DLG.Progress.Position :=PROGRESS_DLG.Progress.Max;
 PROGRESS_DLG.BtnOkCancel.Enabled :=True;
 end else PROGRESS_DLG.Destroy;
end;

procedure TTOTAL_MAILER.SMTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Integer);
begin
if PROGRESS_DLG_CNCL then
 begin
 //дисконнект не работает
 end;
if AWorkMode = wmWrite then PROGRESS_DLG.Progress.Position := AWorkCount;
Application.ProcessMessages;
end;

procedure TTOTAL_MAILER.SMTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Integer);
var S: TMemoryStream;
begin
if AWorkMode <> wmWrite then Exit;
S := TMemoryStream.Create;
 try
 // получаем размер всего сообщения
 SendMsg.SaveToStream(S, False);
 ProgressShow (LNG_MessageSendind,LNG_MessageSendingProgress,LNG_Close,True,0,False);
 PROGRESS_DLG.Progress.Max := S.Size;
 // вычитаем заголовок
 S.Clear;
 Sendmsg.SaveToStream(S, True);
 PROGRESS_DLG.Progress.Max := PROGRESS_DLG.Progress.Max - S.Size;
 finally
 S.Free;
 end;
end;

procedure TTOTAL_MAILER.TBSendClick(Sender: TObject);
var
temp:String;
begin
//запоминаем введённые адреса, если есть в опциях
if LoadSettings.AddrAutoSaveMails then
 begin
 AddAdrBookRecord (ESTo.Text,'');
 AddAdrBookRecord (ESCC.Text,'');
 end;

if ESTo.Text ='' then
 begin
 exit;
 // Logger.Lines.Add(LNG_ErrorNoRecipient);
 end;
if ESSubj.Text ='' then
 begin
 // Logger.Lines.Add(LNG_ErrorNoSubjectWarn);
 end;
if LoadSettings.UseBlat and FileExists(LoadSettings.BlatPath) then
 begin //Отсылаем с помощью BLAT
 temp:=MakeBlatString;
 if temp='' then
  begin
  ProgressShow (LNG_SMTPNotSpecified,LNG_SMTPNotSpecified,LNG_OK);
  exit;
  end else WinExec (pchar(LoadSettings.BlatPath+' '+temp),SW_SHOW );
 end else
 begin //отправка собственными средствами
 if not ReadSMTPParams then
  begin
  ProgressShow (LNG_SMTPNotSpecified,LNG_SMTPNotSpecified,LNG_OK);
  exit;
  end;
 ProcessCreateMessage (SendMsg);
 if SMTPConnect then
  begin
   try
   SMTP.Send(SendMsg);
   except
   On e: Exception do
    begin
    if e.Message ='' then e.Message :=LNG_ErrorUnknown;
    ProgressShow (LNG_ErrorConnection,DeleteCRLF (e.Message),LNG_OK);
    TOTAL_MAILER.Enabled :=True;
    SMTP.Disconnect;
    exit;
    end;
   end;
   SMTP.Disconnect;
  end;
 end;
 if LoadSettings.EditorCloseAfterSending then TOTAL_MAILER.Close;
end;

Function GetMailText (MMessage:TIdMessage):TStrings; //may be memory leak here (or not)
var
i:integer;
Begin
Result:=TStringList.Create;
if MMessage.MessageParts.Count =0 then
 begin
 Result:=MMessage.Body;
 end else
 begin
 for i:=0 to MMessage.MessageParts.Count-1 do
  begin
  if MMessage.MessageParts.items[i] is TIdText then
   begin
   Result:=TIdText(MMessage.MessageParts.items[i]).Body;
   exit;
   end;
  end;
 end;
end;

function TTOTAL_MAILER.CheckAttachFilename(Msg: TIdMessage;
  aname: string): Boolean;
var
i:Integer;
begin
result:=false;
for i:=0 to Msg.MessageParts.Count-1 do
 begin
 if Msg.MessageParts.items[i] is TIdAttachmentFile then
  begin
  if TIdAttachmentFile(Msg.MessageParts.Items[i]).FileName=aname then
   begin
   result:=true;
   exit;
   end;
  end;
 end;
end;

procedure TTOTAL_MAILER.ClearAttachments(var Msg: TIdMessage);
var
i:Integer;
begin
for i:=Msg.MessageParts.Count-1 downto 0 do
 begin
 if Msg.MessageParts.items[i] is TIdAttachmentFile then
  begin
  Msg.MessageParts.Items[i].Free;
  end;
 end;
end;

procedure TTOTAL_MAILER.CopyAttachments(MsgFrom: TidMessage;
  var MsgTo: TIdmessage);
var
i:Integer;
S:String;
begin
//проверить!!!
//заменить сохранение в файл обменом через поток
for i:=0 to MsgFrom.MessageParts.Count-1 do
 begin
 if MsgFrom.MessageParts.items[i] is TIdAttachmentFile then
  begin
  s:=GetPluginDir+'cache\'+TidAttachmentFile (MsgFrom.MessageParts.items[i]).FileName;
  TidAttachmentFile (MsgFrom.MessageParts.items[i]).SaveToFile (S);
  TIdAttachmentFile.Create(MsgTo.MessageParts, S);
//  DeleteFile (S);
//  TIdAttachmentFile.Create(MsgTo.MessageParts).Assign (MsgFrom.MessageParts.items[i]) ;
  end;
 end;
end;

procedure TTOTAL_MAILER.FormShow(Sender: TObject);
begin
ReadLng;
ProcessSettings;
//Сделать нормальный способ передачи сообщений в редактор
ProcessViewMessage (ViewedMessage);
if ShowTab=Tab_CreateMessage then
 begin
 end;
ESTo.Realign;
end;



function TTOTAL_MAILER.MakeBlatString: String;
var
BlatCMDLine:String;
BlatBox:TMBox;
BlatFirstAttach:Boolean;
I:Integer;
CurrentAttachName:String;
begin
ForceDirectories (GetTempDir+'tcmail\');
//очищаем темповый каталог
ClearDir (GetTempDir+'tcmail\');
RESendText.Lines.SaveToFile(GetTempDir+'tcmail\mailbody.txt');
BlatCMDLine:='"'+GetTempDir+'tcmail\mailbody.txt'+'" -to '+ESTo.text;
if ESCC.Text <>'' then BlatCMDLine :=BlatCMDLine+' -cc '+ESCC.Text;
BlatCMDLine :=BlatCMDLine+' -subject "'+ESSubj.Text+'"';
if DefaultMailUsed then BlatBox:=ReadMBoxData (GetDefaultEmail) else BlatBox:=ReadMboxData (NoDefaultEMail);
if BlatBox.SMTP ='' then
 begin
 result:='';
 exit;
 end;

if BlatBox.EMAIL<>'' then BlatCMDLine:=BlatCMDLine+' -f '+BlatBox.EMAIL+' -i '+BlatBox.EMAIL;
BlatCMDLine:=BlatCMDLine+' -server '+BlatBox.SMTP +' -port '+IntToStr(BlatBox.SMTPPORT);
 case BlatBox.SMTPAUTH of
 1: begin //POP before SMTP
    BlatCMDLine:=BlatCMDLine+' -serverPOP3 '+BlatBox.POP3+' -portPOP3 '+IntToStr(BlatBox.POP3PORT);
    BlatCMDLine:=BlatCMDLine+' -pu '+BlatBox.USER+' -ppw '+BlatBox.PASS+' -xtndxmit';
    end;
 2: begin //as pop
    BlatCMDLine:=BlatCMDLine+' -u '+BlatBox.USER+' -pw '+BlatBox.PASS;
    end;
 3: begin //own settings
    BlatCMDLine:=BlatCMDLine+' -u '+BlatBox.SMTPUSER +' -pw '+BlatBox.SMTPPASS;
    end;
 end;
if BlatBox.ORG<>'' then BlatCMDLine:=BlatCMDLine+' -organization "'+ BlatBox.ORG+'"';
BlatCMDLine:=BlatCMDLine+' -noh';
 case SendMsg.Priority of
 mpHighest: BlatCMDLine:=BlatCMDLine+' -priority 1';
 mpHigh: BlatCMDLine:=BlatCMDLine+' -priority 2';
 mpLow: BlatCMDLine:=BlatCMDLine+' -priority 4';
 mpLowest: BlatCMDLine:=BlatCMDLine+' -priority 5';
 end;
BlatFirstAttach:=True;
for i:=0 to SendMsg.MessageParts.Count-1 do
 begin
 if SendMsg.MessageParts.items[i] is TIdAttachmentFile then
  begin
  try
  CurrentAttachName:=GetTempDir+'tcmail\'+TIdAttachmentFile(SendMsg.MessageParts.items[i]).FileName;
  TIdAttachmentFile(SendMsg.MessageParts.items[i]).SaveToFile(CurrentAttachName);
  if BlatFirstAttach then
   begin //первый аттач
   BlatCMDLine:=BlatCMDLine+' -attach "'+CurrentAttachName;
   BlatFirstAttach:=False;
   end else
   begin
   BlatCMDLine:=BlatCMDLine+', '+CurrentAttachName;
   end;
  except
  //error
  end;
 end;
end;
if not BlatFirstAttach then BlatCMDLine:=BlatCMDLine+'"';
BlatCMDLine:=BlatCMDLine+' '+LoadSettings.BlatParams;
Result:=BlatCMDLine;
end;

procedure TTOTAL_MAILER.OnFromMenuSelect(Sender: TObject);
var
UMB:String;
i:Integer;
begin
//Обработчик меню От
TMenuItem(Sender).RadioItem :=true;
TMenuItem(Sender).Checked:=True;
DefaultMailUsed:=False;
UMB:=TMenuItem(Sender).Caption;
for i:=1 to length (UMB) do if UMB[i]='&' then delete (UMB,i,1);
NoDefaultEMail:=UMB;
{SendMsg.From.Text :=ReadMboxData (UMB).EMAIL;
SendMsg.Organization :=ReadMboxData (UMB).ORG;
SendMsg.ReplyTo.EMailAddresses:=ReadMboxData (UMB).EMAIL;}
end;

Function TTOTAL_MAILER.ProcessCreateMessage(var Msg: TIdMessage):Boolean;

 Function GetUser (Mail:String):String;
 Begin
 Result:=Copy (Mail,1,Pos('@',mail)-1);
 end;

 Function GetDomain (Mail:String):String;
 Begin
 Result:=Copy (Mail,Pos('@',mail)+1,length(mail)-Pos('@',mail));
 end;

var
UMB:String;
begin
Result:=true;
Msg.Body.Assign(RESendText.Lines);
if DefaultMailUsed then // иначе он уже выбран
 begin
 UMB:=GetDefaultEmail;
 end else
 begin
 UMB:=NoDefaultEmail;
 end;
//проверить работу, если поля будут пусты
Msg.From.Text:= ReadMboxData (UMB).EMAIL;
Msg.ReplyTo.EMailAddresses:=ReadMboxData (UMB).EMAIL;
Msg.Organization :=ReadMboxData (UMB).ORG;
Msg.ContentTransferEncoding :='7BIT';
Msg.Recipients.EMailAddresses := ESTo.Text; { To: header }
Msg.Subject := ESSubj.Text; { Subject: header }
Msg.CCList.EMailAddresses := ESCC.Text; {CC}
Msg.BccList.EMailAddresses := ESCC.Text; {BBC}
//Вставить код отправки подтверждения
Msg.ReceiptRecipient.Text := '';
//аттачики уже внутри...
end;

procedure TTOTAL_MAILER.ProcessMsgAnswer(const MSG: TIdMessage;AsOpen:Boolean=False);
var
S:TStringList;
i:integer;
begin
if Msg.Headers.Count =0 then exit;
RESendText.Clear;
S:=TStringList.Create;
S.Assign (GetMailText(Msg));
if not AsOpen then
 begin
 for I := 0 to S.Count - 1 do if S[i]<>'' then S[i]:= '> '+S[i];
 ESSubj.Text:='Re: '+Msg.Subject;
 ESTo.Text :=Msg.From.Address;
 end else
 begin
 ESSubj.Text:=Msg.Subject;
 ESTo.Text :=Msg.Recipients.EMailAddresses;
 ESCC.Text :=Msg.CCList.EMailAddresses;
 end;
RESendtext.Lines.Assign(S);
S.Destroy;
end;

procedure TTOTAL_MAILER.ProcessViewMessage (VMessage:TIDmessage);
begin
if VMessage<>nil then
 begin
 EFrom.Text :=VMessage.From.Text;
{ if VMessage.From.Address='' then
  begin
  EFrom.Text :=VMessage.From.Text;
  end else
  begin
  EFrom.Text :=//ViewedMessage.From.User +' ('+ViewedMessage.From.Address+')';
  end;}
 ETo.Text :=VMessage.Recipients.EMailAddresses;
 ESubject.Text :=VMessage.Subject;
 REViewMail.Lines := GetMailText(VMessage);
 ShowAttachments (VMessage,AttachList);
 //отображаем заголовки
  HDRView.Lines:=VMessage.Headers;
 end;
end;

procedure TTOTAL_MAILER.ProgressShow (DefaultCaption:String='';
 DefaultStatus:String='';BTNCaption:String='';ProgressVisible:Boolean=False;
 ProgressPos:Integer=0;BTNEnabled:Boolean=True);
begin
PROGRESS_DLG:=TPROGRESS_DLG.CreateParented (TOTAL_MAILER.Handle);
PROGRESS_DLG.Caption :=DefaultCaption;
PROGRESS_DLG.LStatus.Caption :=DefaultStatus;
PROGRESS_DLG.Progress.Visible :=ProgressVisible;
PROGRESS_DLG.Progress.Position :=ProgressPos;
PROGRESS_DLG.BtnOKCancel.Caption :=BTNCaption;
PROGRESS_DLG.BtnOKCancel.Enabled:=BTNEnabled;
TOTAL_MAILER.Enabled :=false;
PROGRESS_DLG.Show;
end;

procedure TTOTAL_MAILER.ProcessSettings;
var
S:TStringList;
i:integer;
begin
if LoadSettings.EditorSavePos then
 begin
 if not((LoadSettings.EditorSPWidth=0) and (LoadSettings.EditorSPHeight=0)) then 
  begin
  TOTAL_MAILER.Left := LoadSettings.EditorSPLeft;
  TOTAL_MAILER.Top := LoadSettings.EditorSPTop;
  TOTAL_MAILER.Width := LoadSettings.EditorSPWidth;
  TOTAL_MAILER.Height := LoadSettings.EditorSPHeight;
  end;
 end;
case LoadSettings.ViewerTabPos of
 0: PGTmail.TabPosition:=tpTop;
 1: PGTmail.TabPosition:=tpBottom;
 2: PGTmail.TabPosition:=tpLeft;
 3: PGTmail.TabPosition:=tpRight;
end;
case LoadSettings.AttachViewMode of
 0: begin
    AttachList.ViewStyle :=vsIcon;
    AttachListSend.ViewStyle :=vsIcon;
    end;
 1: begin
    IconsList.Width :=16;
    IconsList.Height :=16;
    AttachList.ViewStyle :=vsSmallIcon;
    AttachListSend.ViewStyle :=vsIcon;
    end;
 2: begin
    AttachList.ViewStyle :=vsList;
    AttachListSend.ViewStyle :=vsList;
    end;
end;
if LoadSettings.EditorGradientButton  then
 begin
 TBSView.DrawingStyle :=TTBDrawingStyle(dsGradient);
 TBSMessage.DrawingStyle :=TTBDrawingStyle(dsGradient);
 TBSView.GradientDrawingOptions:=[gdoGradient];
 TBSMessage.GradientDrawingOptions:=[gdoGradient];
 TBSView.GradientStartColor :=StringtoColor (LoadSettings.EditorGradientStart);
 TBSView.GradientEndColor :=StringtoColor (LoadSettings.EditorGradientEnd);
 TBSMessage.GradientStartColor :=StringtoColor (LoadSettings.EditorGradientStart);
 TBSMessage.GradientEndColor :=StringtoColor (LoadSettings.EditorGradientEnd);
 if LoadSettings.EditorGradientVertical then
  begin
  TBSView.GradientDirection:=gdVertical;
  TBSMessage.GradientDirection:=gdVertical;
  end else
  begin
  TBSView.GradientDirection:=gdHorizontal;
  TBSMessage.GradientDirection:=gdHorizontal;
  end;
 end else
 begin
 TBSView.DrawingStyle :=TTBDrawingStyle(dsNormal);
 TBSMessage.DrawingStyle :=TTBDrawingStyle(dsNormal);
 end;
case LoadSettings.EditorIconSize of
 0: begin
    TBSView.Images :=MenuImages24;
    TBSMessage.Images :=MenuImages24;
    end;
 1: begin
    TBSView.Images :=MenuImages32;
    TBSMessage.Images :=MenuImages32;
    end;
 2: begin
    TBSView.Images :=MenuImages48;
    TBSMessage.Images :=MenuImages48;
    end;
end;
case LoadSettings.EditorCaptionsMode of
 0: begin
    //only icons
    TBSView.ShowCaptions :=False;
    TBSMessage.ShowCaptions :=False;
    end;
 1: begin
    //only text
    TBSView.ShowCaptions :=True;
    TBSMessage.ShowCaptions :=True;
    TBSView.Images :=nil;
    TBSMessage.Images :=nil;
    end;
 2: begin
    //text on left
    TBSView.ShowCaptions :=True;
    TBSMessage.ShowCaptions :=True;
    TBSView.List :=true;
    TBSMessage.List :=true;
    end;
 3: begin
    //text on bottom
    TBSView.ShowCaptions :=True;
    TBSMessage.ShowCaptions :=True;
    TBSView.List :=false;
    TBSMessage.List :=false;
    end;
end;

TBSView.ButtonWidth :=24;
TBSView.ButtonHeight :=24;
TBSMessage.ButtonWidth :=24;
TBSMessage.ButtonHeight :=24;
TBSMessage.Flat := LoadSettings.EditorFlatButtons;
TBSView.Flat :=LoadSettings.EditorFlatButtons;
TBStayOnTop.Down :=LoadSettings.EditorAlwaysOnTop;
TBStayOnTop2.Down :=LoadSettings.EditorAlwaysOnTop;
TBStayOnTop.OnClick (Self);
if LoadSettings.EditorShowRFCHeaders  then
 begin
 AltH1.Checked :=True;
 HDRView.Visible :=True;
 Splitter3.Visible :=True;
 end else
 begin
 AltH1.Checked :=False;
 HDRView.Visible :=False;
 Splitter3.Visible :=False;
 end;
PGTMail.TabIndex :=ShowTab;
//Загрузка меню
S:=TStringList.Create;
S:=ReadMBList;
for i := 0 to S.Count - 1 do
 begin
 MailFromSelect.Items.Add(NewItem(S[i],0,false,true,OnFromMenuSelect,0,'FromSub'+IntToStr(i)));
 end;
S.Destroy;
end;

procedure TTOTAL_MAILER.ReadLng;
begin
LFromC.Caption := LNG_ViewerFrom;
LToC.Caption := LNG_ViewerTo;
LSubjectC.Caption := LNG_ViewerSubject;
TSViewMail.Caption := LNG_ViewerView;
TSAnswer.Caption := LNG_ViewerCreate;
PMAttachList.Items[0].Caption :=LNG_Save;
PMAttachList.Items[1].Caption :=LNG_SaveAll;
PMAttachList.Items[3].Caption :=LNG_SaveTo;
PMAttachList.Items[4].Caption :=LNG_SaveAllTo;
TBOpenView.Hint :=LNG_ToolBTNOpen;
TBOpenView.Caption :=LNG_ToolBTNOpen;
TBSaveMsgView.Hint :=LNG_ToolBTNSave;
TBSaveMsgView.Caption :=LNG_ToolBTNSave;
TBSendEditorView.Hint:=LNG_ToolBTNSendEditor;
TBSendEditorView.Caption:=LNG_ToolBTNSendEditor;
TBStayOnTop2.Hint :=LNG_ToolBtnStayOnTop;
TBStayOnTop2.Caption :=LNG_ToolBtnStayOnTop;
TBSend.Hint :=LNG_ToolBtnSend;
TBSend.Caption :=LNG_ToolBtnSend;
TBtnOpen.Hint :=LNG_ToolBTNOpen;
TBtnOpen.Caption :=LNG_ToolBTNOpen;
TBOpenAnswer.Hint :=LNG_ToolBTNOpenAnswer;
TBOpenAnswer.Caption :=LNG_ToolBTNOpenAnswer;
TBSaveEdit.Hint :=LNG_ToolBTNSave;
TBSaveEdit.Caption :=LNG_ToolBTNSave;
TBAddAttach.Hint :=LNG_ToolBTNAttach;
TBAddAttach.Caption :=LNG_ToolBTNAttach;
TBSender.Hint :=LNG_ToolBTNSender;
TBSender.Caption :=LNG_ToolBTNSender;
TBPriority.Hint:=LNG_ToolBTNPriority;
TBPriority.Caption:=LNG_ToolBTNPriority;
TBStayOnTop.Hint:=LNG_ToolBtnStayOnTop;
TBStayOnTop.Caption:=LNG_ToolBtnStayOnTop;
TBAddrBook.Caption :=LNG_OpenAddressBook;
TBAddrBook.Hint :=LNG_OpenAddressBook;
MailPrioritySelect.Items[0].Caption :=LNG_Highest;
MailPrioritySelect.Items[1].Caption :=LNG_High;
MailPrioritySelect.Items[2].Caption :=LNG_Normal;
MailPrioritySelect.Items[3].Caption :=LNG_Low;
MailPrioritySelect.Items[4].Caption :=LNG_Lowest;
LTo.Caption :=LNG_ViewerTo;
LCarbonCopy.Caption :=LNG_CC;
LSubject.Caption := LNG_ViewerSubject;
MailFromSelect.Items[0].Caption :=LNG_Default;
PMAttachListDel.Items[0].Caption :=LNG_Delete;
PMAttachListDel.Items[1].Caption :=LNG_DeleteAll;
ODAttach.Title :=LNG_AddAttach;
SDMessage.Title :=LNG_SaveMessage;
ODMessage.Title := LNG_OpenMessage;
BBAddContact.Caption :=LNG_ShowContactList;
BBAddContact2.Caption :=LNG_ShowContactList;
BBStoreContact.Caption :=LNG_StoreContact;
BBStoreContact2.Caption :=LNG_StoreContact;
end;

procedure TTOTAL_MAILER.Default1Click(Sender: TObject);
begin
DefaultMailUsed:=True;
end;

procedure TTOTAL_MAILER.Delete1Click(Sender: TObject);
var
i:integer;
begin
//Save selected only
if AttachListSend.SelCount =0 then exit;
for i:=0 to AttachListSend.Items.Count-1 do
 begin
 if AttachListSend.Items.Item [i].Selected then
  begin
  //удаляем
  DeleteAttach (SendMsg,AttachListSend.Items.Item [i].Caption);
  end;
 end;
ShowAttachments (SendMsg,AttachListSend);
end;

procedure TTOTAL_MAILER.Deleteall1Click(Sender: TObject);
begin
ClearAttachments (SendMsg);
ShowAttachments (SendMsg,AttachListSend);
end;

procedure TTOTAL_MAILER.DeleteAttach(var FromMsg: TIdMessage;
  AttachName: String);
var
i:Integer;
begin
for i:=0 to FromMsg.MessageParts.Count-1 do
 begin
 if FromMsg.MessageParts.items[i] is TIdAttachmentFile then
  begin
   try
   if TIdAttachmentFile (FromMsg.MessageParts.items[i]).FileName =AttachName then
    begin
    FromMsg.MessageParts.items[i].Free;
    exit;
    end;
   except
   //error
   end;
  end;
 end;
end;

end.
