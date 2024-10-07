cd "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\camila"
import delimited "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\camila\gss-12M0025-E-2017-c-3 1_F1.csv"


* cleaning Dependent variable: the self-rated health variable
gen self_assessed_health = 1 if srh_110 == 1 | srh_110 == 2 | srh_110 == 3

replace self_assessed_health = 0 if self_assessed_health==.

label define health 0 "not_good_health" 1 "good_health"
label values self_assessed_health health


*Recoding The key independent variable is household size variable
tab hsdsizec
drop if hsdsizec==.
gen living_alone=1 if hsdsizec==1
replace living_alone=0 if living_alone !=1
label define living 1 "living alone" 0 "not living alone"
label values living_alone living

*Gender?


gen female = sex


*categorized into four age groups
gen agegrp = 0 if agegr10 < 5 
replace agegrp = 1 if agegr10 == 5 
replace agegrp = 2 if agegr10 == 6 
replace agegrp = 3 if agegr10 == 7 
label define agegrp 0 "54 and below" 1 "55 - 64" 2 "65 - 74" 3 "75+"
label values agegrp agegrp

* Creating Visible Minority Status Variable
gen vis_minority = 1 if vismin == 1
replace vis_minority = 0 if vismin == 2



* Creating Educational Attainment Variable
gen edu_level = 1 if ehg3_01b == 1   
replace edu_level = 2 if ehg3_01b == 2   
replace edu_level = 3 if ehg3_01b >= 3 & ehg3_01b <= 5   
replace edu_level = 4 if ehg3_01b >= 6 & ehg3_01b <= 7   

label define edu_level 1 "Less than HS" 2 "HS or equivalent" 3 "Trade/College/Non-Uni" 4 "University degree+"
label values edu_level edu_level

keep wght_per self_assessed_health living_alone female vis_minority edu_level

save "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\camila\Gss-clean.dta"

