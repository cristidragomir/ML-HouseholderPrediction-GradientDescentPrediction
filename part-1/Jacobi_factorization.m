function [G_J, c_J] = Jacobi_factorization(A, b)
  D = diag(diag(A));
  L = -tril(A, -1);
  U = -triu(A, 1);
  % se sparge matricea A intr-o matrice strict inferior
  % triunghiulata (L), o matrice strict superior triunghiulata (U)
  % si o matrice diagonala (D) 
  G_J = inv(D)*(L+U);
  % se genereaza matricea de iteratie
  c_J = inv(D)*b;
  % se genereaza vectorul de iteratie
endfunction
