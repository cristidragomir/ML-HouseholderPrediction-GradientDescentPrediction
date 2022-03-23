function [values, colind, rowptr] = matrix_to_csr(A)
  [n n] = size(A);
  cnt_colind = 1;
  cnt_values = 1;
  cnt_rowptr = 1;
  % initializarea primelor valori din fiecare vector
  % corespunzator compresiei matricei
  for i = 1:n
    % se parcurge fiecare linie din matrice
    j = 1;
    % se parcurge cu j fiecare coloana de pe linia i
    while (j <= n && A(i,j) == 0)
      j++;
    endwhile
    % determinarea pozitiei primului element nenul din matrice
    if (A(i,j) != 0)
    % prin acest if exceptam situatia in care j corespunzator
    % liniei nu este gasit  
      values(cnt_values) = A(i,j);
      colind(cnt_colind) = j;
      rowptr(cnt_rowptr) = cnt_colind;
      cnt_colind++;
      cnt_rowptr++;
      cnt_values++;
      % se actualizeaza vectorii specifici formei
      % compresate a matricei A
    endif
    j++;
    while (j <= n)
      if (A(i,j) != 0)
        colind(cnt_colind) = j;
        cnt_colind++;
        values(cnt_values) = A(i,j);
        cnt_values++;
      endif
      j++;
    endwhile
    % atunci cand se gasesc alte elemente nenule pe linia i
    % se actualizeaza vectorii corespunzatori
  endfor
  rowptr(cnt_rowptr) = cnt_values;
  % initializarea ultimului element din vectorul rowptr
endfunction