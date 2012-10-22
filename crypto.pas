unit crypto;

interface

Uses
DCPcrypt2, DCPblockciphers, DCPtwofish, DCPrc5, DCPsha512;

Function Encrypt (EnString,Pass:String):String;
Function Decrypt (DeString,Pass:String):String;

implementation

Function Encrypt (EnString,Pass:String):String;
var
i: integer;
Cipher: TDCP_rc5;
begin
Cipher:= TDCP_rc5.Create(nil);
Cipher.InitStr(Pass,TDCP_sha512);
result:=Cipher.EncryptString (EnString);
Cipher.Burn;
Cipher.Free;
end;

Function Decrypt (DeString,Pass:String):String;
var
i: integer;
Cipher: TDCP_rc5;
begin
Cipher:= TDCP_rc5.Create(nil);
Cipher.InitStr(Pass,TDCP_sha512);
result:=Cipher.DecryptString (DeString);
Cipher.Burn;
Cipher.Free;
end;

end.
