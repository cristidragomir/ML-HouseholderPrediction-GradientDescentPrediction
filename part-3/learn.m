function [w] = learn(X, y)
  [n m] = size(X);
  bias = ones(n,1);
  X = [X bias];
  % bordarea matricei cu o coloana de 1
  w = SST(X,y);
  % invatarea lui w
end
