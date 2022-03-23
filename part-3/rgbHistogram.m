function [sol] = rgbHistogram(path_to_image, count_bins)
  I = imread(path_to_image);
  % preluarea imaginii
  R_v = (I(:,:,1))(:);
  G_v = (I(:,:,2))(:);
  B_v = (I(:,:,3))(:);
  % preluarea intr-un vector coloana a valorilor specifice canalelor R,G,B
  edges = [0:256/count_bins:256];
  % crearea unui vector de intervale
  h_R = histc(R_v, edges);
  h_G = histc(G_v, edges);
  h_B = histc(B_v, edges);
  % crearea efectiva a histogramelor R,G,B
  sol = [h_R(1:size(h_R)-1); h_G(1:size(h_G)-1); h_B(1:size(h_B)-1)];
  % concatenarea histogramelor
  sol = sol';
  % returnarea histogramei RGB in forma de vector linie
end