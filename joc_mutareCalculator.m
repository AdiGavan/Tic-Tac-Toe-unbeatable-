function mutare = joc_mutareCalculator(tabla, alegere, tur)

	% Calculatorul muta primul
	if alegere == 'O'
		if tur == 1
		
			% Calculatorul pune in stanga sus
			if tabla(1,1) == 0	
				mutare(1) = 1;
				mutare(2) = 1;
			endif
		endif
	
		if tur == 2
		
			% Verifica daca jucatorul a pus pe mijloc
			if tabla(2,2) != 0 
			
				% Pune in coltul opus
				mutare(1) = 3; 
				mutare(2) = 3;
				
			% Verifica daca poate sa puna in colt dreapta sus
			elseif (tabla(1,2) == 0) && (tabla(1,3) == 0) 
				mutare(1) = 1;
				mutare(2) = 3;
			
			% Daca nu, pune in stanga jos
			else
				mutare(1) = 3;
				mutare(2) = 1;
			endif
		endif
		
		if tur == 3
		
			% Verifica daca poate castiga
			mutare = joc_verifica_posibilitate_victorie(tabla,2);
			if mutare(1) != 0
				return
			endif
			
			% Verifica daca trebuie sa blocheze victoria jucatorului
			mutare = joc_verifica_posibilitate_victorie(tabla,-2);
			if mutare(1) != 0
				return
			endif
			
			% Cauta colt favorabil
			if (tabla(3,3) == 0) && (tabla(2,3) == 0)
				mutare(1) = 3;
				mutare(2) = 3;
				return
			else 
				mutare(1) = 3;
				mutare(2) = 1;
				return
			endif
			
			% Daca nu se aplica cele de sus pune in prima casuta goala
			for i = 1:3
				for j = 1:3
					if tabla(i,j) == 0
						mutare(1) = i;
						mutare(2) = j;
						return
					endif
				endfor
			endfor	
		endif
		
		if tur > 3
		
			% Verifica daca poate castiga
			mutare = joc_verifica_posibilitate_victorie(tabla,2);
			if mutare(1) != 0
				return
			endif
			
			% Verifica daca trebuie sa blocheze jucator
			mutare = joc_verifica_posibilitate_victorie(tabla,-2);
			if mutare(1) != 0
				return
			endif
			
			% Daca nu se aplica cele de mai sus pune in prima casuta goala
			for i = 1:3
				for j = 1:3
					if tabla(i,j) == 0
						mutare(1) = i;
						mutare(2) = j;
						return
					endif
				endfor
			endfor	
		endif
	endif
	
	% Calculatorul muta al 2-lea
	if alegere == 'X'
		if tur == 1
		
			% Calculatorul incearca sa puna in centru
			if tabla(2,2) == 0 
				mutare(1) = 2;
				mutare(2) = 2;
			
			% Daca nu, pune in coltul din stanga sus
			else
				mutare(1) = 1; 
				mutare(2) = 1;
			endif
		endif
		
		
		if tur == 2
		
			% Verifica daca trebuie sa blocheze victoria jucatorului
			mutare = joc_verifica_posibilitate_victorie(tabla,2);
			if mutare(1) != 0
				return
			endif
			
			% Cazul cand este X in colt, O in centru si X in coltul pe diagonala
			if tabla(1,1) == 1 && tabla(2,2) == -1 && tabla(3,3) == 1
				mutare(1) = 1;
				mutare(2) = 2;
				return
			endif
			if tabla(1,3) == 1 && tabla(2,2) == -1 && tabla(3,1) == 1
				mutare(1) = 1;
				mutare(2) = 2;
				return
			endif
			
			% Cauta colt convenabil
			
			% Verifica colt stanga sus
			s = 0;
			if tabla(1,1) ==0
				for i=1:3
					s = s + tabla(1,i) + tabla(i,1);
				endfor
				if s == 2
					mutare(1) = 1;
					mutare(2) = 1;
					return
				endif
			endif
			
			% Verifica colt stanga jos
			s = 0;
			if tabla(3,1) ==0
				for i=1:3
					s = s + tabla(3,i) + tabla(i,1);
				endfor
				if s == 2
					mutare(1) = 3;
					mutare(2) = 1;
					return
				endif
			endif	
			
			% Verifica colt dreapta sus
			s = 0;
			if tabla(1,3) ==0
				for i=1:3
					s = s + tabla(1,i) + tabla(i,3);
				endfor
				if s == 2
					mutare(1) = 1;
					mutare(2) = 3;
					return
				endif
			endif
			
			% Verifica colt dreapta jos
			s = 0;
			if tabla(3,3) ==0
				for i=1:3
					s = s + tabla(3,i) + tabla(i,3);
				endfor
				if s == 2
					mutare(1) = 3;
					mutare(2) = 3;
					return
				endif
			endif	
			
			% Daca este X-O-X in centru pe oriz sau vert pune in colt stanga sus
			if tabla(1,2) == 1 && tabla(2,2) == -1 && tabla(3,2) == 1
				mutare(1) = 1;
				mutare(2) = 1;
				return
			endif
			if tabla(2,1) == 1 && tabla(2,2) == -1 && tabla(2,3) == 1
				mutare(1) = 1;
				mutare(2) = 1;
				return
			endif
			
			% Cand avem O - X - X pe diagonala principala
			if tabla(1,1) == -1 && tabla(2,2) == 1 && tabla(3,3) == 1
					mutare(1) = 1;
					mutare(2) = 3;
					return
			endif
			
			% Daca nu se aplica cele de mai sus pune in prima casuta goala
			
			for i = 1:3
				for j = 1:3
					if tabla(i,j) == 0
						mutare(1) = i;
						mutare(2) = j;
						return
					endif
				endfor
			endfor	
			
		endif
			
		if tur > 2
			
			% Se verifica daca calculatorul poate castiga
			mutare = joc_verifica_posibilitate_victorie(tabla,-2);
			if mutare(1) != 0
				return
			endif
			
			% Se verifica daca trebuie sa blocheze victoria jucatorului
			mutare = joc_verifica_posibilitate_victorie(tabla,2);
			if mutare(1) != 0
				return
			endif
			
			% Daca nu se aplica cele de mai sus pune in prima casuta goala
			for i = 1:3
				for j = 1:3
					if tabla(i,j) == 0
						mutare(1) = i;
						mutare(2) = j;
						return
					endif
				endfor
			endfor	
		endif
			
	endif
				
				
	
endfunction	
		