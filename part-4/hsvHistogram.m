function [sol] = hsvHistogram(path_to_image, count_bins)
  I = imread(path_to_image);
  % preluarea matricei de pixeli corespunzatori imaginii
  I = double(I)/255;
  % convertirea la numere reale a valorilor
  rgb_m = [(I(:,:,1))(:) (I(:,:,2))(:) (I(:,:,3))(:)];
  % crearea unei matrici(nr_pixeli * 3) in care retinem valorile R,G,B
  max_rgb_row = max(rgb_m,[],2);
  min_rgb_row = min(rgb_m,[],2);
  % de pe fiecare linie a matricei retinem maximul, respectiv minimul
  V = max_rgb_row;
  % pentru valoarea V retinem maximele(V - vector coloana)
  delta_rows = max_rgb_row - min_rgb_row;
  % vector coloana in care retinem valorile diferentei dintre max si min
  [n c] = size(rgb_m);
  % dimensiunile matricei in care am reasezat valorile R,G,B
  H = zeros(n,1);
  % valorile H - memorate intr-un vector coloana, initializat cu 0
  index_0 = find(delta_rows == 0);
  % retinem indecsii pentru care delta este nul
  delta_rows(index_0(:)) = 0.0001;
  % iar acele valori le vom initializa cu un numar apropiat de 0
  % pentru evitarea impartirii la 0
  m_r = (mod((rgb_m(:,2)-rgb_m(:,3))./delta_rows,6))./6;
  % aplicam formula pentru cazul in care valoarea R este cea mai mare
  index_r = find(max_rgb_row == rgb_m(:,1));
  % retinem indecsii din max_rgb_row pentru care valoarea R este
  % cea mai mare
  H(index_r(:)) = m_r(index_r(:));
  % atribuim pentru valorile cu acei indecsi in H
  
  m_g = ((rgb_m(:,3)-rgb_m(:,1))./delta_rows.+2)./6;
  index_g = find(max_rgb_row == rgb_m(:,2));
  H(index_g(:)) = m_g(index_g(:));
  % aplicatie similara cu ce s-a mentionat mai sus(aici: valoarea G
  % este cea mai mare)
  m_b = ((rgb_m(:,1)-rgb_m(:,2))./delta_rows.+4)./6;
  index_b = find(max_rgb_row == rgb_m(:,3));
  H(index_b(:)) = m_b(index_b(:));
  % aplicatie similara cu ce s-a mentionat mai sus(aici: valoarea B
  % este cea mai mare)
  index_0 = find(max_rgb_row == 0);
  max_rgb_row(index_0(:)) = 0.0001;
  % cautam indecsii ai caror valori din max_rgb_row este nul
  % si atribuim o valoare apropiata de 0
  m_s = delta_rows./max_rgb_row;
  % realizam impartirea pentru a afla potentiala valoare S
  S = m_s;
  index_s = find(m_s > 1);
  S(index_s(:)) = 0;
  % acolo unde m_s(i) este mai mare ca 1, valorile din vectorul
  % S vor deveni 0
  edges = [0:1.01/count_bins:1.01];
  % realizarea vectorului de intervale
  h_H = histc(H, edges)';
  h_S = histc(S, edges)';
  h_V = histc(V, edges)';
  % realizarea efectiva a histogramei
  s_1 = length(h_H);
  s_2 = length(h_S);
  s_3 = length(h_V);
  % aflarea lungimilor vectorilor de histograme
  sol = [h_H(1:s_1-1) h_S(1:s_2-1) h_V(1:s_3-1)];
  % concatenarea histogramelor
end