function [A, b] = generate_probabilities_system(rows)
  A(1, 1) = 4;
  A(1, 2) = -1;
  A(1, 3) = -1;
  cnt_lines = 2;
  % am initializat prima linie din matricea aferenta sistemului
  lines = rows;
  while (cnt_lines < rows)
    % ne propunem sa memoram in fiecare linie din matrice cate
    % o ecuatie corespunzatoare in functie de coeficientii
    % fiecarei probabilitati de care depinde ecuatia
    start = (cnt_lines*(cnt_lines-1))/2+1;
    final = (cnt_lines*(cnt_lines+1))/2;
    for i = start:final
      if (i == start)
        A(i,i) = 5;
      elseif (i == final)
        A(i,i) = 5;
      else
        A(i,i) = 6;
      endif
    endfor
    % in functie de intersectia la care se afla soarecele
    % acesta va avea mai multe cai pe care acesta merge
    cnt_lines++;
  endwhile
  % se trateaza separat ultima linie din matrice
  start = (rows*(rows-1))/2+1;
  % numarul intersectiei la care incepe linia
  final = (rows*(rows+1))/2;
  % numarul intersectiei la care se termina linia
  for i = start:final
    if (i == start)
      A(i,i) = 4;
    elseif (i == final)
      A(i,i) = 4;
    else
      A(i,i) = 5;
    endif
  endfor
  % datorita formei labirintului se schimba numarul de cai pe
  % ultima linie a sa
  lines = 2;
  while (lines < rows)
    % vrem sa stocam in matrice coeficientii negativi din ecuatii
    % incepand cu linia 2
    start = (lines*(lines-1))/2+1;
    % numarul intersectiei cu care incepe linia
    final = (lines*(lines+1))/2;
    % numarul intersectiei cu care se termina linia
    dir = [1-lines 1+lines lines -lines 1 -1]';
    % totalul directiilor pe care se poate deplasa soarecele
    % dintr-o anumita linie
    dir_el_st_lin = [1 3 2 5];
    % directiile pe care se poate deplasa un soarece
    % daca se afla la INCEPUT de linie
    dir_el_fin_lin = [4 6 3 2];
    % directiile pe care se poate deplasa un soarece
    % daca se afla la SFARSIT de linie
    i = start;
    for j = 1:4
      index = dir_el_st_lin(j);
      A(i, i+dir(index)) = -1;
    endfor
    i = final;
    for j = 1:4
      index = dir_el_fin_lin(j);
      A(i, i+dir(index)) = -1;
    endfor
    % initializarea cu -1 a unor coeficienti din ecuatie
    for i = start+1:final-1
      for j= 1:6
        A(i,i+dir(j)) = -1;
      endfor
    endfor
    lines++;
    % initializarea cu -1 a unor coeficienti din ecuatie
    % tratarea separata a unor cazuri
  endwhile
  dir = [1-lines 1+lines lines -lines 1 -1]';
  % vector de directii -> unde poate ajunge soarecele
  % de la o anumita intersectie
  start = (rows*(rows-1))/2+1;
  final = (rows*(rows+1))/2;
  % determinarea capetelor ultimei linii
  i = start;
  A(i,i+dir(1)) = -1;
  A(i,i+dir(5)) = -1;
  i = final;
  A(i,i+dir(4)) = -1;
  A(i,i+dir(6)) = -1;
  % initializarea cu -1 a unor coeficienti din ecuatiile
  % specifice capetelor ultimei linii
  for i = start+1:final-1
    dir_aux = [5 6 4 1];
    for j = 1:4
      index = dir_aux(j);
      A(i, i+dir(index)) = -1;
    endfor
  endfor
  % initializarea cu -1 a ecuatiilor corespunzatoare
  % intersectiilor situate in interiorul ultimei linii
  %
  % initializarea cu -1 a unor coeficienti corespunzatori
  % ultimei ecuatii aferente problemei
  for i = 1:rows*(rows+1)/2-rows
    b(i) = 0;  
  endfor
  for i = rows*(rows+1)/2-rows+1:rows*(rows+1)/2
    b(i) = 1;
  endfor
  b = b';
  % returnam un vector coloana corespunzator termenilor liberi
  % ai sistemului
endfunction