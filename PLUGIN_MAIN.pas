unit PLUGIN_Main;
{Функции и процедуры для инициализации и корректной работы плагина}
interface
uses
 Windows,
 ShlObj,
 StrUtils,
 ShellApi,
 SysUtils,
 Classes,
 Controls,
 Graphics,
 PLUGIN_Types,
 Crypto,
 IniFiles,
 IdBaseComponent,
 IdComponent,
 IdTCPConnection,
 IdTCPClient,
 IdExplicitTLSClientServerBase,
 IdMessageClient,
 IdMessage,
 IdSSLOpenSSL,
 IdPOP3
{ IdSASL,
 IdSASLCollection,
 IdSASLUserPass,
 IdSASL_CRAM_MD5};

Type
 TMBox=packed record
  MBName,
  POP3,
  USER,
  PASS,
  SMTPUSER,
  SMTPPASS,
  SMTP,
  FIO,
  EMAIL,
  ORG:String;
  POP3PORT,
  SMTPPORT:WORD;
  DEFAULT,
  USETLS:Boolean;
  SMTPAUTH:Byte;
  POP3AUTH:Byte;
 end;

 TBoxPWD=packed record
  Box:String;
  POP3Pwd:String;
  SMTPPwd:String;
 end; 

 TPluginOptions=packed record
  LNGFile:String;
  DoOnAltEnter:Byte;
  DoOnEnter:Byte;
  AttachSaveDir:String;
  ViewerTabPos:Byte;
  AttachViewMode:Byte;
  CacheMessages:Boolean;
  ClearCachedHeaders:Boolean;
  ConnectionTimeout:Integer;
  UseBlat:Boolean;
  BlatPath:String;
  BlatParams:String;
  OnEmlCopy:Byte;
  OnOtherFileCopy:Byte;
  EditorCloseAfterSending:Boolean;
  EditorGradientButton:Boolean;
  EditorGradientVertical:Boolean;
  EditorGradientStart:String;
  EditorGradientEnd:String;
  EditorIconSize:byte;
  EditorCaptionsMode:byte;
  EditorFlatButtons:Boolean;
  EditorAlwaysOnTop:Boolean;
  EditorShowRFCHeaders:Boolean;
  EditorCloseProgressAfterSending:Boolean;
  EditorSavePos:Boolean;
  EditorSPLeft,EditorSPTop,EditorSPHeight,EditorSPWidth:integer;
  AddrAutoSaveMails:Boolean;
 end;

  MyPOP3=Class (TIdPOP3)
  procedure OnWorkBegin (ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Integer);
  end;

var
MainIni,Options:TIniFile;
POP3:MYPOP3;
SSL:TIdSSLIOHandlerSocketOpenSSL;
//MD5:TIdSASLCRAMMD5;
TempStoredPWD: array of TBoxPWD;
CopiedFileList:TStringList;
{Callback data}
PluginNum:Integer;
MyProgressProc:TProgressProc;
MyLogProc:TLogProc;
MyRequestProc:TRequestProc;
{progress dialog cancel}
PROGRESS_DLG_CNCL:Boolean;
{language controls}
LNG_MailList:String='Mailbox list';
LNG_MailRec:String='Mail receiving';
LNG_POP3:String='POP3 server [port]:';
LNG_User:String='User:';
LNG_password:String='Password:';
LNG_PassAttention:String='Attention! Password saved in plaintext!';
LNG_mailSend:String='Mail sending';
LNG_SMTP:String='SMTP server [port]:';
LNG_From:String='From information';
LNG_FromName:String='From Name:';
LNG_Email:String='E-mail:';
LNG_Org:String='Organisation:';
LNG_Add:String='Add';
LNG_Del:String='Delete';
LNG_Apply:String='Apply';
LNG_OK:String='OK';
LNG_Cancel:String='Cancel';
LNG_PassRequest:String='Password request';
LNG_PassReqMsg:String='Password for this mailbox is not specified. Enter password now to gain access.';
LNG_Password2:String='Password:';
LNG_SavePvd:String='Save password (don''t ask anymore).';
LNG_TryReceive:String='Trying to receive mail from %s';
LNG_ConnectErr:String='Can''t connect to server/can''t gain acces to mailbox.';
LNG_RecSize:String='Trying to receive mailbox size';
LNG_RecHeaders:String='Mail headers receiving...';
LNG_LettersCount:String='%d letters in %s mailbox';
LNG_RecAllHeaders:String='All headers received.';
LNG_Disconnect:String='Disconnecting from %s';
LNG_RecLetter:String='Receive letter №%d';
LNG_DelLetter:String='Delete letter №%d';
LNG_DelLetterSucc:String='Letter deleted successfully';
LNG_CantDelLetter:String='Cannot delete letter';
LNG_AddMailBox:String='Add mailbox';
LNG_NewMailBoxName:String='Enter new mailbox name';
LNG_RenMailBox:String='Rename mailbox';
LNG_RenMailBoxName:String='Enter new name for mailbox';
LNG_MailOpts:String='Mail options';
LNG_PlugOpts:String='Plugin options';
LNG_OptsLang:String='Interface language';
LNG_CopyMailBox:String='Copy mailbox';
LNG_CopyMailBoxname:String='Enter name for mailbox copy';
LNG_DeleteMailBox:String='Delete mailbox';
LNG_HeadersDownloadingAbort:String='Headers downloading aborted';
LNG_OnAltEnter:String='On Alt+Enter start:';
LNG_OnEnter:String='On Enter start:';
LNG_ViewerOptions:String='Viewer\Mailer options';
LNG_TabsPos:String='Tabs position in viewer window:';
LNG_AttachView:String='See attachments as:';
LNG_AttachSaveDir:String='Default directory to save attachments';
LNG_Select:String='Select';
LNG_DoOnPressSel0:String='Internal viewer (read message)';
LNG_DoOnPressSel1:String='Internal mailer (answer to message)';
LNG_DoOnPressSel2:String='External program, assotiated with *.eml';
LNG_TabPosSel0:String='On top';
LNG_TabPosSel1:String='On bottom';
LNG_TabPosSel2:String='On left';
LNG_TabPosSel3:String='On right';
LNG_SeeAttachSel0:String='List with large icons';
LNG_SeeAttachSel1:String='List with small icons';
LNG_SeeAttachSel2:String='List without icons';
LNG_ViewerView:String='View message';
LNG_ViewerCreate:String='Create message';
LNG_ViewerFrom:String='From:';
LNG_ViewerTo:String='To:';
LNG_ViewerSubject:String='Subject:';
LNG_Save:String='Save';
LNG_SaveAll:String='Save all';
LNG_SaveTo:String='Save to...';
LNG_SaveAllTo:String='Save all to...';
LNG_SaveAttachments:String='Save attachments';
LNG_SelAttachSaveDir:String='Select default directory to save attachments';
LNG_CacheMessages:String='Cache received messages';
LNG_UnsavedChanges:String='You have unsaved changes!';
LNG_ToolBTNOpen:String='Open message';
LNG_ToolBTNSave:String='Save message';
LNG_ToolBTNSendEditor:String='Answer to message';
LNG_ToolBtnStayOnTop:String='Stay on top on/off';
LNG_ToolBtnSend:String='Send message';
LNG_ToolBTNOpenAnswer:String='Open message to answer';
LNG_ToolBTNAttach:String='Add attachment';
LNG_ToolBTNSender:String='Send from email...';
LNG_ToolBTNPriority:String='Message priority';
LNG_Highest:String='Highest';
LNG_High:String='High';
LNG_Normal:String='Normal';
LNG_Low:String='Low';
LNG_Lowest:String='Lowest';
LNG_CC:String='CC';
LNG_Default:String='Default';
LNG_Delete:String='Delete';
LNG_DeleteAll:String='Delete all';
LNG_UseDefault:String='Use this mailbox by default';
{Error messages still untranslated}
LNG_ErrorNoRecipient:String='Error: no recipient';
LNG_ErrorNoSubjectWarn:String='Warning: no subject';
{-}
LNG_ConnectionOpts:String='Common connectons options';
LNG_Timeout:String='Connection timeout (sec):';
LNG_ErrorConnection:String='SMTP connection error';
LNG_ErrorHostSpecified:String='Host must be specified';
LNG_ErrorUnknown:String='Unknown error';
LNG_MessageSendind:String='Message sending';
LNG_MessageSendingProgress:String='Sending progress';
LNG_SMTPAuth:String='SMTP authentification:';
LNG_SMTPAuthDisabled:String='Disabled';
LNG_SMTPAuthPOPFirst:String='POP before SMTP';
LNG_SMTPAuthAsPOP:String='Use POP3 settings';
LNG_SMTPAuthSelf:String='Own settings';
LNG_Connection:String='Connection';
LNG_UseTLS:String='Secure connection (TLS)';
LNG_About:String='About...';
LNG_CloseAfterSending:String='Close editor after message sending';
LNG_BBOptions:String='Button bar options';
LNG_BBGradient:String='Gradient fill';
LNG_BBFrom:String='From';
LNG_BBTo:String='To';
LNG_BBVerticalGradient:String='Vertiсal gradient';
LNG_BBFlatButtons:String='Flat buttons';
LNG_BBCaptions:String='Button captions:';
LNG_BBIcons:String='Button size:';
LNG_BBonlyIcons:String='Only icons';
LNG_BBOnlyText:String='Only text';
LNG_BBTextRight:String='Text and icons on right';
LNG_BBTextBelow:String='Icons and text below';
LNG_POP3Auth:String='POP3 authentification:';
LNG_EditorAlwaysOnTop:String='Editor always on top';
LNG_EditorShowHeaders:String='Show RFC 822 headers';
LNG_AddAttach:String='Select file to add';
LNG_SaveMessage:String='Save message';
LNG_OpenMessage:String='Open message';
LNG_Close:String='Close';
LNG_CloseProgressAfterSending:String='Close progress window after message sending';
LNG_Connecting:String='Connecting...';
LNG_RememberEDSizePos:String='Remember editor window size && position';
LNG_ClearHeadersCache:String='Clear headers cache on disconnect';
LNG_SelectBlat:String='Select blat.exe';
LNG_SendProperties:String='Mail sending poptions';
LNG_BlatPath:String='Path to blat.exe:';
LNG_BlatAdditionalParams:String='Additional Blat commandline parameters:';
LNG_UseBlat:String='Use Blat for mail sending';

