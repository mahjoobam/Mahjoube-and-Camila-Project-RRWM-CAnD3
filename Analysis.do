

cd "C:\Users\Mahjoob.Amani\Desktop\RRWM  Data Activity\camila"


*Recal the cleaned data
use "gss.dta"


*To install the estout package
ssc install estout, replace

* Survey weight
svyset [pw=wght_per]

*Generate a list of summary statistics for key variables
svy: proportion living_alone self_assessed_health female vis_minority edu_level

*/6.	Create logistic regression models */

*The relationship between living alone and good health

logistic self_assessed_health i.living_alone

*Store the model for later comparison table
est sto model1

*The relationship between living alone and good health and SESs
logistic self_assessed_health i.living_alone i.female i.vis_minority i.edu_level

*Store the model for later comparison table
est sto model2

*Comparison table for both the bivariate and multivariate models 
esttab model1 model2