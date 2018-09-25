function [] = joc()

	% Scoar initial
	jucator = 0;
	calculator = 0;
	
	while 1
		tur = 0;
		clc
		% Afisare scor
		printf("Jucator %d - %d Calculator\n\n", jucator, calculator);
		while 1
			
			% Jucatorul alege cu ce vrea sa joace X/O sau sa iasa cu "q"
			alegere = input("Cu ce vreti sa jucati? X sau O (q = exit): ",'s');
			if (alegere == 'X') || (alegere == 'O') || (alegere == 'q')
				if (alegere == 'q')
					return
				endif
				
				% Se initializeaza tabla cu 0
				tabla = zeros(3);
				break
			else
				display("Alegere incorecta");
			endif
		endwhile
		
		while 1
			clc
			tur++;
			
			% If-ul cand jucatorul joaca cu "X"
			if (alegere == 'X')
			
				% Se afiseaza tabla si jucatorul alege mutarea
				joc_afisare(tabla);
				mutare = joc_mutareJucator(tabla);
				if mutare == 'q' 
					return
				endif
				
				% Se marcheaza mutarea pe tabla
				tabla(mutare(1),mutare(2)) = 1;
				
				% Se verifica daca partida s-a incheiat
				verdict = joc_verifica_victorie(tabla);
				if verdict == 3
					jucator = jucator + 1;
					display("Ai castigat!");
					joc_afisare(tabla);
					printf("\n");
					break
				endif
				
				% Cazul cand este remiza
				if verdict == 0 && tur == 5
					joc_afisare(tabla);
					display("Este remiza");
					break
				endif
				
				% Se determina mutarea calculatorului
				mutare = joc_mutareCalculator(tabla,alegere,tur);
				
				% Se marcheaza mutarea pe tabla
				tabla(mutare(1),mutare(2)) = -1;
				
				% Se verifica daca partida s-a incheiat
				verdict = joc_verifica_victorie(tabla);
				if verdict == -3
					calculator = calculator + 1;
					joc_afisare(tabla);
					display("Ai pierdut!");
					printf("\n");
					break
				endif
				
			% Cazul cand jucatorul alege sa joace cu "O"
			else
				
				% Se determina mutarea calculatorului
				mutare = joc_mutareCalculator(tabla,alegere,tur);
				
				% Se marcheaza mutarea pe tabla
				tabla(mutare(1),mutare(2)) = 1;
				joc_afisare(tabla);
				
				% Se verifica daca partida s-a incheiat
				verdict = joc_verifica_victorie(tabla);
				if verdict == 3
					calculator = calculator + 1;
					display("Ai pierdut!");
					printf("\n");
					break
				endif
				
				% Cazul cand este remiza
				if verdict == 0 && tur == 5
					display("Este remiza");
					break
				endif
				
				% Jucatorul efectueaza mutarea
				mutare = joc_mutareJucator(tabla);
				if mutare == 'q'
					return
				endif
				
				% Se marcheaza mutarea pe tabla
				tabla(mutare(1),mutare(2)) = -1;
				
				% Se verifica daca partida s-a incheiat
				verdict = joc_verifica_victorie(tabla);
				if verdict == -3
					jucator = jucator + 1;
					display("Ai castigat");
					joc_afisare(tabla);
					printf("\n");
					break
				endif
			endif
			if mutare == 'q'
				return
			endif
		endwhile
	endwhile
	
endfunction