LNG_OnFilesCopying:String='On copy files to plugin filesystem:';
LNG_EmlFiles:String='On *.eml files:';
LNG_OtherFile:String='On other files:';
LNG_FilesDoNothing:String='Do nothing';
LNG_EmlFilesDo1:String='Open message as draft';
LNG_EmlFilesDo2:String='Open message for answer';
LNG_EmlFilesDo3:String='Try to send message';
LNG_OtherFilesDo1:String='Create new mail with this files attached';
LNG_OtherFilesDo2:String='Create new mail with this file attached and send to used mailbox';
LNG_SMTPNotSpecified:String='SMTP server not specified for used mailbox';

LNG_AddAddrBookRecord:String='Add new address';
LNG_NewAddrBookRecord:String='E-mail:';
LNG_RenAddrBookRecord:String='Change E-Mail';
LNG_AddrBookOptions:String='Address book options';
LNG_AutoSaveEnteredAddress:String='Save all entered addresses';
LNG_OpenAddressBook:String='Open address book';
LNG_Contacts:String='E-mails';
LNG_ContactInfo:String='E-mail info';
LNG_ApplyContact:String='Apply selected';
LNG_AddContact:String='Add new address';
LNG_DeleteContact:String='Delete address';
LNG_RenameContact:String='Rename address';
LNG_ShowContactList:String='Show address list';
LNG_StoreContact:String='Add to address book';

function GetPercentage (TotalCount,CurrentValue:Integer):Byte;
function FindTCWindow: HWND;
Function GetPluginDir:String;
function DateTime2FileTime(value: TDateTime):TFileTime;
Function GetTempDir:String;


Procedure SaveMBoxData (MboxData:TMbox);

Function ReadMBoxData (MboxName:String):TMbox;
Function ReadMBList:TStringList;
Function ReadMBListNames:TStringList;

Function GetDefaultEmail:String;

Procedure AddMailBox (MBname:String);
Procedure CopyMailBox (FromMB,ToMB:String);
Procedure RenameMailBox (FromMB,ToMB:String);
Procedure DeleteMailBox (MBname:String);

Function RequestSMTPPWD (MBox:String):String; //Запрашиваем SMTP пароль...
Function RequestPOP3PWD (MBox:String):String; //Запрашиваем пароль...
Procedure INITPOP3 (MB:TMBox);
Function POP3CONNECT:Boolean; //соединение, диагностика ошибок
Procedure RELEASEPOP3;

Function GetMsgNum (MsgName:String):Integer;
Function ExtractFSFileName(FSPath:String):String;
Function ReplaceUnsupportedSymbols (Name:String):String;

Procedure CacheMailHeader (MailBoxID:String;MsgNum:Integer;Header:TIdMessage);
Function IsMessageCached (MailBoxID:String;{MsgNum:Integer}MsgUID:String):Boolean;
Function ReadHeaderFromCache (MailBoxID:String;MsgNum:Integer):TIdMessage;
Procedure CacheMailMessage (MailBoxID:String;{MsgNum:Integer}MsgUID:String;MailMessage:TIdMessage);
Function ReadMailFromCache (MailBoxID:String;{MsgNum:Integer}MsgUID:String;var msg:TIdMessage):Boolean;
Procedure FlushMailCache (MailBoxID:String='');
Procedure FlushMailHdrCache (MailBoxID:String='');

Procedure TemporaryStorePWD (MBox:String;POP3PWD,SMTPPWD:String);
Function GetTemporaryStoredPWD (MBox:String;SMTP:Boolean=false):String; //Функции, чтобы не переспрашивать пароль до выхода...

procedure LoadLanguage (LangFile: shortstring);
function GetAboutFromLng(LangFile: string): string;

