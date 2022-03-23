function [X y] = preprocess(path_to_dataset, histogram, count_bins)
  path_a = strcat(path_to_dataset, 'cats/');
  path_b = strcat(path_to_dataset, 'not_cats/');
  % realizare cailor unde se gasesc imaginile
  xa = getImgNames(path_a);
  xb = getImgNames(path_b);
  % numele pozelor
  [na da] = size(xa);
  [nb db] = size(xb);
  % dimensiunile matricelor care contin numele pozelor
  y = ones(1,na+nb);
  y(na+1:na+nb) = -y(na+1:na+nb);
  % forma vectorizata de generare a coloanei y care 
  % prin care se retine daca intr-o imagine se gaseste
  % o pisica sau nu
  imga(1:na,:) = xa(1:na, 1:da);
  ina(1:na,:) = strcat(path_a, imga(1:na,:));
  % generarea unui vector care contine caile complete catre imagini
  if (histogram == "RGB")
  for i = 1:na
    rez(i,:) = rgbHistogram(ina(i,:), count_bins);
  endfor  
  else
  for i = 1:na
    rez(i,:) = hsvHistogram(ina(i,:), count_bins);
  endfor
  endif
  % geneararea unei matrici de histograme a pozelor
  % care contin pisici
  X = rez;
  
  imgb(1:nb,:) = xb(1:nb, 1:db);
  inb(1:nb,:) = strcat(path_b, imgb(1:nb,:));
  if (histogram == "RGB")
    for i = 1:nb
      rez_2(i,:) = rgbHistogram(inb(i,:), count_bins);
    endfor
  else
    for i = 1:nb
      rez_2(i,:) = hsvHistogram(inb(i,:), count_bins);
    endfor
  endif
  X = [X;rez_2];
  % procedeu similar cu ce s-a mentionat anterior
  % aici se ia in considerare cazul in care pozele din
  % director nu sunt cu pisici
  y = y';
endfunction
