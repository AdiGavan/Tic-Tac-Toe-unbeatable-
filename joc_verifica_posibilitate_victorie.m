function mutare = joc_verifica_posibilitate_victorie(tabla,argument)
	
	% Functia determina daca exista 2 de X sau 2 de Y si o casuta libera
	% pe aceeasi linie, coloana sau diagonala
	
	% "argument" reprezinta numarul 2 sau -2, in functie de alegerea jucatorului
	% 2 inseamna 2 de X pe aceeasi linie/coloana/diagonala
	% -2 inseamna 2 de O pe aceeasi linie/coloana/diagonala
	
	aux(1) = 0;
	aux(2) = 0;
	mutare(1) = 0;
	mutare(2) = 0;
	
	% Verificare linii
	for l=1:3
		s = 0;
		aux(1) = 0;
		aux(2) = 0;
		for c=1:3
			s = s + tabla(l,c);
			
			% Retine celula goala de pe linie
			if tabla(l,c) == 0
				aux(1) = l;
				aux(2) = c;
			endif
			
			% Daca se indeplineste conditia, returneaza valorile celulei goale
			if s == argument
				mutare(1) = aux(1);
				mutare(2) = aux(2);
				if mutare(1) != 0 && mutare(2) != 0
					return
				endif
			endif
		endfor
	endfor
	
	% Verificare coloane
	for c=1:3
		aux(1) = 0;
		aux(2) = 0;
		s = 0;
		for l=1:3
			s = s + tabla(l,c);
			
			% Retine celula goala de pe coloana
			if tabla(l,c) == 0
				aux(1) = l;
				aux(2) = c;
			endif
			
			% Daca se indeplineste conditia, returneaza valorile celulei goale
			if s == argument
				mutare(1) = aux(1);
				mutare(2) = aux(2);
				if mutare(1) != 0 && mutare(2) != 0
					return
				endif
			endif
		endfor
	endfor
	
	% Verificare diagonala principala
	s = 0;
	aux(1) = 0;
	aux(2) = 0;
	for i = 1:3
		s = s + tabla(i,i);
		
		% Retine celula goala de pe diagonala
		if tabla(i,i) == 0
			aux(1) = i;
			aux(2) = i;
		endif
		
		% Daca se indeplineste conditia, returneaza valorile celulei goale
		if s == argument
			mutare(1) = aux(1);
			mutare(2) = aux(2);
			if mutare(1) != 0 && mutare(2) != 0
				return
			endif
		endif
	endfor
	
	% Verificare diagonala secundara
	s = 0;
	aux(1) = 0;
	aux(2) = 0;
	for i = 1:3
		s = s + tabla(i,4-i);
		
		% Retine celula goala de pe diagonala
		if tabla(i,4-i) == 0
			aux(1) = i;
			aux(2) = 4-i;
		endif
		
		% Daca se indeplineste conditia, returneaza valorile celulei goale
		if s == argument
			mutare(1) = aux(1);
			mutare(2) = aux(2);
			if mutare(1) != 0 && mutare(2) != 0
				return
			endif
		endif
	endfor
	
endfunction