Function LoadSettings:TPluginOptions;
Procedure SaveSettings (Opts:TPluginOptions);
Procedure SaveEWindowPos (L,T,W,H:Integer);

Function GiveFolder (caption:string):string;
function GetIcon(const FileName: String): TIcon;

Function DeleteCRLF (FromStr:String):String;
Function ReplaceCMDRVars (Path:String):String; //заменяет в строке переменные %commander_ на соответствующие значения

Procedure AddToCopiedFileList(FileName:String);
Procedure ClearCopiedFileList;

Procedure ReadContactList (var S:TStrings);
Function AddAdrBookRecord (Email,Descr:String):Boolean;
Function ReadRecordInfo (Email:String):String;

//----------------Функции для всякой мелкой рутины----------------------------//

Function DeletePathUnnedeedDelimeters (Path:String;Mode:Integer=0):String; //разная мелкая обработка текста - удаление лишних символов...
//Procedure CopyMBDataToPop3 (MB:TMBox;Var POP3: TIdPOP3); //просто перенос полей
Procedure RetrieveMessage (MailBoxName:String;MsgNum:Integer;CachedMsgUID:String;var POP3:myPop3; var ToMSG:TIdMessage; IgnoreCaching:Boolean=False); //пытаемся прочесть собщение из кеша, если не получается - обращаемся напрямую
Procedure CopyMessage ({MsgNum:Integer;} MailBoxName:String; const FromMSG:TIdMessage;var ToMSG: TIdMessage); //осуществляет копирование сообщения (через кеш либо темповый файл)
Procedure CopyMessageViaBuf (const FromMSG:TIdMessage;var ToMSG: TIdMessage); //осуществляет копирование сообщения (через темповый файл)
Procedure PrepareFindData (var FindData:tWIN32FINDDATA; Name:String; dir:Boolean=true; SizeLow:Dword=0;Time:TDateTime=0);
Procedure ClearDir (Dir:String);
{------------------------------------------------------------------------------}

implementation

uses pwd_dialog;

Procedure AddToCopiedFileList(FileName:String);
Begin
if not Assigned (CopiedFileList) then CopiedFileList:=TStringList.Create;
CopiedFileList.Add(FileName); 
end;

Procedure ClearCopiedFileList;
Begin
CopiedFileList.Free;
end;

function ReplaceCMDRVars (Path:String):String; //заменяет в строке переменные %commander_ на соответствующие значения
var
scp,scd:string;
Begin
scp:=GetEnvironmentVariable ('commander_path');
scd:=GetEnvironmentVariable ('commander_drive');
Result:=Lowercase(Path);
Result :=AnsiReplaceStr (Result,'%commander_path%',scp);
Result :=AnsiReplaceStr (Result,'%commander_drive%',scd);
end;

