unit addr_book;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, ToolWin, IniFiles, Strutils,
  PLUGIN_MAIN, ImgList, Menus,GraphUtil;

type
  TADDRBOOK = class(TForm)
    GBAdrList: TGroupBox;
    LVEmail: TListView;
    CBAdditInfo: TGroupBox;
    MAddInfo: TMemo;
    Splitter1: TSplitter;
    TBAddrBook: TToolBar;
    TBAdd: TToolButton;
    TBtDel: TToolButton;
    TBApply: TToolButton;
    TBClose: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    TBRename: TToolButton;
    MenuImages48: TImageList;
    MenuImages32: TImageList;
    MenuImages24: TImageList;
    MainMenu1: TMainMenu;
    Esc: TMenuItem;
    CtrlEnter1: TMenuItem;
    procedure CtrlEnter1Click(Sender: TObject);
    procedure EscClick(Sender: TObject);
    procedure LVEmailEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure LVEmailClick(Sender: TObject);
    procedure MAddInfoChange(Sender: TObject);
    procedure TBApplyClick(Sender: TObject);
    procedure LVEmailDblClick(Sender: TObject);
    procedure TBCloseClick(Sender: TObject);
    procedure TBRenameClick(Sender: TObject);
    procedure TBtDelClick(Sender: TObject);
    procedure TBAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AllowDblClickResult:Boolean;

    RecResult:TStringlist;

    Procedure RefreshAdrBookList;
    Function DelAdrBookRecord (Email:String):Boolean;


    Procedure SetRecResult;
    Procedure ReadLng;
    Procedure ProcessSettings;

  end;

var
  ADDRBOOK: TADDRBOOK;
  MainAdrBook: TIniFile;

implementation

{$R *.dfm}

uses
  text_dialog;

{ TADDRBOOK }

procedure TADDRBOOK.ReadLng;
begin
GBAdrList.Caption:=LNG_Contacts;
CBAdditInfo.Caption :=LNG_ContactInfo;
TBApply.Caption :=LNG_ApplyContact;
TBAdd.Caption:=LNG_AddContact;
TBtDel.Caption := LNG_DeleteContact;
TBRename.Caption :=LNG_RenameContact;
TBClose.Caption :=LNG_Close;
TBApply.Hint :=LNG_ApplyContact;
TBAdd.Hint:=LNG_AddContact;
TBtDel.Hint := LNG_DeleteContact;
TBRename.Hint :=LNG_RenameContact;
TBClose.Hint :=LNG_Close;
end;

procedure TADDRBOOK.RefreshAdrBookList;
var
S:TStrings;
i:integer;
begin
S:=TStringList.Create;
ReadContactList (S);
LVEmail.Clear;
for I := 0 to S.Count - 1 do
 begin
 LVEmail.Items.Add.Caption :=S[i]; 
 end;
S.Free;
end;

procedure TADDRBOOK.SetRecResult;
begin

end;

procedure TADDRBOOK.TBAddClick(Sender: TObject);
var
MailName:String;
begin
if TTEXT_DIALOG_FORM.ShowDialog(LNG_AddAddrBookRecord,LNG_NewAddrBookRecord,'',MailName) then
 begin
 AddAdrBookRecord (MailName,'');
 RefreshAdrBookList;
 end;
end;

procedure TADDRBOOK.TBApplyClick(Sender: TObject);
var
I:Integer;
begin
RecResult:=TStringList.Create;
for i := 0 to LVEmail.Items.Count - 1 do
 if LVEmail.Items [i].Checked then RecResult.Add(LVEmail.Items [i].Caption);
Close;
end;

procedure TADDRBOOK.TBCloseClick(Sender: TObject);
begin
Close;
end;

procedure TADDRBOOK.TBRenameClick(Sender: TObject);
var
i:Integer;
MailName:String;
Temp:String;
S:TStringList;
begin
S:=TStringList.Create;
for i := 0 to LVEmail.Items.Count - 1 do
 if LVEmail.Items [i].Checked then S.Add(LVEmail.Items [i].Caption);
if S.Count =0 then
 begin
 TTEXT_DIALOG_FORM.ShowDialog(LNG_RenAddrBookRecord,LNG_NewAddrBookRecord,LVEmail.ItemFocused.Caption,MailName);
 Temp:=ReadRecordInfo (LVEmail.ItemFocused.Caption);
 DelAdrBookRecord (LVEmail.ItemFocused.Caption);
 AddAdrBookRecord (MailName,Temp);
 end else
 begin
 for I:= 0 to S.Count - 1 do
  begin
  if TTEXT_DIALOG_FORM.ShowDialog(LNG_RenAddrBookRecord,LNG_NewAddrBookRecord,S[i],MailName) then
   begin
   Temp:=ReadRecordInfo (S[i]);
   DelAdrBookRecord (S[i]);
   AddAdrBookRecord (MailName,Temp);
   end;
  end;
 end;
