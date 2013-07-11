/* Statistques descriptives et graphes pour le papier (23/05/2011) */

/* Poultry  */

*cd D:\progs\EPI\Frontiers\Efficacite\Data151C\
cd C:\Chris\progs\EPI\Frontiers\Efficacite\Data151C\
use DataComp.dta, clear
gen YsurK= Y/K
gen YsurL= Y/L
gen YsurM= Y/M

/* Table  1 of the paper */
drop if an1x!=2006

latabstat Y* , statistics( mean sd min p25 p75 max N) f(%9.2f) columns(statistics) ///
tf(GraphBench\DescY2006-151C) clabel(Stats) caption((Poultry industry in 2006))   replace

/* Get the efficiency for 2006  */
use ScoresYearFYearBenComp.dta, clear
drop if an1x!=2006

/* -- Table 2 of the paper -- */
latabstat Score , statistics(mean sd min  P25 p50 P75) f(%9.2f) columns(statistics) ///
tf(GraphBench\Score2006-151C) clabel(Scores2006-151c) caption((Distribution of efficiency scores in 2006 (poultry industry)))  replace


/* Figures 5 */
graph drop _all

use Malmquist1996-2000.dta, clear
capture ren id ident
sort ident
save Malmquist1996-2000.dta, replace

use DataComp.dta, clear
drop if an1x!=2000
sort ident
merge 1:1 ident using Malmquist1996-2000.dta

label var Y "Output (quantity index) - Poultry 2000"
label var pure_eff "Pure efficiency"
label var scale "Scale efficiency"
label var pure_tech "Pure Technical change"
label var scale_tech "Scale Technical change"

twoway scatter  pure_eff Y, name(pureeff)
twoway scatter  scale  Y, name(scaleeff)
twoway scatter   pure_tech  Y, name(puretech)
twoway scatter  scale_tech  Y, name(scaletech)

graph combine pureeff scaleeff puretech scaletech

graph export GraphBench\Malmdec151C1996-2000.eps, as(eps) replace   				
!epstopdf GraphBench\Malmdec151C1996-2000.eps
	
graph drop _all

/* Version Juin 2011: 1 seul graphique */
twoway (scatter   pure_tech  Y if Y < 150000, ///
yscale(range(.5 1.5)) ylabel(0.5(0.5)1.5) ///
yline(1)), name(pure1996)

graph export GraphBench\PureTech151C1996-2000.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech151C1996-2000.eps



/* et sur 2000-2006  */

use Malmquist2000-2006.dta, clear
capture ren id ident
sort ident
save Malmquist2000-2006.dta, replace

use DataComp.dta, clear
drop if an1x!=2006    /* <--Y est pris en 2006 */
sort ident
merge 1:1 ident using Malmquist2000-2006.dta

label var Y "Output (quantity index) - Poultry 2006"
label var pure_eff "Pure efficiency"
label var scale "Scale efficiency"
label var pure_tech "Pure Technical change"
label var scale_tech "Scale Technical change"

twoway scatter  pure_eff Y, name(pureeff)
twoway scatter  scale  Y, name(scaleeff)
twoway scatter   pure_tech  Y, name(puretech)
twoway scatter  scale_tech  Y, name(scaletech)

graph combine pureeff scaleeff puretech scaletech

graph export GraphBench\Malmdec151C2000-2006.eps, as(eps) replace   				
!epstopdf GraphBench\Malmdec151C2000-2006.eps
	


/* Version Juin 2011: 1 seul graphique */
twoway (scatter   pure_tech  Y if Y < 150000, ///
yscale(range(0.5 1.5)) ylabel(0.5(0.5)1.5) ///
yline(1)), name(pure2000)

graph export GraphBench\PureTech151C2000-2006.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech151C2000-2006.eps

/* Version Juin 2011*/
graph combine pure1996 pure2000

graph export GraphBench\PureTech151C1996-2000-2006.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech151C1996-2000-2006.eps

/* Cheese  */

