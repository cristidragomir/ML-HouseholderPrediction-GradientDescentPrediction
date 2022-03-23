function [centroids] = clustering_pc(points, NC)
  [nr_p dim] = size(points);
  % nr_p - numarul de puncte, dim - numarul de dimensiuni
  % al unui punct
  cnt = 1;
  len = zeros(1, NC);
  % vector de lungimi - se va retine numarul de elemente
  % de pe fiecare linie a matricei L
  while (cnt <= nr_p)
    % Realizam initializarea
    index = mod(cnt,NC);
    len(index+1)++;
    % actualizam vectorul de lungimi
    L(index+1,len(index+1)) = cnt;
    % completam matricea in care separam punctele
    cnt++;
  endwhile
  bec = 1;
  x0 = zeros(NC, dim);
  x = zeros(NC, dim);
  % vectorul de centroizi
  while (bec != 2)
    for i = 1:NC
      S = zeros(1, dim);
      for j = 1:len(i)
        for k = 1:dim
          S(1,k) = S(1,k)+points(L(i,j),k);
        endfor
      endfor
      % realizam suma pe dimensiuni punctelor cu indecsii stocati
      % in linia i din matricea L
      for j = 1:dim
        if (len(i) != 0)
          x(i,j) = S(1,j)/len(i);
        endif
      endfor
      % facem media pe fiecare coordonata a punctelor cu indecsii
      % situati pe linia i a matricei L
    endfor
    for i=1:NC    
      err = norm(x(i,:)-x0(i,:));
      if (err - 0.000001 > 0)
        bec = 0;
        break;
      endif
      % verificam daca pozitiile centroizilor se modifica sau nu
    endfor
    if (bec == 1)
      bec = 2;
    endif
    if (bec == 0)
      % daca pozitiile centroizilor s-au modificat
      % se va prelucra fiecare punct astfel incat
      % sa se cunoasca cel mai apropiat centroid
      % de un anumit punct
      x0 = x;
      % se retine vectorul de centroizi
      % pentru comparatie
      len = zeros(1,NC);
      % se reinitializeaza vectorul de lungimi
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
        len(best_group)++;
        L(best_group,len(best_group)) = i;
        % se verifica distantele dintre punctul i si ceilalti
        % centroizi si se retine distanta minima, precum si numarul
        % centroidului pentru care se realizeaza distanta minima
        % si se reface matricea L
      endfor
      bec = 1;
    endif
  endwhile
  centroids = x;
  % se returneaza vectorul x de centroizi
endfunction