S.Free;
RefreshAdrBookList;
end;

procedure TADDRBOOK.TBtDelClick(Sender: TObject);
var
i:Integer;
S:TStringList;
begin
S:=TStringList.Create;
for i := 0 to LVEmail.Items.Count - 1 do
 if LVEmail.Items [i].Checked then S.Add(LVEmail.Items [i].Caption);
if S.Count =0 then DelAdrBookRecord(LVEmail.ItemFocused.Caption) else
 begin
 for I:= 0 to S.Count - 1 do  DelAdrBookRecord (s[i]);
 end;
S.Free;
RefreshAdrBookList;
end;



procedure TADDRBOOK.CtrlEnter1Click(Sender: TObject);
begin
TBApply.Click;
end;

function TADDRBOOK.DelAdrBookRecord(Email:String): Boolean;
begin
Result:=true;
MainAdrBook:=TIniFIle.Create(GetPluginDir+'AddrBook.ini');
MainAdrBook.EraseSection(Email);
MainAdrBook.Free;
end;



procedure TADDRBOOK.EscClick(Sender: TObject);
begin
Close;
end;

procedure TADDRBOOK.FormShow(Sender: TObject);
begin
ReadLng;
RefreshAdrBookList;
ProcessSettings;
end;

procedure TADDRBOOK.LVEmailClick(Sender: TObject);
begin
if LVEmail.ItemIndex <0 then MAddInfo.Enabled :=False else
 begin
 MAddInfo.Enabled :=True;
 MaddInfo.Text :=ReadRecordInfo (LVEmail.ItemFocused.Caption);
 end;
end;

procedure TADDRBOOK.LVEmailDblClick(Sender: TObject);
var
i:integer;
begin
if LVEmail.ItemIndex <0 then exit;
if not AllowDblClickResult then exit;
RecResult:=TStringlist.Create;
for i := 0 to LVEmail.Items.Count - 1 do
 if LVEmail.Items [i].Checked then RecResult.Add(LVEmail.Items [i].Caption);
if RecResult.Count =0 then RecResult.Add(LVEmail.ItemFocused.Caption);
Close; 
end;

procedure TADDRBOOK.LVEmailEdited(Sender: TObject; Item: TListItem;
  var S: string);
var
Temp:String;
begin
Temp:=ReadRecordInfo (Item.Caption);
DelAdrBookRecord (Item.Caption);
AddAdrBookRecord (S,Temp);
end;

procedure TADDRBOOK.MAddInfoChange(Sender: TObject);
begin
if LVEmail.ItemIndex <0 then exit;
AddAdrBookRecord (LVEmail.ItemFocused.Caption,MAddInfo.Text);
end;

procedure TADDRBOOK.ProcessSettings;
begin
if LoadSettings.EditorGradientButton  then
 begin
 TBAddrBook.DrawingStyle :=TTBDrawingStyle(dsGradient);
 TBAddrBook.GradientDrawingOptions:=[gdoGradient];
 TBAddrBook.GradientStartColor :=StringtoColor (LoadSettings.EditorGradientStart);
 TBAddrBook.GradientEndColor :=StringtoColor (LoadSettings.EditorGradientEnd);
 if LoadSettings.EditorGradientVertical then
  begin
  TBAddrBook.GradientDirection:=gdVertical;
  end else
  begin
  TBAddrBook.GradientDirection:=gdHorizontal;
  end;
 end else
 begin
 TBAddrBook.DrawingStyle :=TTBDrawingStyle(dsNormal);
 end;
case LoadSettings.EditorIconSize of
 0: begin
    TBAddrBook.Images :=MenuImages24;
    end;
 1: begin
    TBAddrBook.Images :=MenuImages32;
    end;
 2: begin
    TBAddrBook.Images :=MenuImages48;
    end;
end;
case LoadSettings.EditorCaptionsMode of
 0: begin
    //only icons
    TBAddrBook.ShowCaptions :=False;
    end;
 1: begin
    //only text
    TBAddrBook.ShowCaptions :=True;
    TBAddrBook.Images :=nil;
    end;
 2: begin
    //text on left
    TBAddrBook.ShowCaptions :=True;
    TBAddrBook.List :=true;
    end;
 3: begin
    //text on bottom
    TBAddrBook.ShowCaptions :=True;
    TBAddrBook.List :=false;
    end;
end;
TBAddrBook.Flat := LoadSettings.EditorFlatButtons;

end;

end.
