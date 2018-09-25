function mutare = joc_mutareJucator(tabla)

    date_valide = false;
    while !date_valide
        mutareStr = input('Introduceti lin,col de forma L,C sau q=exit:  ','s');
		
		% Se verifica daca jucatorul doreste incheierea jocului
		if mutareStr == 'q'
			mutare = 'q';
			return
		endif
		
		% Se verifica daca caracterele sunt corecte
        mutare = regexp(mutareStr,'\d,\d','match');
        if isempty(mutare) || (length(mutare{1}) != length(mutareStr))
            disp('Trebuie sa fie numere intre 1-3 separate prin virgula')
        else
            mutare=regexp(mutare{1},',','split');
            mutare=[str2num(mutare{1}),str2num(mutare{2})];
			
			% Se verifica daca valorile introduse sunt intre 1 si 3
            if any(mutare < 1) || any(mutare > 3)
                disp('Valorile trebuie sa fie intre 1-3 separate prin virgula')
            elseif tabla(mutare(1),mutare(2)) != 0
                disp('Casuta este deja ocupata')
            else
                date_valide = true;
            endif
        endif
    endwhile
	
endfunction