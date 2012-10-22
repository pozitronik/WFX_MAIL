unit SubjWork;

interface

Uses
SysUtils,
IdCoderHeader;

const
  base64_tbl: array [0..63] of Char = (
    'A','B','C','D','E','F','G','H',      {Do not Localize}
    'I','J','K','L','M','N','O','P',      {Do not Localize}
    'Q','R','S','T','U','V','W','X',      {Do not Localize}
    'Y','Z','a','b','c','d','e','f',      {Do not Localize}
    'g','h','i','j','k','l','m','n',      {Do not Localize}
    'o','p','q','r','s','t','u','v',      {Do not Localize}
    'w','x','y','z','0','1','2','3',      {Do not Localize}
    '4','5','6','7','8','9','+','/');     {Do not Localize}


function DecodeHeader(Header: String; IgnoreCharset:Boolean=True): String;

implementation

function UTF16_RToKOI8Char(const P: WideChar):Char;
begin
 case ord(P) of
  $2500 : result:= #$80;  // BOX DRAWINGS LIGHT HORIZONTAL
  $2502 : result:= #$81;  // BOX DRAWINGS LIGHT VERTICAL
  $250c : result:= #$82;  // BOX DRAWINGS LIGHT DOWN AND RIGHT
  $2510 : result:= #$83;  // BOX DRAWINGS LIGHT DOWN AND LEFT
  $2514 : result:= #$84;  // BOX DRAWINGS LIGHT UP AND RIGHT
  $2518 : result:= #$85;  // BOX DRAWINGS LIGHT UP AND LEFT
  $251c : result:= #$86;  // BOX DRAWINGS LIGHT VERTICAL AND RIGHT
  $2524 : result:= #$87;  // BOX DRAWINGS LIGHT VERTICAL AND LEFT
  $252c : result:= #$88;  // BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
  $2534 : result:= #$89;  // BOX DRAWINGS LIGHT UP AND HORIZONTAL
  $253c : result:= #$8a;  // BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
  $2580 : result:= #$8b;  // UPPER HALF BLOCK
  $2584 : result:= #$8c;  // LOWER HALF BLOCK
  $2588 : result:= #$8d;  // FULL BLOCK
  $258c : result:= #$8e;  // LEFT HALF BLOCK
  $2590 : result:= #$8f;  // RIGHT HALF BLOCK
  $2591 : result:= #$90;  // LIGHT SHADE
  $2592 : result:= #$91;  // MEDIUM SHADE
  $2593 : result:= #$92;  // DARK SHADE
  $2320 : result:= #$93;  // TOP HALF INTEGRAL
  $25a0 : result:= #$94;  // BLACK SQUARE
  $2219 : result:= #$95;  // BULLET OPERATOR
  $221a : result:= #$96;  // SQUARE ROOT
  $2248 : result:= #$97;  // ALMOST EQUAL TO
  $2264 : result:= #$98;  // LESS-THAN OR EQUAL TO
  $2265 : result:= #$99;  // GREATER-THAN OR EQUAL TO
  $00a0 : result:= #$9a;  // NO-BREAK SPACE
  $2321 : result:= #$9b;  // BOTTOM HALF INTEGRAL
  $00b0 : result:= #$9c;  // DEGREE SIGN
  $00b2 : result:= #$9d;  // SUPERSCRIPT TWO
  $00b7 : result:= #$9e;  // MIDDLE DOT
  $00f7 : result:= #$9f;  // DIVISION SIGN
  $2550 : result:= #$a0;  // BOX DRAWINGS DOUBLE HORIZONTAL
  $2551 : result:= #$a1;  // BOX DRAWINGS DOUBLE VERTICAL
  $2552 : result:= #$a2;  // BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
  $0451 : result:= #$a3;  // CYRILLIC SMALL LETTER IO
  $2553 : result:= #$a4;  // BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
  $2554 : result:= #$a5;  // BOX DRAWINGS DOUBLE DOWN AND RIGHT
  $2555 : result:= #$a6;  // BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
  $2556 : result:= #$a7;  // BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
  $2557 : result:= #$a8;  // BOX DRAWINGS DOUBLE DOWN AND LEFT
  $2558 : result:= #$a9;  // BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
  $2559 : result:= #$aa;  // BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
  $255a : result:= #$ab;  // BOX DRAWINGS DOUBLE UP AND RIGHT
  $255b : result:= #$ac;  // BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
  $255c : result:= #$ad;  // BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
  $255d : result:= #$ae;  // BOX DRAWINGS DOUBLE UP AND LEFT
  $255e : result:= #$af;  // BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
  $255f : result:= #$b0;  // BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
  $2560 : result:= #$b1;  // BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
  $2561 : result:= #$b2;  // BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
  $0401 : result:= #$b3;  // CYRILLIC CAPITAL LETTER IO
  $2562 : result:= #$b4;  // BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
  $2563 : result:= #$b5;  // BOX DRAWINGS DOUBLE VERTICAL AND LEFT
  $2564 : result:= #$b6;  // BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
  $2565 : result:= #$b7;  // BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
  $2566 : result:= #$b8;  // BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
  $2567 : result:= #$b9;  // BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
  $2568 : result:= #$ba;  // BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
  $2569 : result:= #$bb;  // BOX DRAWINGS DOUBLE UP AND HORIZONTAL
  $256a : result:= #$bc;  // BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
  $256b : result:= #$bd;  // BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
  $256c : result:= #$be;  // BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
  $00a9 : result:= #$bf;  // COPYRIGHT SIGN
  $044e : result:= #$c0;  // CYRILLIC SMALL LETTER YU
  $0430 : result:= #$c1;  // CYRILLIC SMALL LETTER A
  $0431 : result:= #$c2;  // CYRILLIC SMALL LETTER BE
  $0446 : result:= #$c3;  // CYRILLIC SMALL LETTER TSE
  $0434 : result:= #$c4;  // CYRILLIC SMALL LETTER DE
  $0435 : result:= #$c5;  // CYRILLIC SMALL LETTER IE
  $0444 : result:= #$c6;  // CYRILLIC SMALL LETTER EF
  $0433 : result:= #$c7;  // CYRILLIC SMALL LETTER GHE
  $0445 : result:= #$c8;  // CYRILLIC SMALL LETTER HA
  $0438 : result:= #$c9;  // CYRILLIC SMALL LETTER I
  $0439 : result:= #$ca;  // CYRILLIC SMALL LETTER SHORT I
  $043a : result:= #$cb;  // CYRILLIC SMALL LETTER KA
  $043b : result:= #$cc;  // CYRILLIC SMALL LETTER EL
  $043c : result:= #$cd;  // CYRILLIC SMALL LETTER EM
  $043d : result:= #$ce;  // CYRILLIC SMALL LETTER EN
  $043e : result:= #$cf;  // CYRILLIC SMALL LETTER O
  $043f : result:= #$d0;  // CYRILLIC SMALL LETTER PE
  $044f : result:= #$d1;  // CYRILLIC SMALL LETTER YA
  $0440 : result:= #$d2;  // CYRILLIC SMALL LETTER ER
  $0441 : result:= #$d3;  // CYRILLIC SMALL LETTER ES
  $0442 : result:= #$d4;  // CYRILLIC SMALL LETTER TE
  $0443 : result:= #$d5;  // CYRILLIC SMALL LETTER U
  $0436 : result:= #$d6;  // CYRILLIC SMALL LETTER ZHE
  $0432 : result:= #$d7;  // CYRILLIC SMALL LETTER VE
  $044c : result:= #$d8;  // CYRILLIC SMALL LETTER SOFT SIGN
  $044b : result:= #$d9;  // CYRILLIC SMALL LETTER YERU
  $0437 : result:= #$da;  // CYRILLIC SMALL LETTER ZE
  $0448 : result:= #$db;  // CYRILLIC SMALL LETTER SHA
  $044d : result:= #$dc;  // CYRILLIC SMALL LETTER E
  $0449 : result:= #$dd;  // CYRILLIC SMALL LETTER SHCHA
  $0447 : result:= #$de;  // CYRILLIC SMALL LETTER CHE
  $044a : result:= #$df;  // CYRILLIC SMALL LETTER HARD SIGN
  $042e : result:= #$e0;  // CYRILLIC CAPITAL LETTER YU
  $0410 : result:= #$e1;  // CYRILLIC CAPITAL LETTER A
  $0411 : result:= #$e2;  // CYRILLIC CAPITAL LETTER BE
  $0426 : result:= #$e3;  // CYRILLIC CAPITAL LETTER TSE
  $0414 : result:= #$e4;  // CYRILLIC CAPITAL LETTER DE
  $0415 : result:= #$e5;  // CYRILLIC CAPITAL LETTER IE
  $0424 : result:= #$e6;  // CYRILLIC CAPITAL LETTER EF
  $0413 : result:= #$e7;  // CYRILLIC CAPITAL LETTER GHE
  $0425 : result:= #$e8;  // CYRILLIC CAPITAL LETTER HA
  $0418 : result:= #$e9;  // CYRILLIC CAPITAL LETTER I
  $0419 : result:= #$ea;  // CYRILLIC CAPITAL LETTER SHORT I
  $041a : result:= #$eb;  // CYRILLIC CAPITAL LETTER KA
  $041b : result:= #$ec;  // CYRILLIC CAPITAL LETTER EL
  $041c : result:= #$ed;  // CYRILLIC CAPITAL LETTER EM
  $041d : result:= #$ee;  // CYRILLIC CAPITAL LETTER EN
  $041e : result:= #$ef;  // CYRILLIC CAPITAL LETTER O
  $041f : result:= #$f0;  // CYRILLIC CAPITAL LETTER PE
  $042f : result:= #$f1;  // CYRILLIC CAPITAL LETTER YA
  $0420 : result:= #$f2;  // CYRILLIC CAPITAL LETTER ER
  $0421 : result:= #$f3;  // CYRILLIC CAPITAL LETTER ES
  $0422 : result:= #$f4;  // CYRILLIC CAPITAL LETTER TE
  $0423 : result:= #$f5;  // CYRILLIC CAPITAL LETTER U
  $0416 : result:= #$f6;  // CYRILLIC CAPITAL LETTER ZHE
  $0412 : result:= #$f7;  // CYRILLIC CAPITAL LETTER VE
  $042c : result:= #$f8;  // CYRILLIC CAPITAL LETTER SOFT SIGN
  $042b : result:= #$f9;  // CYRILLIC CAPITAL LETTER YERU
  $0417 : result:= #$fa;  // CYRILLIC CAPITAL LETTER ZE
  $0428 : result:= #$fb;  // CYRILLIC CAPITAL LETTER SHA
  $042d : result:= #$fc;  // CYRILLIC CAPITAL LETTER E
  $0429 : result:= #$fd;  // CYRILLIC CAPITAL LETTER SHCHA
  $0427 : result:= #$fe;  // CYRILLIC CAPITAL LETTER CHE
  $042a : result:= #$ff;  // CYRILLIC CAPITAL LETTER HARD SIGN
 else
  Result:=String (WideString (P)) [1];
 end;
