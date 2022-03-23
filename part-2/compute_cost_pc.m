function [cost] = compute_cost_pc(points, centroids)
  [nr_p dim] = size(points);
  % nr_p - numarul de puncte, dim - numarul de dimensiuni pentru
  % un punct
  x = centroids;
  [NC col] = size(x);
  % NC - numar de centroizi, col - numarul de dimensiuni
  cost = 0;
  for i=1:nr_p
    min_d = norm(points(i,:)-x(1,:));
    % calculul distantei intr-un spatiu n-dimensional
    best_group = 1;
    group = 2;
    while(group <= NC)
      d = norm(points(i,:)-x(group,:));
      if (d < min_d)
        min_d = d;
        best_group = group;
      endif
      group++;
    endwhile
    % pentru fiecare punct se calculeaza distanta fata de
    % ceilalti centroizi si se retine cea minima
    cost = cost + min_d;
    % distanta minima calculata anterior se aduna la cost
  endfor
endfunction
