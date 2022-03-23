function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X y] = preprocess(path_to_testset, histogram, count_bins);
  % generarea matricei X pentru setul de testare
  [n m] = size(X);
  ind = [1:m];
  rez = mean(X);
  rez_2 = std(X);
  X = (X - rez)./rez_2;
  bias = ones(n, 1);
  X = [X bias];
  [n m] = size(X);
  % scalarea coloanelor si bordarea cu 1 a matricei X
  % corespunzatoare setului de testare
  ev = X*w;
  % realizarea vectorului de predictii
  total = length(ev);
  % numarul total de poze din setul de testare
  correct_1 = 0;
  correct_2 = 0;
  % numarul de imagini corect prezise
  for i = 1:total
    if (ev(i) >= 0 && y(i) == 1)
      correct_1++;
    elseif (ev(i) < 0 && y(i) == -1)
      correct_2++;
    endif
    % daca sunt respectate anumite conditii contoarele
    % sunt actualizate
  endfor
  percentage = (correct_1 + correct_2)/total;
  % realizarea procentajului de imagini prezise corect
endfunction