end;

function UTF16_RToKOI8Str(const W: WideString):String;
// Converts an KOI8-R string into an UTF-16 wideString.
// No special conversions (e.g. on line breaks) are done.
var
i,j: integer;
begin
j:= length(W);
setLength(Result,j);
for i:= 1 to j do
 Result[i]:=UTF16_RToKOI8Char(W[i]);
end;

function EncodeKOI8R (const S: String): String;
begin
Result:=UTF16_RToKOI8Str (S);
end;

//----------------------------------------------------------------------------//

function KOI8_RToUTF16Char(const P: Char):WideChar;
begin
 case ord(P) of
  $80: result:= #$2500;  // BOX DRAWINGS LIGHT HORIZONTAL
  $81: result:= #$2502;  // BOX DRAWINGS LIGHT VERTICAL
  $82: result:= #$250c;  // BOX DRAWINGS LIGHT DOWN AND RIGHT
  $83: result:= #$2510;  // BOX DRAWINGS LIGHT DOWN AND LEFT
  $84: result:= #$2514;  // BOX DRAWINGS LIGHT UP AND RIGHT
  $85: result:= #$2518;  // BOX DRAWINGS LIGHT UP AND LEFT
  $86: result:= #$251c;  // BOX DRAWINGS LIGHT VERTICAL AND RIGHT
  $87: result:= #$2524;  // BOX DRAWINGS LIGHT VERTICAL AND LEFT
  $88: result:= #$252c;  // BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
  $89: result:= #$2534;  // BOX DRAWINGS LIGHT UP AND HORIZONTAL
  $8a: result:= #$253c;  // BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
  $8b: result:= #$2580;  // UPPER HALF BLOCK
  $8c: result:= #$2584;  // LOWER HALF BLOCK
  $8d: result:= #$2588;  // FULL BLOCK
  $8e: result:= #$258c;  // LEFT HALF BLOCK
  $8f: result:= #$2590;  // RIGHT HALF BLOCK
  $90: result:= #$2591;  // LIGHT SHADE
  $91: result:= #$2592;  // MEDIUM SHADE
  $92: result:= #$2593;  // DARK SHADE
  $93: result:= #$2320;  // TOP HALF INTEGRAL
  $94: result:= #$25a0;  // BLACK SQUARE
  $95: result:= #$2219;  // BULLET OPERATOR
  $96: result:= #$221a;  // SQUARE ROOT
  $97: result:= #$2248;  // ALMOST EQUAL TO
  $98: result:= #$2264;  // LESS-THAN OR EQUAL TO
  $99: result:= #$2265;  // GREATER-THAN OR EQUAL TO
  $9a: result:= #$00a0;  // NO-BREAK SPACE
  $9b: result:= #$2321;  // BOTTOM HALF INTEGRAL
  $9c: result:= #$00b0;  // DEGREE SIGN
  $9d: result:= #$00b2;  // SUPERSCRIPT TWO
  $9e: result:= #$00b7;  // MIDDLE DOT
  $9f: result:= #$00f7;  // DIVISION SIGN
  $a0: result:= #$2550;  // BOX DRAWINGS DOUBLE HORIZONTAL
  $a1: result:= #$2551;  // BOX DRAWINGS DOUBLE VERTICAL
  $a2: result:= #$2552;  // BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
  $a3: result:= #$0451;  // CYRILLIC SMALL LETTER IO
  $a4: result:= #$2553;  // BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
  $a5: result:= #$2554;  // BOX DRAWINGS DOUBLE DOWN AND RIGHT
  $a6: result:= #$2555;  // BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
  $a7: result:= #$2556;  // BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
  $a8: result:= #$2557;  // BOX DRAWINGS DOUBLE DOWN AND LEFT
  $a9: result:= #$2558;  // BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
  $aa: result:= #$2559;  // BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
  $ab: result:= #$255a;  // BOX DRAWINGS DOUBLE UP AND RIGHT
  $ac: result:= #$255b;  // BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
  $ad: result:= #$255c;  // BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
  $ae: result:= #$255d;  // BOX DRAWINGS DOUBLE UP AND LEFT
  $af: result:= #$255e;  // BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
  $b0: result:= #$255f;  // BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
  $b1: result:= #$2560;  // BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
  $b2: result:= #$2561;  // BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
  $b3: result:= #$0401;  // CYRILLIC CAPITAL LETTER IO
  $b4: result:= #$2562;  // BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
  $b5: result:= #$2563;  // BOX DRAWINGS DOUBLE VERTICAL AND LEFT
  $b6: result:= #$2564;  // BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
  $b7: result:= #$2565;  // BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
  $b8: result:= #$2566;  // BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
  $b9: result:= #$2567;  // BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
  $ba: result:= #$2568;  // BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
  $bb: result:= #$2569;  // BOX DRAWINGS DOUBLE UP AND HORIZONTAL
  $bc: result:= #$256a;  // BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
  $bd: result:= #$256b;  // BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
  $be: result:= #$256c;  // BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
  $bf: result:= #$00a9;  // COPYRIGHT SIGN
  $c0: result:= #$044e;  // CYRILLIC SMALL LETTER YU
  $c1: result:= #$0430;  // CYRILLIC SMALL LETTER A
  $c2: result:= #$0431;  // CYRILLIC SMALL LETTER BE
  $c3: result:= #$0446;  // CYRILLIC SMALL LETTER TSE
  $c4: result:= #$0434;  // CYRILLIC SMALL LETTER DE
  $c5: result:= #$0435;  // CYRILLIC SMALL LETTER IE
  $c6: result:= #$0444;  // CYRILLIC SMALL LETTER EF
  $c7: result:= #$0433;  // CYRILLIC SMALL LETTER GHE
  $c8: result:= #$0445;  // CYRILLIC SMALL LETTER HA
  $c9: result:= #$0438;  // CYRILLIC SMALL LETTER I
  $ca: result:= #$0439;  // CYRILLIC SMALL LETTER SHORT I
  $cb: result:= #$043a;  // CYRILLIC SMALL LETTER KA
  $cc: result:= #$043b;  // CYRILLIC SMALL LETTER EL
  $cd: result:= #$043c;  // CYRILLIC SMALL LETTER EM
  $ce: result:= #$043d;  // CYRILLIC SMALL LETTER EN
  $cf: result:= #$043e;  // CYRILLIC SMALL LETTER O
  $d0: result:= #$043f;  // CYRILLIC SMALL LETTER PE
  $d1: result:= #$044f;  // CYRILLIC SMALL LETTER YA
  $d2: result:= #$0440;  // CYRILLIC SMALL LETTER ER
  $d3: result:= #$0441;  // CYRILLIC SMALL LETTER ES
  $d4: result:= #$0442;  // CYRILLIC SMALL LETTER TE
  $d5: result:= #$0443;  // CYRILLIC SMALL LETTER U
  $d6: result:= #$0436;  // CYRILLIC SMALL LETTER ZHE
  $d7: result:= #$0432;  // CYRILLIC SMALL LETTER VE
  $d8: result:= #$044c;  // CYRILLIC SMALL LETTER SOFT SIGN
  $d9: result:= #$044b;  // CYRILLIC SMALL LETTER YERU
  $da: result:= #$0437;  // CYRILLIC SMALL LETTER ZE
  $db: result:= #$0448;  // CYRILLIC SMALL LETTER SHA
  $dc: result:= #$044d;  // CYRILLIC SMALL LETTER E
  $dd: result:= #$0449;  // CYRILLIC SMALL LETTER SHCHA
  $de: result:= #$0447;  // CYRILLIC SMALL LETTER CHE
  $df: result:= #$044a;  // CYRILLIC SMALL LETTER HARD SIGN
  $e0: result:= #$042e;  // CYRILLIC CAPITAL LETTER YU
  $e1: result:= #$0410;  // CYRILLIC CAPITAL LETTER A
  $e2: result:= #$0411;  // CYRILLIC CAPITAL LETTER BE
  $e3: result:= #$0426;  // CYRILLIC CAPITAL LETTER TSE
  $e4: result:= #$0414;  // CYRILLIC CAPITAL LETTER DE
  $e5: result:= #$0415;  // CYRILLIC CAPITAL LETTER IE
  $e6: result:= #$0424;  // CYRILLIC CAPITAL LETTER EF
  $e7: result:= #$0413;  // CYRILLIC CAPITAL LETTER GHE
  $e8: result:= #$0425;  // CYRILLIC CAPITAL LETTER HA
  $e9: result:= #$0418;  // CYRILLIC CAPITAL LETTER I
  $ea: result:= #$0419;  // CYRILLIC CAPITAL LETTER SHORT I
  $eb: result:= #$041a;  // CYRILLIC CAPITAL LETTER KA
  $ec: result:= #$041b;  // CYRILLIC CAPITAL LETTER EL
  $ed: result:= #$041c;  // CYRILLIC CAPITAL LETTER EM
  $ee: result:= #$041d;  // CYRILLIC CAPITAL LETTER EN
  $ef: result:= #$041e;  // CYRILLIC CAPITAL LETTER O
  $f0: result:= #$041f;  // CYRILLIC CAPITAL LETTER PE
  $f1: result:= #$042f;  // CYRILLIC CAPITAL LETTER YA
  $f2: result:= #$0420;  // CYRILLIC CAPITAL LETTER ER
  $f3: result:= #$0421;  // CYRILLIC CAPITAL LETTER ES
  $f4: result:= #$0422;  // CYRILLIC CAPITAL LETTER TE
  $f5: result:= #$0423;  // CYRILLIC CAPITAL LETTER U
  $f6: result:= #$0416;  // CYRILLIC CAPITAL LETTER ZHE
  $f7: result:= #$0412;  // CYRILLIC CAPITAL LETTER VE
  $f8: result:= #$042c;  // CYRILLIC CAPITAL LETTER SOFT SIGN
  $f9: result:= #$042b;  // CYRILLIC CAPITAL LETTER YERU
  $fa: result:= #$0417;  // CYRILLIC CAPITAL LETTER ZE
  $fb: result:= #$0428;  // CYRILLIC CAPITAL LETTER SHA
  $fc: result:= #$042d;  // CYRILLIC CAPITAL LETTER E
  $fd: result:= #$0429;  // CYRILLIC CAPITAL LETTER SHCHA
  $fe: result:= #$0427;  // CYRILLIC CAPITAL LETTER CHE
  $ff: result:= #$042a;  // CYRILLIC CAPITAL LETTER HARD SIGN
 else
  result:= WideChar(ord(P));
 end;
