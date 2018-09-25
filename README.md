Informatii generale:
====================

- Acest program reprezinta jocul X si O (tic-tac-toe).
- Acest joc are 9 casute. Pentru a castiga, trebuie sa formezi 3 de X sau 3 de O
pe aceeasi linie (linie, diagonala sau coloana).

Mod de utilizare:
=================

- Se apeleaza din Octave functia joc().
- La inceputul fiecarei partide, jucatorul va putea alege daca vrea sa joace cu
X sau O. De asemenea, va putea si iesi din joc folosind tasta "q".
- Daca jucatorul alege X, va incepe primul. Daca alege O, va incepe al doilea.
- Cand trebuie sa introduca mutarea sa, jucatorul va introduce 2 numere cuprinse
intre 1 si 3 (linia si coloana), separate prin virgula (Exemplu: 1,2 sau 3,3 sau 
2,2). Daca caracterele, numerele sau modul de introducere este incorect, va aparea 
un mesaj de eroare si jucatorul va trebui sa introduca alte date. Si aici se poate 
iesi din joc, prin introducerea literei "q", singurul caracter acceptat.
- Se vor introduce mutarile pana cand calculatorul sau jucatorul castiga (sau este
remiza).
- Dupa fiecare partida va fi afisat scorul si jucatorul va trebui sa aleaga cu ce
vrea sa joace, X sau O.

Prezentarea implementarii:
==========================

Functii folosite pentru implementarea programului:
1) Functia principala:
function [] = joc();
2) Functia de afisare a tablei de joc:
function [] = joc_afisare(tabla);
3) Functia de mutare a jucatorului:
function mutare = joc_mutareJucator(tabla);
4) Functia de mutare a calculatorului:
function mutare = joc_mutareCalculator(tabla, alegere, tur);
5) Functia ce verifica posibilitatea de victorie:
function mutare = joc_verifica_posibilitate_victorie(tabla,argument);
6) Functia ce verifica victoria:
function verdict = joc_verifica_victorie(tabla);

Algoritm:
- Se creeaza un loop infinit (iesirea se va face prin litera q la finalul unei
partide sau cand se cere introducerea unei noi mutari).
- Se afiseaza scorul curent si i se cere jucatorului sa aleaga cu ce sa joace si
se initializeaza tabla de joc.
- In implementarea aleasa, o casuta goala are valoarea 0, una cu X are valoarea 
1 si una cu O are valoarea -1.
- Daca jucatorul alege X, va incepe primul. X-ul incepe mereu primul.
- Se afiseaza tabla de joc cu functia joc_afisare(tabla). Aceasta functie afiseaza 
tabla de joc si in loc de 0 pune '_', in loc de -1 pune 'O' si in loc de 1 pune 'X'.
- Se apeleaza functia joc_mutareJucator(tabla) ce returneaza alegerea jucatorului. 
Functia verifica daca a primit litera de iesire "q". Daca nu, verifica daca datele 
introduse sunt corecte. Daca sunt corecte, returneaza "mutare", ce contine linia 
si coloana celulei alese. Daca datele sunt incorecte i se va cere utilizatorului 
alte date.
- Se va modifica tabla de joc in functie de alegere si se apeleaza functia 
joc_verifica_victorie(tabla). Functia decide daca jucatorul a castigat sau nu. 
Functia verifica daca suma elementelor de pe o linie, o coloana sau o diagonala
este 3 sau -3. Daca jucatorul joaca cu X si functia returneaza 3, inseamna ca 
jucatorul a castigat.
- Se verifica daca s-a ajuns la cazul de remiza.
- Daca nu este remiza si jucatorul nu a castigat, se apeleaza functia 
joc_mutareCalculator(tabla, alegere, tur).
- Functia de joc_mutareCalculator realizeaza mutarea calculatorului, alegand cel 
mai bun caz. Functia lucreaza dupa niste pasi si niste cazuri specifice. Daca 
calculatorul incepe primul, primii 3 pasi sunt deja planificati astfel incat 
acesta sa atace jucatorul, iar dupa pasul 3 calculatorul va incerca sa inchida 
jocul sau sa se apere. Daca jucatorul incepe primul, primii 2 pasi sunt 
stabiliti deja pentru calculator pentru a avea cea mai buna aparare, iar in 
ceilalti pasi acesta va incerca sa inchida jocul sau se va apara. Aceasta 
functie foloseste functia de joc_verifica_posibilitate_victorie(tabla, argument). 
Aceasta functie returneaza o mutare pentru victorie(daca exista posibilitatea) sau 
o mutare pentru aparare(daca jucatorul ar putea invinge la urmatorul pas si nu 
exista posibilitatea de victorie pentru calculator).
- Functia joc_verifica_posibilitate_victorie este asemenatoare cu cea de verificare 
victorie, doar ca aceasta verifica daca suma de pe o linie, coloana sau diagonala 
este egala cu 2 sau -2. Daca este egala, va returna valorile celulei goale de pe 
acea linie, coloana sau diagonala.
- Dupa mutarea calculatorului se verifica daca acesta a castigat sau nu partida.
- Daca jucatorul alege O, calculatorul incepe primul.
- Algoritmul este aproximativ la fel, dar jucatorul este al doilea. Calculatorul 
va pune prima oara in coltul din stanga sus, incercand sa prinda jucatorul pe 2 
parti.
- De exemplu, logica este implementata in asa fel incat daca jucatorul este 
al doilea si nu pune prima oara in centru va pierde.
