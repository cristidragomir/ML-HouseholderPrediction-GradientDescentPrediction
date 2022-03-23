function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  fid = fopen(nume, "r");
  data = dlmread(fid);
  % deschiderea fisierului si preluarea intr-o matrice a elementelor din fisier
  N = data(1,1);
  % retinerea lui N
  A = zeros(N,N);
  % realizarea matricei N
  val1 = data(N+2,1);
  val2 = data(N+3,1);
  % retinerea ultimelor 2 valori
  for i=1:N
   index = data(i+1, 3:2+data(i+1,2));
   % preluarea indecsilor catre care exista o legatura de la pagina i
   A(i,index(:)) = 1;
   % marcarea existentei unui link in matricea de adiacenta
   Lout(i) = data(i+1,2);
   % retinerea numarului de legaturi pentru pagina i
   if (A(i,i) == 1)
      A(i,i) = 0;
      Lout(i) = Lout(i)-1;
   endif
   % se neglijeaza linkul care indica spre aceeasi pagina
  endfor
  R0 = ones(N,1);
  R0 = R0/N;
  % initializarea lui R
  K = diag(Lout);
  % constructia matricei K
  M = (PR_Inv(K)*A)';
  % constructia matricei M
  col_1 = ones(N,1);
  % realizarea unei coloane de 1
  R = d*M*R0+((1-d)/N)*col_1;
  % realizarea primei iteratii in calculul lui R
  while(norm(R-R0) > eps)
    R0 = R;
    R = d*M*R0+((1-d)/N)*col_1;
    if(norm(R-R0) < eps)
      R = R0;
      break;
    endif
  endwhile
  % returnarea lui R atunci cand eroarea dintre R calculat anterior
  % si cel actual devine mai mica decat un anumit numar epsilon
endfunction