end;

function KOI8_RToUTF16Str(const s: string):wideString;
// Converts an KOI8-R string into an UTF-16 wideString.
// No special conversions (e.g. on line breaks) are done.
var
  i,j: integer;
begin
  j:= length(s);
  setLength(Result,j);
  for i:= 1 to j do
    Result[i]:=KOI8_RToUTF16Char(s[i]);
end;

function DecodeKOI8R (const S: String): String;
begin
Result:=KOI8_RToUTF16Str (S);
end;

function DecodeHeader(Header: String; IgnoreCharset:Boolean=True): String;

 function B64(AChar: Char): Byte;
 //TODO: Make this use the more efficient MIME Coder
 var
 i: Integer;
 begin
 for i := Low(base64_tbl) to High(base64_tbl) do
  begin
  if AChar = base64_tbl[i] then
   begin
   Result := i;
   exit;
   end;
  end;
  Result := 0;
 end;

 // I needed a Pos function that accepts a startposition
 // PosRev from IdGlobal didn't work here. If you find this useful,    {Do not Localize}
 // you can move this function to IdGlobal.pas

 function PosStartAt(const SubStr,s : string; StartPos : Cardinal = 0; IgnoreCase : boolean = false) : integer;
 begin
 if StartPos=0 then
  begin
  if IgnoreCase then Result := System.Pos(AnsiUpperCase(SubStr),AnsiUpperCase(s)) else Result := System.Pos(SubStr,s)
  end else
   begin
  if IgnoreCase then Result := System.Pos(AnsiUpperCase(SubStr),AnsiUpperCase(System.Copy(s,StartPos,Length(s))))
   else Result := System.Pos(SubStr,System.Copy(s,StartPos,Length(s)));
  if Result>0 then Result := (Result+integer(StartPos))-1;
  end;
 end;

