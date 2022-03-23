function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  path_a = strcat(path_to_testset, 'cats/');
  path_b = strcat(path_to_testset, 'not_cats/');
  % realizarea cailor catre imagini
  xa = getImgNames(path_a);
  xb = getImgNames(path_b);
  % numele imaginilor
	[na da] = size(xa);
  [nb db] = size(xb);
  % dimensiunile matricelor care contin numele pozelor
  correct = 0;
  % variabila in care vom stoca numarul de imagini
  % corect prezise (daca este o imagine cu o pisica sau nu)
  for i=1:na
    imga = xa(i, 1:da);
	  ina = strcat(path_a, imga);
    % realizarea caii complete catre o imagine
    if (histogram == 'RGB')
      rez = rgbHistogram(ina, count_bins);
    else
      rez = hsvHistogram(ina, count_bins);
    endif
    % rez - histograma aferenta imaginii
    rez = [rez 1];
    % bordarea cu 1 a vectorului rez
    ev = w'*rez';
    % aplicarea produsului prin care se va realiza predictia
    if (ev >= 0)
      correct++;
    endif
    % daca predictia e corecta incrementam numarul de predictii corecte
  endfor
  for i=1:nb
    imgb = xb(i, 1:db);
    inb = strcat(path_b, imgb);
    if (histogram == 'RGB')
      rez = rgbHistogram(inb, count_bins);
    else
      rez = hsvHistogram(inb, count_bins);
    endif
    rez = [rez 1];
    ev = w'*rez';
    if (ev < 0)
      correct++;
    endif
  endfor
  % procedeu similar cu ce s-a mentionat anterior
  percentage = correct/(na+nb);
  % returnarea procentului de imagini prezise corect
endfunction