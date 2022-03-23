function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului de intrare;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  fid = fopen(nume, "r");
  data = dlmread(fid);
  % preluarea datelor de intrare
  N = data(1,1);
  % preluarea lui N
  A = zeros(N,N);
  % definirea unei matrice nule
  val1 = data(N+2,1);
  val2 = data(N+3,1);
  % preluarea celor 2 valori(pentru functia membru)
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
  col_1 = ones(N,1);
  % coloana de 1
  K = diag(Lout);
  % realizarea matricei K - conform definitiei
  M = (PR_Inv(K)*A)';
  % realizarea matricei M - conform definitiei
  R = PR_Inv(eye(N)-d*M)*(1-d)/N*col_1;
  % calculul solutiei R