var
  i, l: Integer;
  HeaderEncoding,
  HeaderCharSet,
  s: string;
  a3: array [1..3] of byte;
  a4: array [1..4] of byte;
  encodingstartpos,encodingendpos:Integer;
  substring:string;
  EncodingFound : Boolean;
  KOI8R: Boolean;
  UTF8: Boolean;

begin
// Get the Charset part.
encodingstartpos:=PosStartAt('=?ISO', UpperCase(Header),1);
if encodingstartpos = 0 then encodingstartpos:=PosStartAt('=?WINDOWS', UpperCase(Header),1);
KOI8R:=False;
UTF8:=False;
if encodingstartpos = 0 then
 begin
 encodingstartpos:=PosStartAt('=?KOI8-R', UpperCase(Header),1);
 KOI8R:=True;
 end;
if encodingstartpos = 0 then
 begin
 encodingstartpos:=PosStartAt('=?UTF-8', UpperCase(Header),1);
 UTF8:=True;
 end;

while encodingstartpos > 0 do
 begin
 // Assume we will find the encoding
 EncodingFound := true;
 //we need 3 more question marks first and after that a '?='    {Do not Localize}
 //to find the end of the substring, we can't just search for '?=',    {Do not Localize}
 //example: '=?ISO-8859-1?Q?=E4?='    {Do not Localize}
 encodingendpos := PosStartAt('?', UpperCase(Header),encodingstartpos+5);  {Do not Localize}
 //TODO: Who the hell put gotos in here?
 //TODO: Remove these and whiplash that person
 if encodingendpos = 0 then
  begin
  EncodingFound := false;
  end;

 if EncodingFound then
  begin
  encodingendpos:=PosStartAt('?', UpperCase(Header),encodingendpos+1);  {Do not Localize}
  if encodingendpos=0 then
   begin
   EncodingFound := false;
   end;
  end;

 if EncodingFound then
  begin
  encodingendpos:=PosStartAt('?=', UpperCase(Header),encodingendpos+1);  {Do not Localize}
  if encodingendpos > 0 then
   begin
   substring:=Copy(Header,encodingstartpos,encodingendpos-encodingstartpos+2);
   //now decode the substring
   for i := 1 to 3 do
    begin
    l := Pos('?', substring);  {Do not Localize}
    substring := Copy(substring, l+1, Length(substring) - l + 1 );
    if i = 1 then
     begin
     HeaderCharSet := Copy(substring, 1, Pos('?', substring)-1)  {Do not Localize}
     end else if i = 2 then
      begin
      HeaderEncoding := copy(substring,1,1);
      end;
     end;

   //now Substring needs to end with '?=' otherwise give up!    {Do not Localize}
   if Copy(substring,Length(substring)-1,2)<>'?=' then    {Do not Localize}
    begin
    EncodingFound := false;
    end;

   // Get the HeaderEncoding
   if (AnsiSameText(HeaderEncoding, 'Q')) and (EncodingFound) then
    begin
    substring:=StringReplace (substring, ' ', '', [rfReplaceAll]);
    i := 1;
    s := '';        {Do not Localize}
     repeat // substring can be accessed by index here, because we know that it ends with '?='    {Do not Localize}
     if substring[i] = '_' then  {Do not Localize}
      begin
      s := s + ' ';    {Do not Localize}
      end else if (substring[i] = '=') and (Length(substring)>=i+2+2) then //make sure we can access i+2 and '?=' is still beyond    {Do not Localize}
      begin
      s := s + chr(StrToInt('$' + substring[i+1] + substring[i+2]));  {Do not Localize}
      inc(i,2);
      end else
       begin
       s := s + substring[i];
       end;
      inc(i);
     until (substring[i]='?') and (substring[i+1]='=')  {Do not Localize}
    end else if EncodingFound then
     begin
     while Length(substring) >= 4 do
      begin
      a4[1] := b64(substring[1]);
      a4[2] := b64(substring[2]);
      a4[3] := b64(substring[3]);
      a4[4] := b64(substring[4]);
      a3[1] := Byte((a4[1] shl 2) or (a4[2] shr 4));
      a3[2] := Byte((a4[2] shl 4) or (a4[3] shr 2));
      a3[3] := Byte((a4[3] shl 6) or (a4[4] shr 0));
      substring := Copy(substring, 5, Length(substring));
      s := s + CHR(a3[1]) + CHR(a3[2]) + CHR(a3[3]);
      end;
     end;

    if EncodingFound then
     begin
     if AnsiSameText(HeaderCharSet, 'ISO-2022-JP') then  {Do not Localize}
      begin
      substring := IdCoderHeader.Decode2022JP(s)
      end else
      begin
      substring := s;
      end;

