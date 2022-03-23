function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
	a = 1/(val2 - val1);
  b = 1 - a*val2;
  % calculul coeficientilor a si b astfel incat functia sa fie continua
  % pe tot intervalul
  if (x < val1)
    y = 0;
  elseif (x > val2)
    y = 1;
  else
    y = a*x+b;
  endif
  % in functie de valoarea lui x se returneaza o valoare corespunzatoare
  % a functiei
 endfunction
