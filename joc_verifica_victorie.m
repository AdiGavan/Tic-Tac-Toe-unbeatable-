function verdict = joc_verifica_victorie(tabla)
	
	% Se verifica pe fiecare linie, coloana sau diagonala daca exista
	% 3 X-uri sau 3 O-uri
	
	% Verificare linii
	for l=1:3
		s = 0;
		for c=1:3
			s = s + tabla(l,c);
			if s == 3 || s == -3
				verdict = s;
				return
			endif
		endfor
	endfor
	
	% Verificare coloane
	for c=1:3
		s = 0;
		for l=1:3
			s = s + tabla(l,c);
			if s == 3 || s == -3
				verdict = s;
				return
			endif
		endfor
	endfor
	
	% Verificare diagonala principala
	s = 0;
	for i = 1:3
		s = s + tabla(i,i);
		if s == 3 || s == -3
			verdict = s;
			return
		endif
	endfor
	
	% Verificare diagonala secundara
	s = 0;
	for i = 1:3
		s = s + tabla(i,4-i);
		if s == 3 || s == -3
			verdict = s;
			return
		endif
	endfor
	
	verdict = 0;
endfunction