unit Gradient; 

interface 

uses 
 Windows, Graphics; 

type
 TRGB = record 
  B, G, R: byte; 
 end; 

 ARGB = array [0..1] of TRGB; 

 PARGB = ^ARGB; 

procedure HGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 
procedure VGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 
procedure RGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 

var 
 Bitmap: TBitmap; 
 p: PARGB; 

implementation 

procedure HGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 
var 
 x, y, c1, c2, r1, g1, b1: integer; 
 dr, dg, db: real; 
begin 
 Bitmap.Width:=abs(X1-X2); 
 Bitmap.Height:=abs(Y1-Y2); 
 c1:=ColorToRGB(Color1); 
 r1:=getRValue(c1); 
 g1:=getGValue(c1); 
 b1:=getBValue(c1); 
 c2:=ColorToRGB(Color2); 
 dr:=(getRValue(c2)-r1)/Bitmap.Width; 
 dg:=(getGValue(c2)-g1)/Bitmap.Width; 
 db:=(getBValue(c2)-b1)/Bitmap.Width; 
 for y:=0 to Bitmap.Height-1 do 
 begin 
  p:=Bitmap.ScanLine[y]; 
  for x:=0 to Bitmap.Width-1 do 
  begin 
   p[x].R:=round(r1+x*dr); 
   p[x].G:=round(g1+x*dg); 
   p[x].B:=round(b1+x*db) 
  end 
 end; 
 Canvas.Draw(X1, Y1, Bitmap) 
end; 

procedure VGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 
var 
 x, y, c1, c2, r1, g1, b1: integer; 
 dr, dg, db: real; 
begin 
 Bitmap.Width:=abs(X1-X2); 
 Bitmap.Height:=abs(Y1-Y2); 
 c1:=ColorToRGB(Color1); 
 r1:=getRValue(c1); 
 g1:=getGValue(c1); 
 b1:=getBValue(c1); 
 c2:=ColorToRGB(Color2); 
 dr:=(getRValue(c2)-r1)/Bitmap.Height; 
 dg:=(getGValue(c2)-g1)/Bitmap.Height; 
 db:=(getBValue(c2)-b1)/Bitmap.Height; 
 for y:=0 to Bitmap.Height-1 do 
 begin 
  p:=Bitmap.ScanLine[y]; 
  for x:=0 to Bitmap.Width-1 do 
  begin 
   p[x].R:=round(r1+y*dr); 
   p[x].G:=round(g1+y*dg); 
   p[x].B:=round(b1+y*db) 
  end 
 end; 
 Canvas.Draw(X1, Y1, Bitmap) 
end; 

procedure RGradientRect(Canvas: TCanvas; X1, Y1, X2, Y2: integer; Color1, Color2: TColor); 
var 
 x, y, c1, c2, r1, g1, b1: integer; 
 dr, dg, db, d: real; 
begin 
 Bitmap.Width:=abs(X1-X2); 
 Bitmap.Height:=abs(Y1-Y2); 
 c1:=ColorToRGB(Color1); 
 r1:=getRValue(c1); 
 g1:=getGValue(c1); 
 b1:=getBValue(c1); 
 c2:=ColorToRGB(Color2); 
 d:=sqrt(Bitmap.Width*Bitmap.Width+Bitmap.Height*Bitmap.Height)/2; 
 dr:=(getRValue(c2)-r1)/d; 
 dg:=(getGValue(c2)-g1)/d; 
 db:=(getBValue(c2)-b1)/d; 
 for y:=0 to Bitmap.Height-1 do 
 begin 
  p:=Bitmap.ScanLine[y]; 
  for x:=0 to Bitmap.Width-1 do 
  begin 
   d:=sqrt(((Bitmap.Width-2*x)*(Bitmap.Width-2*x)+(Bitmap.Height-2*y)*(Bitmap.Height-2*y))/4); 
   p[x].R:=round(r1+d*dr); 
   p[x].G:=round(g1+d*dg); 
   p[x].B:=round(b1+d*db) 
  end 
 end; 
 Canvas.Draw(X1, Y1, Bitmap) 
end; 

initialization 

begin 
 Bitmap:=TBitmap.create(); 
 Bitmap.PixelFormat:=pf24bit 
end; 

finalization 

begin 
 Bitmap.free() 
end; 

end.

