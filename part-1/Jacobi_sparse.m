function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(G_rowptr) - 1;
  % n - numarul de linii din matricea A compresata
  x0 = zeros(n,1);
  x = x0;
  % x0 - aproximatia initiala a solutiei
  do
    bec = 1;
    y = csr_multiplication(G_values, G_colind, G_rowptr, x0);
    % rezultatul inmultirii dintre matricea de iteratie si o aproximatie
    % utilizand functia data in tema csr_multiplication
    x = y + c;
    % una din aproximarile solutiei - conform relatiei de recurenta a
    % a metodelor iterative
    if (norm(x-x0) - tol > 0)
      bec = 0;
    endif
    % se verifica daca solutia este "suficient" de exacta
    if (bec == 0)
      x0 = x;
    endif
    % conditia de iesire din instructiunea repetitiva
  until (bec)
endfunction