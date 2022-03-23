function [x] = SST(A, b)
  [Q R] = Householder(A);
  % spargerea matricii X in produsul Q*R
  b = Q'*b;
  % Q - matrice ortogonala, inversa sa este Q transpus
  % Ecuatia devine R*w = b_nou, R - matrice superior triunghiulara
  [n m] = size(R);
  % dimensiunile lui R
  for i=m:-1:1
    s = 0;
    for j=i+1:m
      s = s + R(i,j) * x(j);
    endfor
    x(i) = (b(i) - s)/R(i,i);
  endfor
  % aplicarea algoritmului de rezolvare a sistemelor superior triunghiulare
  x = x';
  % returnarea unui vector coloana
end
    