:-initialization(myProgEntryPoint).

kamuk(rubin).
kamuk(sapfir).
kamuk(perla).

kachestvo(mudrost).
kachestvo(zdrave).
kachestvo(blagopoluchie).

kamuk_na_meseca(septemvri, Y) :- not(Y=perla).
kamuk_na_meseca(septemvri, Y) :- not(Y=rubin).

znachenie_na_meseca(uni, Y) :- not(Y=mudrost).
znachenie_na_meseca(uni, Z) :- not(Z=blagopoluchie).
znachenie_na_meseca(uli, Z) :- not(Z=uni).
	
znachenie_na_kamuka(X,Y) :- X = rubin, not(Y=zdrave).

razlichni(Y1,Y2,Y3) :-
    Y1\=Y2,
    Y2\=Y3,
    Y1\=Y3.

nameri(
	Kamuk1, Mesec1, Znachenie1,
	Kamuk2, Mesec2, Znachenie2,
	Kamuk3, Mesec3, Znachenie3) :-
	
	Mesec1 = uni,
	Mesec2 = uli,
	Mesec3 = septemvri,
	
	kamuk(Kamuk1),
	kamuk(Kamuk2),
	kamuk(Kamuk3), 
	
	kachestvo(Znachenie1),
	kachestvo(Znachenie2),
	kachestvo(Znachenie3), 
	
    znachenie_na_kamuka(Kamuk1, Znachenie1),
	
    kamuk_na_meseca(Mesec3, Kamuk3),
	
    znachenie_na_meseca(Mesec1, Znachenie1),
    znachenie_na_meseca(Mesec2, Znachenie2),
	
    razlichni(Kamuk1, Kamuk2, Kamuk3),
    razlichni(Znachenie1, Znachenie2, Znachenie3).

myProgEntryPoint :- nameri(_Kamuk1,_Mesec1,_Znachenie1,_Kamuk2,_Mesec2,_Znachenie2,_Kamuk3,_Mesec3,_Znachenie3).