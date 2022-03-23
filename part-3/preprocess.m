function [X y] = preprocess(path_to_dataset, histogram, count_bins)
  path_a = strcat(path_to_dataset, 'cats/');
  path_b = strcat(path_to_dataset, 'not_cats/');
  % realizarea cailor unde se gasesc imaginile
  xa = getImgNames(path_a);
  xb = getImgNames(path_b);
  % numele pozelor
	[na da] = size(xa);
  [nb db] = size(xb);
  % dimensiunile matricelor care contin numele pozelor
  cnt = 1;
  
  imga = xa(1, 1:da);
  ina = strcat(path_a, imga);
  % realizarea caii complete catre o imagine
  if (histogram == 'RGB')
    rez = rgbHistogram(ina, count_bins);
  else
    rez = hsvHistogram(ina, count_bins);
  endif
  X = rez;
  y(cnt) = 1;
  cnt++;
  % rez - histograma aferenta a imaginii este pusa in matricea X
  % y - vector care identifica daca in imagine este o pisica sau nu
  
  for i=2:na
    imga = xa(i, 1:da);
	  ina = strcat(path_a, imga);
    if (histogram == 'RGB')
      rez = rgbHistogram(ina, count_bins);
    else
      rez = hsvHistogram(ina, count_bins);
    endif
    X = [X;rez];
    y(cnt) = 1;
    cnt++;
  endfor
  % repetarea procedeului mentionat anterior pentru
  % folderul in care se gasesc pisici
  for i=1:nb
    imgb = xb(i, 1:db);
    inb = strcat(path_b, imgb);
    if (histogram == 'RGB')
      rez = rgbHistogram(inb, count_bins);
    else
      rez = hsvHistogram(inb, count_bins);
    endif
    X = [X;rez];
    y(cnt) = -1;
    cnt++;
  endfor
  % repetarea procedeului mentionat anterior pentru
  % folderul in care se NU gasesc pisici
  y = y';
  % returnarea unui vector coloana
endfunction
