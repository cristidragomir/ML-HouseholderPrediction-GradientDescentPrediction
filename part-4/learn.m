function [w] = learn(X, y, lr, epochs)
  [n m] = size(X);
  rez = mean(X);
  rez_2 = std(X);
  X = (X - rez)./rez_2;
  % scalarea coloanelor
  bias = ones(n, 1);
  X = [X bias];
  % bordarea cu 1 a matricei X
  [n m] = size(X);
  w = (0.2*rand(1,m)-0.1)';
  % completarea cu valori random a lui vectorului de invatare
  l1 = 1;
  l2 = n;
  coef = lr/n;
  % coeficientul lr/N
  for i = 1:epochs
    r_lines = floor(l1+(l2-l1+1)*rand(1,64));
    % crearea unui vecotor de indecsi aleatori
    X_b = [X(r_lines(:),:)];
    % realizarea matricei de caracterisitici utilizand
    % indecsii aleatori generati
    y_b = [y(r_lines(:),:)];
    % retinerea clasei din care face parte imaginea aleatoare
    aux = X_b*w - y_b;
    % parte din suma algoritmului
    w = w - coef*X_b'*aux;
    % refacerea intr-o iteratie a intregului vector w
  endfor
endfunction
