program project1;
uses crt;

const
  sirka = 80;
  vyska = 25;

type
  plocha = array[0..vyska + 1, 0..sirka + 1] of boolean;

var generacia, i: integer;
  genAktualna, genNova: plocha;

procedure inicGeneracie(var gen: plocha);
var i, j: integer;
begin
  for i := 0 to vyska + 1 do
    for j := 0 to sirka + 1 do
      gen[i, j] := false;
end;

procedure zobrazGeneraciu(gen: plocha);
var i, j: integer;
begin
  gotoxy(1, 1);

  for i := 1 to vyska do
  begin
    for j := 1 to sirka do
    begin
      if(gen[i, j]) then textbackground(white)
      else textbackground(black);

      write(' ');
    end;

    writeln();
  end;
end;

function pocetSusedov(gen: plocha; riadok, stlpec: integer): integer;
var i, j: integer;
begin
  pocetSusedov := 0;

  for i := -1 to 1 do
    for j := -1 to 1 do
      if((riadok + i <> riadok) or (stlpec + j <> stlpec)) and
        (gen[riadok + i, stlpec + j]) then pocetSusedov := pocetSusedov + 1;
end;

procedure aktualizuj(var genNova: plocha; genAktualna: plocha);
var i, j: integer;
begin
  for i := 1 to vyska do
    for j := 1 to sirka do
    begin
      if(pocetSusedov(genAktualna, i, j) < 2) then genNova[i, j] := false
      else if(pocetSusedov(genAktualna, i, j) > 3) then genNova[i, j] := false
      else if(pocetSusedov(genAktualna, i, j) = 3) then genNova[i, j] := true
      else genNova[i, j] := genAktualna[i, j];
    end;
end;

procedure vypisGeneraciu(generacia: integer);
begin
  gotoxy(sirka + 2, vyska div 2);
  write('Generacia: ', generacia);
end;

begin
  randomize;

  generacia := 0;
  inicGeneracie(genAktualna);
  genNova := genAktualna;

  // Ropucha = toad
  {
  genAktualna[2, 4] := true;
  genAktualna[3, 2] := true;
  genAktualna[3, 5] := true;
  genAktualna[4, 2] := true;
  genAktualna[4, 5] := true;
  genAktualna[5, 3] := true;
  }

  // Blikac = blinker
  {
  genAktualna[9, 10] := true;
  genAktualna[10, 10] := true;
  genAktualna[11, 10] := true;
  }

  // vygenerovanie nahodnych bodov
  for i := 1 to 400 do
    genAktualna[random(vyska) + 1, random(sirka) + 1] := true;

  repeat
    vypisGeneraciu(generacia);
    aktualizuj(genNova, genAktualna);
    zobrazGeneraciu(genAktualna);

    //delay(50);
                         
    generacia := generacia + 1;
    genAktualna := genNova;

  until keypressed;
  //until generacia = 3;
end.

