function [] = joc_afisare(tabla)
 
	% Pentru fiecare linie si coloana, afisez 'X' daca valoarea este 1
	% 'O' daca valoarea este -1
	% '_' daca valoarea este egala cu 0

	for i=1:3
		for j=1:3
			fprintf('|')
			if tabla(i,j)==1
				fprintf('X')
			elseif tabla(i,j)==-1
				fprintf('O')
			else
				fprintf('_')
			endif
		endfor
		fprintf('|\n')
	endfor

endfunction