Function DeleteCRLF (FromStr:String):String;
var
crlf:set of char;
i:integer;
Begin
Result:=FromStr;
if FromStr='' then exit;
crlf :=[#$D,#$A];
while (Result[Length(result)] in crlf) do
 begin
 Delete (Result,Length(result),1);
 end;
for i:=1 to Length(result) do
 begin
 if Result[i] in crlf then Result[i]:=' '; 
 end;
end;

function GetIcon(const FileName: String): TIcon;
var
test_file: array[1..255] of Char;
FileInfo: TSHFileInfo;
begin
StrPCopy(@test_file,ExtractFileExt(Filename));
SHGetFileInfo(@test_file,0,FileInfo,SizeOf(FileInfo),SHGFI_ICON or SHGFI_USEFILEATTRIBUTES);
Result := TIcon.Create;
Result.Handle := FileInfo.hIcon;
End;

function GetPercentage (TotalCount,CurrentValue:Integer):Byte;
Begin
if CurrentValue>=TotalCount then CurrentValue:=TotalCount;
Result:=(CurrentValue*100) div TotalCount;
end;

Function GiveFolder (caption:string):string;
var
lpItemID : PItemIDList;
BrowseInfo : TBrowseInfo;
DisplayName : array[0..MAX_PATH] of char;
TempPath : array[0..MAX_PATH] of char;
begin
Result:='';

strcopy (DisplayName,pchar(Caption));
DisplayName:='';
FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
BrowseInfo.hwndOwner := FindTCWindow;
BrowseInfo.pszDisplayName := @DisplayName;
BrowseInfo.lpszTitle := PChar(caption);
BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
lpItemID := SHBrowseForFolder(BrowseInfo);
if lpItemId <> nil then begin
 SHGetPathFromIDList(lpItemID, TempPath);
 Result:=TempPath;
 GlobalFreePtr(lpItemID);
end;
end;

function GetAboutFromLng(LangFile: string): string;
var
f:textfile;
s:string;
begin
AssignFile (f,LangFile);
reset (f);
while (not eof(f)) do
 begin
 readln(f,s);
 if copy (s,1,1)='0' then
  begin
  closefile(f);
  result:=copy (s,pos ('=',s)+1,length (s));
  exit;
  end;
 end;
end;

Function ReplaceUnsupportedSymbols (Name:String):String;
var
i:Integer;
UnsupportedChars: set of char;
Begin
UnsupportedChars:=['/','\',':','*','<','>','|','?','"',#$D,#$A];
for i:=1 to length (Name) do
 begin
 if Name[i] in UnsupportedChars then Name[i]:='_';
 end;
Result:=name;//Copy(Name,1,4);
end;

Function ExtractFSFileName(FSPath:String):String;
Begin
Delete (FSPath,1,1);
Delete (FSPath,1,pos('\',FSPath));
Result:=FSPath;
end;

Function GetMsgNum (MsgName:String):Integer;
begin
result:=-1;
 try
 Result:=StrToInt(Copy(MsgName,2,Pos(']_',MsgName)-2));
 except
 //do nothing
 end;
end;

function DateTime2FileTime(value: TDateTime):TFileTime;
var
 x: longint;
begin
 x:=DateTimeToFileDate(value);
 DosDateTimeToFileTime (hiword(x),loword(x),result);
 LocalFileTimeToFileTime (Result,Result);
end;

Function GetPluginDir:String;
var
x:pchar;
begin
GetMem (x,max_path);
GetModuleFilename (hInstance,x,max_path);
Result:=x;
Result:=ExtractFilePath(Result);
freemem (x);
end;

Function GetTempDir:String;
var
TempPath: array [0..MAX_PATH] of Char;
begin
GetTempPath (MAX_PATH,TempPath);
Result:=IncludeTrailingbackSlash(TempPath);
end;

Procedure CreateMainIniFile;
begin
MainIni:=TiniFile.Create(GetPluginDir+'mailbox.ini');
end;

Procedure CreateOptionsFile;
begin
Options:=TiniFile.Create(GetPluginDir+'options.ini');
end;

function FindTCWindow: HWND;
begin
 Result := FindWindow ('TTOTAL_CMD', nil);
end;

Procedure SaveMBoxData (MboxData:TMbox);
Begin
CreateMainIniFile;
MainIni.WriteString(MboxData.MBName ,'POP3',MboxData.POP3);
MainIni.WriteInteger(MboxData.MBName,'POP3PORT',MboxData.POP3PORT );
MainIni.WriteString(MboxData.MBName ,'USER',MboxData.USER);
if MboxData.USER<>'' then MainIni.WriteString(MboxData.MBName ,'PASS',Encrypt(MboxData.PASS,MboxData.USER));
MainIni.WriteString(MboxData.MBName ,'SMTP',MboxData.SMTP);
MainIni.WriteString(MboxData.MBName ,'SMTPUSER',MboxData.SMTPUSER);
if MboxData.SMTPUSER<>'' then MainIni.WriteString(MboxData.MBName ,'SMTPPASS',Encrypt(MboxData.SMTPPASS,MboxData.SMTPUSER));
MainIni.WriteInteger(MboxData.MBName,'SMTPPORT',MboxData.SMTPPORT);
MainIni.WriteString(MboxData.MBName ,'FIO',MboxData.FIO);
MainIni.WriteString(MboxData.MBName ,'EMAIL',MboxData.EMAIL);
MainIni.WriteString(MboxData.MBName ,'ORG',MboxData.ORG);
MainIni.WriteInteger(MboxData.MBName,'SMTPAUTH',MboxData.SMTPAUTH);
MainIni.WriteInteger(MboxData.MBName,'POP3AUTH',MboxData.POP3AUTH);
MainIni.WriteBool(MboxData.MBName,'USETLS',MBoxData.USETLS);
MainIni.Free;
if MboxData.DEFAULT  then
 begin
 CreateOptionsFile;
 Options.WriteString('MAIN','DefMailBox',MboxData.MBName);
 Options.Free;
 end;
end;

Function ReadMBoxData (MboxName:String):TMbox;
Begin
CreateMainIniFile;
Result.MBName :=MBoxName;
Result.POP3:=MainIni.ReadString (MboxName,'POP3','');
Result.POP3PORT :=MainIni.ReadInteger(MboxName,'POP3PORT',110);
Result.USER:=MainIni.ReadString (MboxName,'USER','');
Result.PASS:=Decrypt(MainIni.ReadString (MboxName,'PASS',''),Result.USER);
Result.SMTP:=MainIni.ReadString (MboxName,'SMTP','');
Result.SMTPUSER:=MainIni.ReadString (MboxName,'SMTPUSER','');
Result.SMTPPASS:=Decrypt(MainIni.ReadString (MboxName,'SMTPPASS',''),Result.SMTPUSER);
Result.SMTPPORT:=MainIni.ReadInteger(MboxName,'SMTPPORT',25 );
Result.SMTPAUTH :=MainIni.ReadInteger(MboxName,'SMTPAUTH',0);
if Result.SMTPAUTH>3 then Result.SMTPAUTH:=0;
Result.POP3AUTH :=MainIni.ReadInteger(MboxName,'POP3AUTH',0);
if Result.POP3AUTH>2 then Result.POP3AUTH:=0;
Result.USETLS :=MainIni.ReadBool(MboxName,'USETLS',false);
Result.FIO:=MainIni.ReadString (MboxName,'FIO','');
Result.EMAIL:=MainIni.ReadString (MboxName,'EMAIL','');
Result.ORG:=MainIni.ReadString (MboxName,'ORG','');
MainIni.Free;
CreateOptionsFile;
Result.DEFAULT :=False;
if Options.ReadString('MAIN','DefMailBox','')=Result.MBName then
 begin
 Result.DEFAULT :=True;
 end;
Options.Free;
end;

Function ReadMBList:TStringList;
Begin
CreateMainIniFile;
Result:=TStringList.Create;
MainIni.ReadSections(Result);
MainIni.Free;
end;

Function ReadMBListNames:TStringList;
var
i:Integer;
Begin
CreateMainIniFile;
Result:=TStringList.Create;
MainIni.ReadSections(Result);
for i := 0 to Result.Count - 1 do
 begin
 Result.Strings [i]:=MainIni.ReadString(Result.Strings [i],'EMAIL',Result.Strings [i])
 end;
MainIni.Free;
end;                

Function GetDefaultEmail:String;
var
S:TStrings;
Begin
CreateOptionsFile;
Result:=Options.ReadString('Main','DefMailBox','');
//добавить обработчик, если не выбран ящик
if Result='' then
 begin
 S:=TStringList.Create;
 S:= ReadMBList;
 //!запрос на отправку, если ящики не созданы
 if s.Count >0 then Result:=S[0];
 S.Free;
 end;
Options.Free;
end;

Procedure AddMailBox (MBname:String);
Begin
CreateMainIniFile;
MainIni.WriteString(MBName,'EMAIL',MBName);
MainIni.Free;
end;

Procedure CopyMailBox (FromMB,ToMB:String);
var
RenamedBox:TMbox;
Begin
RenamedBox:=ReadMBoxData (FromMB);
RenamedBox.MBName :=ToMB;
SaveMBoxData (RenamedBox);
end;

Procedure RenameMailBox (FromMB,ToMB:String);
var
RenamedBox:TMbox;
Begin
RenamedBox:=ReadMBoxData (FromMB);
RenamedBox.MBName :=ToMB;
DeleteMailBox (FromMb);
SaveMBoxData (RenamedBox);
end;

Procedure DeleteMailBox (MBname:String);
begin
CreateMainIniFile;
MainIni.EraseSection(MBName);
MainIni.Free;
end;

Procedure TemporaryStorePWD (MBox:String;POP3PWD,SMTPPWD:String);
var
i:integer;
Begin
for i:=0 to length(TempStoredPWD) - 1 do
 begin
 if TempStoredPWD[i].Box = Mbox then
  begin
  if POP3PWD<>'' then TempStoredPWD[i].POP3Pwd := POP3PWD;
  if SMTPPWD<>'' then TempStoredPWD[i].SMTPPwd := SMTPPWD;
  exit;
  end;
 end;
SetLength (TempStoredPWD,Length (TempStoredPWD)+1);
TempStoredPWD[Length(TempStoredPWD)-1].Box :=MBox;
TempStoredPWD[Length(TempStoredPWD)-1].POP3Pwd:=POP3PWD;
TempStoredPWD[Length(TempStoredPWD)-1].SMTPPwd:=SMTPPWD;
end;

Function GetTemporaryStoredPWD (MBox:String;SMTP:Boolean=false):String;
var
i:integer;
Begin
result:='';
for I := 0 to length(TempStoredPWD) - 1 do
 begin
 if TempStoredPWD[i].Box =MBox then
  begin
  if SMTP then result:= TempStoredPWD[i].SMTPPwd else result := TempStoredPWD[I].POP3Pwd;
  end;
 end;
end;

//-----------------------------------POP3-------------------------------------//

//Эта функция должна вызываться ТОЛЬКО если установлены собственные параметры аутентификации SMTP
Function RequestSMTPPWD (MBox:String):String; //Запрашиваем SMTP пароль...
var
Box:TMbox;
Begin
Result:=GetTemporaryStoredPWD (MBox,True);
if Result='' then //пароль не был временно сохранён
 begin
 Pwd_dialog_form:=TPWD_DIALOG_FORM.Create(nil);
 Pwd_dialog_form.ShowModal;
 Result:=Pwd_dialog_form.ResultPwd;
 if Pwd_dialog_form.SavePwd then
  begin
  //сохраняем пароль в профиле
  Box:=ReadMBoxData (MBox);
  Box.MBName :=MBox;
  Box.SMTPPASS :=Result;
  SaveMBoxData (Box);
  end;
 TemporaryStorePWD (MBox,'',Result);
 Pwd_dialog_form.Destroy;
 end;
end;            

Function RequestPOP3PWD (MBox:String):String; //Запрашиваем пароль...
var
Box:TMbox;
Begin
Result:=GetTemporaryStoredPWD (MBox);
if Result='' then //пароль не был временно сохранён
 begin
 Pwd_dialog_form:=TPWD_DIALOG_FORM.Create(nil);
 Pwd_dialog_form.ShowModal;
 Result:=Pwd_dialog_form.ResultPwd;
 if Pwd_dialog_form.SavePwd then
  begin
  //сохраняем пароль в профиле
  Box:=ReadMBoxData (MBox);
  Box.MBName :=MBox;
  Box.PASS :=Result;
  SaveMBoxData (Box);
  end;
 TemporaryStorePWD (MBox,Result,'');
 Pwd_dialog_form.Destroy;
 end;
end;

Procedure INITPOP3 (MB:TMBox);
Begin
POP3:=MYPOP3.Create;
POP3.Host:=MB.POP3;
POP3.Port :=MB.POP3PORT;
POP3.Username :=MB.USER;
POP3.Password := MB.PASS;
POP3.UseTLS :=utNoTLSSupport;
if MB.USETLS then
 begin
 SSL:=TIDSSLIOhandlerSocketOpenSSL.Create(POP3);
 POP3.IOHandler :=SSL;
 POP3.UseTLS :=utUseImplicitTLS;
 end;
case MB.POP3AUTH of
 0: POP3.AuthType :=TIdPOP3AuthenticationType(atUserPass);//plaintext auth
 1: POP3.AuthType :=TIdPOP3AuthenticationType(atAPOP);//APOP auth
{ 2: begin
    MD5:=TIdSASLCRAMMD5.Create(POP3);
    SASL:=TIdSASLEntries.Create(POP3);
    POP3.AuthType :=TIdPOP3AuthenticationType(atSASL);//SASL auth
    end;}
end;
end;

Function POP3CONNECT:Boolean; //соединение, диагностика ошибок
Begin
result:=True;
 try
 POP3.ConnectTimeout:=LoadSettings.ConnectionTimeout*1000;
 //Ошибка при недостаточном таймауте и медленном канале - плаг не успевает сконнектиться, тотал виснет с ошибкой
 POP3.CONNECT;
 except
 On E : Exception do
  begin
  if @MyLogProc<>nil then MyLogProc (PluginNum,MSGTYPE_IMPORTANTERROR,pchar(DeleteCRLF(E.Message)));
  result:=false;
  end;
 end;
end;

Procedure RELEASEPOP3;
Begin
POP3.Free;
end;

//----------------------------------------------------------------------------//

Procedure CacheMailHeader (MailBoxID:String;MsgNum:Integer;Header:TIdMessage);
var
Path:String;
begin
Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
ForceDirectories (path);
Header.SaveToFile(path+IntToStr(MsgNum)+'.hdr');
end;

//! дописать действия при невозможности прочесть из кеша - например, если юзер сам его почистил!!!
Function ReadHeaderFromCache (MailBoxID:String;MsgNum:Integer):TIdMessage;
var
Path:String;
begin
Result:=TIdMessage.Create;
//Result:=nil;
Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
if FileExists (Path+IntToStr(MsgNum)+'.hdr') then
 begin
  try
  Result.LoadFromFile(Path+IntToStr(MsgNum)+'.hdr');
  except
  //не могу прочесть из кеша
  end;
 end;
end;

Function IsMessageCached (MailBoxID:String;{MsgNum:Integer}MsgUID:String):Boolean;
Begin
Result:=FileExists (ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\'+ReplaceUnsupportedSymbols(MsgUID)+'.eml');
end;

Procedure CacheMailMessage (MailBoxID:String;{MsgNum:Integer}MsgUID:String;MailMessage:TIdMessage);
var
Path:String;
begin
Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
ForceDirectories (path);
MailMessage.SaveToFile(path+{!!}ReplaceUnsupportedSymbols(MsgUID)+'.eml');
end;

Function ReadMailFromCache (MailBoxID:String;{MsgNum:Integer}MsgUID:String;var msg:TIdMessage):Boolean;
var
Path:String;
begin
Result:=False;
Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
if FileExists (Path+ReplaceUnsupportedSymbols(MsgUID)+'.eml') then
 begin
  try
  Msg.LoadFromFile(Path+ReplaceUnsupportedSymbols(MsgUID)+'.eml');
  Result:=True;
  except
  //не могу прочесть из кеша
  end;
 end;
end;

Procedure FlushMailCache (MailBoxID:String=''); //очищаем кеш выбранного ящика, либо всех ящиков
var
Path:String;
sr:TSearchRec;
Begin
 try
 if MailBoxId<>'' then
 begin
  Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
  if FindFirst(Path+'*.eml', faAnyFile, sr) <> 0 then SysUtils.FindClose (sr) //no eml files found
  else //eml files
   begin
   FindFirst(Path+'*.eml', faAnyFile, sr);
   DeleteFile (Path+Sr.Name);
   while FindNext (sr)=0 do
    begin
    DeleteFile (Path+Sr.Name);
    end;
    SysUtils.FindClose (sr);
   end;
  end else
  begin //очистка кеша как-то по особенному (пока не предусмотрено)

  end;
 except
 MessageBox (FindTCWindow,'Exception in FlushMailCache procedure. This really couldn''t happen in any way.','Error',mb_ok+mb_iconerror);
 end;
end;

Procedure FlushMailHdrCache (MailBoxID:String='');
var
Path:String;
sr:TSearchRec;
Begin
 try
 if MailBoxId<>'' then
 begin
  Path:=ExtractFilepath(GetPluginDir)+'cache\'+ReplaceUnsupportedSymbols (MailBoxID)+'\';
  if FindFirst(Path+'*.hdr', faAnyFile, sr) <> 0 then SysUtils.FindClose (sr) //no hdr files found
  else //hdr files
   begin
   FindFirst(Path+'*.hdr', faAnyFile, sr);
   DeleteFile (Path+Sr.Name);
   while FindNext (sr)=0 do
    begin
    DeleteFile (Path+Sr.Name);
    end;
    SysUtils.FindClose (sr);
   end;
  end else
  begin //очистка кеша как-то по особенному (пока не предусмотрено)

  end;
 except
 MessageBox (FindTCWindow,'Exception in FlushMailHdrCache procedure. This really couldn''t happen in any way.','Error',mb_ok+mb_iconerror);
 end;
end;

//----------------------------------------------------------------------------//
procedure LoadLanguage (LangFile: shortstring);

 procedure ReadlnEx (var f:textfile;var s:string);
 Begin
 if EOF (f) then
  begin
  s:='-1=Missed string';
  exit;
  end;
 readln (f,s);
 if (Length(s)<1) or (s[1]=';') then readlnEx (f,s);
 end;

var
f:textfile;
s:string;
z:string;
i:integer;
Begin

if not FileExists (LangFile) then exit;
AssignFile (f,LangFile);
reset (f);
while (not eof(f)) do
 begin
 readlnex(f,s);
 try
 i:=strtoint (copy(s,1,pos ('=',s)-1));
 z:=copy (s,pos ('=',s)+1,length (s));
  case i of
   1: LNG_MailList:=z;
   2: LNG_MailRec:=z;
   3: LNG_POP3:=z;
   4: LNG_User:=z;
   5: LNG_password:=z;
   6: LNG_PassAttention:=z;
   7: LNG_mailSend:=z;
   8: LNG_SMTP:=z;
   9: LNG_From:=z;
   10: LNG_FromName:=z;
   11: LNG_Email:=z;
   12: LNG_Org:=z;
   13: LNG_Add:=z;
   14: LNG_Del:=z;
   15: LNG_Apply:=z;
   16: LNG_OK:=z;
   17: LNG_Cancel:=z;
   18: LNG_PassRequest:=z;
   19: LNG_PassReqMsg:=z;
   20: LNG_Password2:=z;
   21: LNG_SavePvd:=z;
   22: LNG_TryReceive:=z;
   23: LNG_ConnectErr:=z;
   24: LNG_RecSize:=z;
   25: LNG_RecHeaders:=z;
   26: LNG_LettersCount:=z;
   27: LNG_RecAllHeaders:=z;
   28: LNG_Disconnect:=z;
   29: LNG_RecLetter:=z;
   30: LNG_DelLetter:=z;
   31: LNG_DelLetterSucc:=z;
   32: LNG_CantDelLetter:=z;
   33: LNG_AddMailBox:=z;
   34: LNG_NewMailBoxName:=z;
   35: LNG_RenMailBox:=z;
   36: LNG_RenMailBoxName:=z;
   37: LNG_MailOpts:=z;
   38: LNG_PlugOpts:=z;
   39: LNG_OptsLang:=z;
   40: LNG_CopyMailBox:=z;
   41: LNG_CopyMailBoxname:=z;
   42: LNG_DeleteMailBox:=z;
   43: LNG_HeadersDownloadingAbort:=z;
   44: LNG_OnAltEnter:=z;
   45: LNG_OnEnter:=z;
   46: LNG_ViewerOptions:=z;
   47: LNG_TabsPos:=z;
   48: LNG_AttachView:=z;
   49: LNG_AttachSaveDir:=z;
   50: LNG_Select:=z;
   51: LNG_DoOnPressSel0:=z;
   52: LNG_DoOnPressSel1:=z;
   53: LNG_DoOnPressSel2:=z;
   54: LNG_TabPosSel0:=z;
   55: LNG_TabPosSel1:=z;
   56: LNG_TabPosSel2:=z;
   57: LNG_TabPosSel3:=z;
   58: LNG_SeeAttachSel0:=z;
   59: LNG_SeeAttachSel1:=z;
   60: LNG_SeeAttachSel2:=z;
   61: LNG_ViewerView:=z;
   62: LNG_ViewerCreate:=z;
   63: LNG_ViewerFrom:=z;
   64: LNG_ViewerTo:=z;
   65: LNG_ViewerSubject:=z;
   66: LNG_Save:=z;
   67: LNG_SaveAll:=z;
   68: LNG_SaveTo:=z;
   69: LNG_SaveAllTo:=z;
   70: LNG_SaveAttachments:=z;
   71: LNG_SelAttachSaveDir:=z;
   72: LNG_CacheMessages:=z;
   73: LNG_UnsavedChanges:=z;
   74: LNG_ToolBTNOpen:=z;
   75: LNG_ToolBTNSave:=z;
   76: LNG_ToolBTNSendEditor:=z;
   77: LNG_ToolBtnStayOnTop:=z;
   78: LNG_ToolBtnSend:=z;
   79: LNG_ToolBTNOpenAnswer:=z;
   80: LNG_ToolBTNAttach:=z;
   81: LNG_ToolBTNSender:=z;
   82: LNG_ToolBTNPriority:=z;
   83: LNG_Highest:=z;
   84: LNG_High:=z;
   85: LNG_Normal:=z;
   86: LNG_Low:=z;
   87: LNG_Lowest:=z;
   88: LNG_CC:=z;
   89: LNG_Default:=z;
   90: LNG_Delete:=z;
   91: LNG_DeleteAll:=z;
   92: LNG_UseDefault:=z;
   93: LNG_ConnectionOpts:=z;
   94: LNG_Timeout:=z;
   95: LNG_ErrorConnection:=z;
   96: LNG_ErrorHostSpecified:=z;
   97: LNG_ErrorUnknown:=z;
   98: LNG_MessageSendind:=z;
   99: LNG_MessageSendingProgress:=z;
  100: LNG_SMTPAuth:=z;
  101: LNG_SMTPAuthDisabled:=z;
  102: LNG_SMTPAuthPOPFirst:=z;
  103: LNG_SMTPAuthAsPOP:=z;
  104: LNG_SMTPAuthSelf:=z;
  105: LNG_Connection:=z;
  106: LNG_UseTLS:=z;
  107: LNG_About:=z;
  108: LNG_CloseAfterSending:=z;
  109: LNG_BBOptions:=z;
  110: LNG_BBGradient:=z;
  111: LNG_BBFrom:=z;
  112: LNG_BBTo:=z;
  113: LNG_BBVerticalGradient:=z;
  114: LNG_BBFlatButtons:=z;
  115: LNG_BBCaptions:=z;
  116: LNG_BBIcons:=z;
  117: LNG_BBonlyIcons:=z;
  118: LNG_BBOnlyText:=z;
  119: LNG_BBTextRight:=z;
  120: LNG_BBTextBelow:=z;
  121: LNG_POP3Auth:=z;
  122: LNG_EditorAlwaysOnTop:=z;
  123: LNG_EditorShowHeaders:=z;
  124: LNG_AddAttach:=z;
  125: LNG_SaveMessage:=z;
  126: LNG_OpenMessage:=z;
  127: LNG_Close:=z;
  128: LNG_CloseProgressAfterSending:=z;
  129: LNG_Connecting:=z;
  130: LNG_RememberEDSizePos:=z;
  131: LNG_ClearHeadersCache:=z;
  132: LNG_SelectBlat:=z;
  133: LNG_SendProperties:=z;
  134: LNG_BlatPath:=z;
  135: LNG_BlatAdditionalParams:=z;
  136: LNG_UseBlat:=z;
  137: LNG_OnFilesCopying:=z;
  138: LNG_EmlFiles:=z;
  139: LNG_OtherFile:=z;
  140: LNG_FilesDoNothing:=z;
  141: LNG_EmlFilesDo1:=z;
  142: LNG_EmlFilesDo2:=z;
  143: LNG_EmlFilesDo3:=z;
  144: LNG_OtherFilesDo1:=z;
  145: LNG_OtherFilesDo2:=z;
  146: LNG_SMTPNotSpecified:=z;
  147: LNG_AddAddrBookRecord:=z;
  148: LNG_NewAddrBookRecord:=z;
  149: LNG_RenAddrBookRecord:=z;
  150: LNG_AddrBookOptions:=z;
  151: LNG_AutoSaveEnteredAddress:=z;
  152: LNG_OpenAddressBook:=z;
  153: LNG_Contacts:=z;
  154: LNG_ContactInfo:=z;
  155: LNG_ApplyContact:=z;
  156: LNG_AddContact:=z;
  157: LNG_DeleteContact:=z;
  158: LNG_RenameContact:=z;
  159: LNG_ShowContactList:=z;
  160: LNG_StoreContact:=z;
  end;
 except
 end;
 end;
 closefile (f);
end;

Function LoadSettings:TPluginOptions;
Begin
CreateOptionsFile;
Result.LNGFile :=Options.ReadString('Main','LangFile','');
Result.DoOnAltEnter :=Options.ReadInteger('Main','DoOnAltEnter',1);
if Result.DoOnAltEnter>1 then Result.DoOnAltEnter:=1;
Result.DoOnEnter :=Options.ReadInteger('Main','DoOnEnter',0);
if Result.DoOnEnter>2 then Result.DoOnEnter:=0;
Result.CacheMessages :=Options.ReadBool('Main','CacheMessages',true);
Result.ClearCachedHeaders :=Options.ReadBool('Main','ClearCachedHeaders',true);
Result.AttachSaveDir :=Options.ReadString('Viewer','AttachSaveDir',GetPluginDir);
if not DirectoryExists (ReplaceCMDRVars(Result.AttachSaveDir)) then Result.AttachSaveDir:=GetPluginDir;
Result.UseBlat :=Options.ReadBool('Main','UseBlat',False);
Result.BlatPath :=Options.ReadString('Main','BlatPath','');
if not FileExists (ReplaceCMDRVars(Result.BlatPath)) then Result.BlatPath :='';
Result.BlatParams :=Options.ReadString('Main','BlatParams','');

Result.OnEmlCopy :=Options.ReadInteger('Main','OnEmlCopy',0);
if Result.OnEmlCopy >3 then Result.OnEmlCopy :=0;

Result.OnOtherFileCopy:=Options.ReadInteger('Main','OnFileCopy',0);
if Result.OnOtherFileCopy >2 then Result.OnOtherFileCopy :=0;

Result.ViewerTabPos :=Options.ReadInteger('Viewer','TabPos',0);
if Result.ViewerTabPos>3 then Result.ViewerTabPos:=0;
Result.AttachViewMode :=Options.ReadInteger('Viewer','AttachViewMode',2);
if Result.AttachViewMode>2 then Result.AttachViewMode:=0;
Result.ConnectionTimeout :=Options.ReadInteger('Connection','Timeout',30);
if result.ConnectionTimeout <1 then Result.ConnectionTimeout :=1;
Result.EditorCloseAfterSending :=Options.ReadBool('Viewer','CloseAfterSending',false);
Result.EditorCloseProgressAfterSending :=Options.ReadBool('Viewer','CloseProgressAfterSending',true);
Result.EditorGradientButton :=Options.ReadBool('Viewer','GradientButtons',false);
Result.EditorGradientVertical :=Options.ReadBool('Viewer','VerticalGradient',true);
Result.EditorGradientStart :=Options.ReadString('Viewer','GradientStart','$00F5EFD3');
Result.EditorGradientEnd := Options.ReadString('Viewer','GradientEnd','$00F5EFD3');
Result.EditorIconSize :=Options.ReadInteger('Viewer','IconSize',0);
if Result.EditorIconSize >2 then Result.EditorIconSize :=2;
Result.EditorCaptionsMode :=Options.ReadInteger('Viewer','ButtonCaptions',0);
if Result.EditorCaptionsMode >3 then Result.EditorCaptionsMode :=3;
Result.EditorFlatButtons := Options.ReadBool('Viewer','FlatButtons',True);
Result.EditorAlwaysOnTop :=Options.ReadBool('Viewer','AlwaysOnTop',False);
Result.EditorShowRFCHeaders := Options.ReadBool('Viewer','ShowHeaders',false);
Result.EditorSavePos := Options.ReadBool('Viewer','SaveSize',false);
Result.EditorSPLeft :=Options.ReadInteger('Viewer','EditorLeft',0);
Result.EditorSPTop :=Options.ReadInteger('Viewer','EditorTop',0);
Result.EditorSPWidth :=Options.ReadInteger('Viewer','EditorWidth',0);
Result.EditorSPHeight :=Options.ReadInteger('Viewer','EditorHeight',0);
Options.Free;
end;

Procedure SaveSettings (Opts:TPluginOptions);
Begin
CreateOptionsFile;
Options.WriteString('Main','LangFile',Opts.LNGFile);
Options.WriteInteger('Main','DoOnAltEnter',Opts.DoOnAltEnter);
Options.WriteInteger('Main','DoOnEnter',Opts.DoOnEnter);
Options.WriteBool('Main','CacheMessages',Opts.CacheMessages);
Options.WriteBool('Main','ClearCachedHeaders',Opts.ClearCachedHeaders);
Options.WriteBool('Main','UseBlat',Opts.UseBlat);
Options.WriteString('Main','BlatPath',Opts.BlatPath);
Options.WriteString('Main','BlatParams',Opts.BlatParams);
Options.WriteInteger('Main','OnEmlCopy',Opts.OnEmlCopy);
Options.WriteInteger('Main','OnFileCopy',Opts.OnOtherFileCopy);
Options.WriteInteger('Connection','Timeout',Opts.ConnectionTimeout);
Options.WriteString('Viewer','AttachSaveDir',Opts.AttachSaveDir);
Options.WriteInteger('Viewer','TabPos',Opts.ViewerTabPos);
Options.WriteInteger('Viewer','AttachViewMode',Opts.AttachViewMode);
Options.WriteBool('Viewer','CloseAfterSending',Opts.EditorCloseAfterSending);
Options.WriteBool('Viewer','CloseProgressAfterSending',Opts.EditorCloseProgressAfterSending);
Options.WriteBool('Viewer','GradientButtons',Opts.EditorGradientButton);
Options.WriteBool('Viewer','VerticalGradient',Opts.EditorGradientVertical);
Options.WriteString('Viewer','GradientStart',Opts.EditorGradientStart);
Options.WriteString('Viewer','GradientEnd',Opts.EditorGradientEnd);
Options.WriteInteger('Viewer','IconSize',Opts.EditorIconSize);
Options.WriteInteger('Viewer','ButtonCaptions',Opts.EditorCaptionsMode);
Options.WriteBool('Viewer','FlatButtons',Opts.EditorFlatButtons);
Options.WriteBool('Viewer','AlwaysOnTop',Opts.EditorAlwaysOnTop);
Options.WriteBool('Viewer','ShowHeaders',Opts.EditorShowRFCHeaders);
Options.WriteBool('Viewer','SaveSize',Opts.EditorSavePos);
Options.Free;
end;

Procedure SaveEWindowPos (L,T,W,H:Integer);
Begin
CreateOptionsFile;
Options.WriteInteger('Viewer','EditorLeft',L);
Options.WriteInteger('Viewer','EditorTop',T);
Options.WriteInteger('Viewer','EditorWidth',W);
Options.WriteInteger('Viewer','EditorHeight',H);
Options.Free;
end;

Procedure ReadContactList (var S:TStrings);
var
MainAdrBook:TIniFile;
Begin
MainAdrBook:=TIniFIle.Create(GetPluginDir+'AddrBook.ini');
MainAdrBook.ReadSections(S);
MainAdrBook.Free;
end;

Function AddAdrBookRecord (Email,Descr:String):Boolean;
var
MainAdrBook:TIniFile;
Begin
Result:=true;
MainAdrBook:=TIniFIle.Create(GetPluginDir+'AddrBook.ini');
Descr:=AnsiReplaceStr (Descr,#$D#$A,'|');
if Descr<>'' then MainAdrBook.WriteString(Email,'INFO',Descr);
MainAdrBook.Free;
end;

Function ReadRecordInfo (Email:String):String;
var
MainAdrBook:TIniFile;
Begin
MainAdrBook:=TIniFIle.Create(GetPluginDir+'AddrBook.ini');
Result:=MainAdrBook.ReadString (Email,'INFO','');
Result:=AnsiReplaceStr (Result,'|',#$D#$A);
MainAdrBook.Free;
end;

//----------------Функции для всякой мелкой рутины----------------------------//

Function DeletePathUnnedeedDelimeters (Path:String;Mode:Integer=0):String;
Begin
Result:=Path;
 case Mode of
  0: Delete(Result,1,1);
  1: Begin
     Delete (Result,1,1);
     Delete (Result,Length(Result),1);
     end;
  2: begin
     Delete (Result,1,1);
     Result:=Copy(Result,1,pos('\',result)-1);
     end;
 end;
end;

Procedure RetrieveMessage (MailBoxName:String;MsgNum:Integer;CachedMsgUID:String;var POP3:MyPop3; var ToMSG:TIdMessage; IgnoreCaching:Boolean=False); //пытаемся прочесть собщение из кеша, если не получается - обращаемся напрямую
Begin
if (LoadSettings.CacheMessages) and (Not IgnoreCaching) then
 begin
 if not ReadMailFromCache (MailBoxName,CachedMsgUID,ToMSG) then
  begin
  try
  POP3.Retrieve(MsgNum,ToMSG);
  CacheMailMessage (MailBoxName,{ToMSG.MsgId}IntToStr(MsgNum) ,ToMSG);
  except

  end;
  end;
 end else //messages caching disabled
 begin
 POP3.Retrieve(MsgNum,ToMSG);
end;
end;

Procedure RetrieveGoogleMessage (MailBoxName:String;MsgNum:Integer;CachedMsgUID:String; var ToMSG:TIdMessage; IgnoreCaching:Boolean=False); //пытаемся прочесть собщение из кеша, если не получается - обращаемся напрямую
Begin
if (LoadSettings.CacheMessages) and (Not IgnoreCaching) then
 begin
 if not ReadMailFromCache (MailBoxName,CachedMsgUID,ToMSG) then
  begin
  POP3.Retrieve(MsgNum,ToMSG);
  CacheMailMessage (MailBoxName,{ToMSG.MsgId}IntToStr(MsgNum) ,ToMSG);
  end;
 end else //messages caching disabled
 begin
 POP3.Retrieve(MsgNum,ToMSG);
end;
end;

Procedure CopyMessage ({MsgNum:Integer;} MailBoxName:String; const FromMSG:TIdMessage;var ToMSG: TIdMessage); //осуществляет копирование сообщения (через кеш либо темповый файл)
Begin //на будущее: может быть переделать копирование через файл копированием через память (TStream) - будет быстрее
if (not LoadSettings.CacheMessages) or (not ReadMailFromCache (MailBoxName,FromMSG.MsgId,ToMSG)) then
 begin //не получилось считать из буфера, копируем через темп
 FromMSG.SaveToFile(GetPluginDir+'mail_tmp');
 ToMSG.LoadFromFile(GetPluginDir+'mail_tmp',False);
 DeleteFile (pchar(GetPluginDir+'mail_tmp'));
 end;
end;

Procedure CopyMessageViaBuf (const FromMSG:TIdMessage;var ToMSG: TIdMessage); //осуществляет копирование сообщения (через темповый файл)
begin //не получилось считать из буфера, копируем через темп
FromMSG.SaveToFile(GetPluginDir+'mail_tmp');
ToMSG.LoadFromFile(GetPluginDir+'mail_tmp',False);
DeleteFile (pchar(GetPluginDir+'mail_tmp'));
end;

Procedure PrepareFindData (var FindData:tWIN32FINDDATA; Name:String; dir:Boolean=true; SizeLow:Dword=0;Time:TDateTime=0);
var
f:TFileTime;
Begin
strpcopy (FindData.cFileName,pchar(name));
if Dir then
 begin
 FindData.dwFileAttributes :=16;
 FindData.ftCreationTime :=DateTime2FileTime(Now);
 FindData.ftLastAccessTime :=DateTime2FileTime(Now);
 FindData.ftLastWriteTime :=DateTime2FileTime(Now);
 finddata.nFileSizeHigh :=0;
 finddata.nFileSizeLow :=0;
 end else
 begin
 FindData.dwFileAttributes:=0;
 LocalFileTimeToFileTime (DateTime2FileTime(Time),FindData.ftCreationTime);
 FindData.ftLastAccessTime :=FindData.ftCreationTime;
 FindData.ftLastWriteTime := FindData.ftCreationTime;
// FindData.ftLastWriteTime :=DateTime2FileTime(Time);
 FindData.nFileSizeHigh :=0;
 FindData.nFileSizeLow :=SizeLow;
 end;
end;

Procedure ClearDir (Dir:String);
var
sr:TSearchRec;
Begin
if not DirectoryExists (Dir) then exit;
 try
 if FindFirst(dir+'*.*', faAnyFile, sr) <> 0 then SysUtils.FindClose (sr) //no files found
 else //files founded
 begin
 FindFirst(Dir+'*.*', faAnyFile, sr);
 //проверить как будет удалять папку
 DeleteFile (Dir+Sr.Name);
 while FindNext (sr)=0 do
  begin
  DeleteFile (Dir+Sr.Name);
  end;
  SysUtils.FindClose (sr);
 end;
 except
 MessageBox (FindTCWindow,'Exception in ClearDir procedure. This really couldn''t happen in any way.','Error',mb_ok+mb_iconerror);
 end;
end;

{ MyPOP3 }

procedure MyPOP3.OnWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Integer);
begin

end;

end.
