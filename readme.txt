Dragomir Constantin-Cristian 314CB

Descrierea modului de rezolvare a temei 2
din cadrul materiei METODE NUMERICE

functia Iterative()

Se citesc datele de intrare din fisier si se memoreaza
intr-o matrice. Ulterior se declara mai multe variabile
care vor avea valori din matricea ce contine datele de
intrare (N, val1, val2). Ulterior se construieste matricea
de adiacenta, impreuna cu un vector ce contine numarul de
linkuri catre alte pagini din pagina i. Se construieste vectorul
R initial(fiecare element are valoarea 1/N). Se genereaza matricele
K si M. Se aplica formula data pe vectorul R pana ce eroarea dintre
R-ul anterior si cel actual devine mai mica decat epsilon.

functia Algebraic()

Ca la algoritmul precedent (Iterative), se citesc datele, se genereaza matricea
de adiacenta, matricele K, M. R se calculeaza direct cu formula data
In plus, ne folosim de o coloana de 1 pentru completarea formulei.

functia PR_Inv()

Se descompune matricea A in doua matrice Q, R respectand algoritmul
Gram-Schmidt optimizat. Ulterior, se calculeaza fiecare coloana din
matricea inversa utilizand algoritmul de rezolvare a sistemelor superior
triunghiulare.

functia PageRank()

Se citesc datele din fisierul de intrare ca in functiile precedente.
Pe parcurs, se fac anumite scrieri corespunzatoare in fisierul de iesire.
Se retin cei doi vectori R1 si R2 generati de algoritmii Iterative,
respectiv Algebraic. Se face o sortare naiva a lui R2, si se schimba ordinea
indecsilor in vectorul index_2. Se retine intr-un alt vector rezultatele
aplicarii functiei Apartenenta(). Se genereaza o matrice cu continutul
ce trebuie scris in fisier si se realizeaza modificarea fisierului de iesire
conform rigorilor.

functia Apartenenta()

Se calculeaza coeficientii functiei de gradul I astfel incat
functia membru sa fie continua pe tot intervalul [0,1]. Cu aceasta functie
se calculeaza valoarea functiei intr-un punct dat ca parametru.

