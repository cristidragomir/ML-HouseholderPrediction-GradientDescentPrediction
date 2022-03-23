function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  numeOut = strcat(nume,".out");
  % generare nume fisier out
  fid = fopen(nume, "r");
  fout = fopen(numeOut, "w");
  % deschiderea celor 2 fisiere
  data = dlmread(fid);
  % citirea datelor de intrare
  N = data(1,1);
  % citirea lui N
  val1 = data(N+2,1);
  val2 = data(N+3,1);
  % citirea celor 2 valori - pentru functia membru
  dlmwrite(fout, N);
  dlmwrite(fout,'');
  % scrierea corecta a lui N in fisierul de iesire
  R1 = Iterative(nume, d, eps);
  dlmwrite(fout, R1,'precision','%6f');
  dlmwrite(fout,'');
  % scrierea in fisier a rezultatului dat de algoritmul Iterative
  R2 = Algebraic(nume, d);
  dlmwrite(fout, R2,'precision','%6f');
  dlmwrite(fout,'');
  % scrierea in fisier a rezultatului dat de algoritmul Algebraic
  index_1 = 1:N;
  % indecsii initiali
  index_2 = 1:N;
  % indecsii dupa sortare
  for i=1:N;
    j = i;
    while (j > 1 && R2(j) >= R2(j-1))
      aux = R2(j);
      R2(j) = R2(j-1);
      R2(j-1) = aux;
      aux = index_2(j);
      index_2(j) = index_2(j-1);
      index_2(j-1) = aux;
      j--;
    endwhile
  endfor
  % aplicarea unui algoritm naiv de sortare modificat
  % schimba si pozitiile indecsilor
  for i=1:N
    R2_prel(i) = Apartenenta(R2(i),val1,val2);
  endfor
  % retinerea rezultatului dat de functia Apartenenta
  rez = [index_1' index_2' R2_prel'];
  % realizarea unei matrice formata din indecsii initiali, dupa sortare
  % si a vectorului in care se retine rezultatele functiei Apartenenta
  dlmwrite(fout, rez, 'precision', '%d %d %6f','delimiter','\n');
  % scrierea in fisier dupa formatul dat
  fclose(fout);
endfunction