*cd D:\progs\EPI\Frontiers\Efficacite\Data155C\
cd C:\Chris\progs\EPI\Frontiers\Efficacite\Data155C\

use DataComp.dta, clear
gen YsurK= Y/K
gen YsurL= Y/L
gen YsurM= Y/M

/* Table  1 of the paper */
drop if an1x!=2006

latabstat Y* , statistics( mean sd min p25 p75 max N) f(%9.2f) columns(statistics) ///
tf(GraphBench\DescY2006-155C) clabel(Stats) caption((Cheese industry in 2006))   replace

/* Get the efficiency for 2006  */
use ScoresYearFYearBenComp.dta, clear
drop if an1x!=2006

/* -- Table 2 of the paper -- */
latabstat Score , statistics(mean sd min  P25 p50 P75) f(%9.2f) columns(statistics) ///
tf(GraphBench\Score2006-155C) clabel(Scores2006-155c) caption((Distribution of efficiency scores in 2006 (Cheese industry)))  replace

/* Figures 5 */
graph drop _all

use Malmquist1996-1998.dta, clear
capture ren id ident
sort ident
save Malmquist1996-1998.dta, replace

use DataComp.dta, clear
drop if an1x!=1998 /* <--Y est pris en 1998 */
sort ident
merge 1:1 ident using Malmquist1996-1998.dta

label var Y "Output (quantity index) -Cheese - 1998"
label var pure_eff "Pure efficiency"
label var scale "Scale efficiency"
label var pure_tech "Pure Technical change"
label var scale_tech "Scale Technical change"

*twoway scatter  pure_eff Y, name(pureeff)
*twoway scatter  scale  Y, name(scaleeff)
*twoway scatter   pure_tech  Y, name(puretech)
*twoway scatter  scale_tech  Y, name(scaletech)

*graph combine pureeff scaleeff puretech scaletech

*graph export GraphBench\Malmdec155C1996-1998.eps, as(eps) replace   				
*!epstopdf GraphBench\Malmdec155C1996-1998.eps
	
graph drop _all


/* Version Juin 2011: 1 seul graphique */
twoway (scatter   pure_tech  Y if Y < 200000, ///
yscale(range(0.7 1.3)) ylabel(0.7(0.1)1.3) ///
yline(1)), name(pure1996)

graph export GraphBench\PureTech155C1996-1998.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech155C1996-1998.eps


/* et sur 1998-2006  */

use Malmquist1998-2006.dta, clear
capture ren id ident
sort ident
save Malmquist1998-2006.dta, replace

use DataComp.dta, clear
drop if an1x!=2006    /* <--Y est pris en 2006 */
sort ident
merge 1:1 ident using Malmquist1998-2006.dta

label var Y "Output (quantity index) - Cheese - 2006"
label var pure_eff "Pure efficiency"
label var scale "Scale efficiency"
label var pure_tech "Pure Technical change"
label var scale_tech "Scale Technical change"

*twoway scatter  pure_eff Y, name(pureeff)
*twoway scatter  scale  Y, name(scaleeff)
*twoway scatter   pure_tech  Y, name(puretech)
*twoway scatter  scale_tech  Y, name(scaletech)

*graph combine pureeff scaleeff puretech scaletech

*graph export GraphBench\Malmdec155C2000-2006.eps, as(eps) replace   				
*!epstopdf GraphBench\Malmdec155C2000-2006.eps
	

/* Version Juin 2011: 1 seul graphique */
twoway (scatter   pure_tech  Y if Y < 200000 & pure_tech <1.5, ///
yscale(range(0.7 1.3)) ylabel(0.7(0.1)1.3) ///
yline(1)), name(pure1998)

graph export GraphBench\PureTech155C1998-2006.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech155C1998-2006.eps

/* Version Juin 2011*/
graph combine pure1996 pure1998

graph export GraphBench\PureTech155C1996-1998-2006.eps, as(eps) replace   				
!epstopdf GraphBench\PureTech155C1996-1998-2006.eps

graph drop _all



	
