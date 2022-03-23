function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  [N N] = size(A);
  for i=1:N
    R(i,i) = norm(A(:,i),2);
    Q(:,i) = A(:,i)/R(i,i);
    for j=i+1:N
      R(i,j) = Q(:,i)'*A(:,j);
      A(:,j) = A(:,j) - Q(:,i)*R(i,j); 
    endfor
  endfor
  % Descompunerea matricei A in doua matrice Q si R;
  % Q - matrice ortogonala, R - matrice superior triunghiulata
  B = zeros(N,1);
  % initializarea unei matrice care va fi completata cu coloane
  I = eye(N);
  % matricea identitate
  for i = 1:N
    b = I(:,i);
    % preluarea unei coloane din matricea I
    b = Q'*b;
    % refacerea ecuatiei de rezolvat: R*x(i) = Q'*b, b = e(i)
    % e(i) - coloana cu zerouri peste tot cu exceptia pozitiei i
    xi = zeros(N,1);
    for j = N:-1:1
      s = R(j,:)*xi;
      % se inmulteste linia j din R cu x(i) - coloana ce va fi adaugata la matricea B
      % xi(j) = 0 la inceput
      xi(j) = (b(j)-s)/R(j,j);
    endfor
    % aplicarea algoritmului de rezolvare a unui sistem superior triunghiulat
    B = [B xi];
    % alipirea coloanei in matrice
  endfor
  B = B(:,2:N+1);
  % se sterge prima coloana de zerouri, iar B = A^(-1)
endfunction
