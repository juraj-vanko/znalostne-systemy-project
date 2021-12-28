(deffacts pomocne_fakty
	(menu)
)

(defrule ukaz_menu
	?prec<-(menu)
=>
	(retract ?prec)
	(printout t "-----------<MENU>------------------------" crlf)
	(printout t "Zistite vas stav....................... A" crlf)	
	(printout t "Ukoncite program....................... B" crlf)
	(printout t "-----------------------------------------" crlf)
	(printout t "Ako si prajete pokracovat?: ")
	(assert (moja_volba (read)))
)

(defrule zistit_stav
	(moja_volba A)
=>
	(printout t "Zadajte Vas max_hr (Maximalny srdcovy tep):" crlf)
	(bind ?a (read))
	(assert (moj_max_hr ?a))

	(printout t "Zadajte pohlavie (muz=1 ,zena=0)" crlf)
	(bind ?a (read))
	(assert (moj_sex_f ?a))

	(printout t "Zadajte pohlavie (muz=0 ,zena=1)" crlf)
	(bind ?a (read))
	(assert (moj_sex_m ?a))

	(printout t "Zadajte vas cholesterol:" crlf)
	(bind ?a (read))
	(assert (moj_cholesterol ?a))

	(printout t "Zadajte vasu hladinu cukru na lacno:" crlf)
	(bind ?a (read))
	(assert (moj_fasting_bs ?a))

	(printout t "Zadajte vas vek:" crlf)
	(bind ?a (read))
	(assert (moj_age ?a))

	(printout t "--------------------------" crlf)
	(printout t "" crlf)
)

(defrule pravidlo1
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_fasting_bs ?c)
	(moj_age ?d)
	(test(<= ?a 132.5))
	(test(<= ?b 0.5))
	(test(<= ?c 0.5))
	(test(<= ?d 53.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo2
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_fasting_bs ?c)
	(moj_age ?d)
	(test(<= ?a 132.5))
	(test(<= ?b 0.5))
	(test(<= ?c 0.5))
	(test(> ?d 53.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo3
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_fasting_bs ?c)
	(moj_cholesterol ?d)
	(test(<= ?a 132.5))
	(test(<= ?b 0.5))
	(test(> ?c 0.5))
	(test(<= ?d 212.0))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo4
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_fasting_bs ?c)
	(moj_cholesterol ?d)
	(test(<= ?a 132.5))
	(test(<= ?b 0.5))
	(test(> ?c 0.5))
	(test(> ?d 212.0))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo4
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_fasting_bs ?c)
	(moj_cholesterol ?d)
	(test(<= ?a 132.5))
	(test(<= ?b 0.5))
	(test(> ?c 0.5))
	(test(> ?d 212.0))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo5
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_cholesterol ?c)
	(test(<= ?a 132.5))
	(test(> ?b 0.5))
	(test(<= ?c 74.5))
	(test(<= ?a 126.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo6
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_cholesterol ?c)
	(test(<= ?a 132.5))
	(test(> ?b 0.5))
	(test(<= ?c 74.5))
	(test(> ?a 126.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo7
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_cholesterol ?c)
	(test(<= ?a 132.5))
	(test(> ?b 0.5))
	(test(> ?c 74.5))
	(test(<= ?a 114.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo8
	(moj_max_hr ?a)
	(moj_sex_f ?b)
	(moj_cholesterol ?c)
	(test(<= ?a 132.5))
	(test(> ?b 0.5))
	(test(> ?c 74.5))
	(test(> ?a 114.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo9
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_fasting_bs ?c)
	(test(> ?a 132.5))
	(test(<= ?b 42.5))
	(test(<= ?c 0.5))
	(test(<= ?a 139))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo10
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_fasting_bs ?c)
	(test(> ?a 132.5))
	(test(<= ?b 42.5))
	(test(<= ?c 0.5))
	(test(> ?a 139))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo11
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_fasting_bs ?c)
	(moj_age ?d)
	(test(> ?a 132.5))
	(test(<= ?b 42.5))
	(test(> ?c 0.5))
	(test(<= ?d 62.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo12
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_fasting_bs ?c)
	(moj_age ?d)
	(test(> ?a 132.5))
	(test(<= ?b 42.5))
	(test(> ?c 0.5))
	(test(> ?d 62.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo13
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_age ?c)
	(moj_sex_m ?d)
	(test(> ?a 132.5))
	(test(> ?b 42.5))
	(test(<= ?c 56.5))
	(test(<= ?d 0.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo14
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_age ?c)
	(moj_sex_m ?d)
	(test(> ?a 132.5))
	(test(> ?b 42.5))
	(test(<= ?c 56.5))
	(test(> ?d 0.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule pravidlo15
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_age ?c)
	(test(> ?a 132.5))
	(test(> ?b 42.5))
	(test(> ?c 56.5))
	(test(<= ?b 344.5))
=>
	(printout t "Pravdepodobne ste v poriadku a nic vam nie je." crlf)
)

(defrule pravidlo16
	(moj_max_hr ?a)
	(moj_cholesterol ?b)
	(moj_age ?c)
	(test(> ?a 132.5))
	(test(> ?b 42.5))
	(test(> ?c 56.5))
	(test(> ?b 344.5))
=>
	(printout t "Pravdepodobne mate problem so srdcom a mate nejaku srdcovu chorobu." crlf)
)

(defrule delete
	(declare (salience -20))
	?prec1 <- (moja_volba ?a)
	?prec2 <- (moj_max_hr ?b)
	?prec3 <- (moj_sex_f ?c)
	?prec4 <- (moj_sex_m ?d)
	?prec5 <- (moj_cholesterol ?e)
	?prec6 <- (moj_fasting_bs ?f)
	?prec7 <- (moj_age ?g)
=>
	(retract ?prec1 ?prec2 ?prec3 ?prec4 ?prec5 ?prec6 ?prec7)
	(assert(menu))
)

(defrule koniec
	(moja_volba B)
	?prec10 <- (moja_volba ?x)
=>
	(retract ?prec10)
	(printout t "Program skoncil" crlf)
)