//Added by Antikiller
//¬ некоторых случа€х, если кодировка указана неверно, можно не определ€ть еЄ.
{if IgnoreCharset then
 begin
 Result:=Substring;
 exit;
 end;}


     //replace old substring in header with decoded one:
     if UTF8 then
      header := Copy(header, 1, encodingstartpos - 1)+ Utf8ToAnsi(substring) + Copy(header, encodingendpos + 2, Length(Header))
      else
     if KOI8R then
      header := Copy(header, 1, encodingstartpos - 1)+ DecodeKOI8R(substring) + Copy(header, encodingendpos + 2, Length(Header))
     else
     header := Copy(header, 1, encodingstartpos - 1) + substring + Copy(header, encodingendpos + 2, Length(Header));
     substring := '';  {Do not Localize}
    end;
   end;
  end;
 KOI8R:=False;
 UTF8:=False;
 encodingstartpos:=PosStartAt('=?ISO', UpperCase(Header),encodingstartpos+1);
 if encodingstartpos = 0 then  encodingstartpos:=PosStartAt('=?WINDOWS', UpperCase(Header),encodingstartpos+1);
 if encodingstartpos = 0 then
  begin
  encodingstartpos:=PosStartAt('=?KOI8-R', UpperCase(Header),encodingstartpos+1);
  KOI8R:=True;
  end;
 if encodingstartpos = 0 then
  begin
  encodingstartpos:=PosStartAt('=?UTF-8', UpperCase(Header),1);
  UTF8:=True;
  end;
 end;
 //there might be #0's in header when this it b64 encoded, e.g with:    {Do not Localize}
 //decodeheader('"Fernando Corti=?ISO-8859-1?B?8Q==?=a" <fernando@nowhere.com>');    {Do not Localize}
 while Pos(#0,header)>0 do
  begin
  Delete(header,Pos(#0,header),1);
  end;
 Result:=Header;
end;

end.
