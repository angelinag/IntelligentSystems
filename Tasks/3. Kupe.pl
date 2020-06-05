:-initialization(myProgEntryPoint).

janr(astronomiq).
janr(poeziq).
janr(proza).
janr(piesa).

avtor(alekseev).
avtor(borisov).
avtor(konstantinov).
avtor(dmitriev).

putnikINegoviteKnigi(_ImeNaPutnika, _ChetenaKniga, _ZakupenaKniga, _NapisanaKniga).

razlichni(Y1,Y2,Y3,Y4) :-
    Y1\=Y2,
    Y2\=Y3,
    Y1\=Y3,
    Y1\=Y4,
    Y2\=Y4,
    Y3\=Y4.

check([]):-!.

check([putnikINegoviteKnigi(_, ChetenaKniga, ZakupenaKniga, NapisanaKniga)|T]):-
	!, not(ChetenaKniga = NapisanaKniga), not(ZakupenaKniga = NapisanaKniga), check(T).

solve(Solve):-
	Solve = [
	putnikINegoviteKnigi(AIme, AChetenaKniga, AZakupenaKniga, ANapisanaKniga),
	putnikINegoviteKnigi(BIme, BChetenaKniga, BZakupenaKniga, BNapisanaKniga),
	putnikINegoviteKnigi(CIme, CChetenaKniga, CZakupenaKniga, CNapisanaKniga),
	putnikINegoviteKnigi(DIme, DChetenaKniga, DZakupenaKniga, DNapisanaKniga)
	],
	
	razlichni(AIme, BIme, CIme, DIme),
	razlichni(ANapisanaKniga, BNapisanaKniga, CNapisanaKniga, DNapisanaKniga),
	razlichni(AZakupenaKniga, BZakupenaKniga, CZakupenaKniga, DZakupenaKniga),
	razlichni(AChetenaKniga, BChetenaKniga, CChetenaKniga, DChetenaKniga),

	avtor(AIme),
	avtor(BIme),
	avtor(CIme),
	avtor(DIme),

	janr(ANapisanaKniga),
	janr(BNapisanaKniga),
	janr(CNapisanaKniga),
	janr(DNapisanaKniga),
	
	janr(AZakupenaKniga),
	janr(BZakupenaKniga),
	janr(CZakupenaKniga),
	janr(DZakupenaKniga),
    
	janr(AChetenaKniga),
	janr(BChetenaKniga),
	janr(CChetenaKniga),
	janr(DChetenaKniga),

	member(putnikINegoviteKnigi(_, piesa, _, poeziq), Solve),
	
	not(member(putnikINegoviteKnigi(_, astronomiq, _, proza), Solve)),
	
	not(member(putnikINegoviteKnigi(_, _, astronomiq, proza), Solve)),
	
	check(Solve),
	
	member(putnikINegoviteKnigi(alekseev, AlekseevChetenaKniga, AlekseevZakupenaKniga, _), Solve),
	
	member(putnikINegoviteKnigi(borisov, AlekseevZakupenaKniga, AlekseevChetenaKniga, _), Solve),
	
	member(putnikINegoviteKnigi(dmitriev, _, _, DmitrievNapisanaKniga), Solve),
	
	member(putnikINegoviteKnigi(borisov, DmitrievNapisanaKniga, _, _), Solve).

myProgEntryPoint :- solve(X), X=[putnikINegoviteKnigi(alekseev,_,_,_), putnikINegoviteKnigi(borisov,_,_,_), putnikINegoviteKnigi(konstantinov,_,_,_), putnikINegoviteKnigi(dmitriev,_,_,_)].