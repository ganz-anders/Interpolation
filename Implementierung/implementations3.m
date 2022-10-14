figure
p=plot(middleVariance(:,1),middleVariance(:,2),'o');
x=1:1.2*max(middleVariance(:,1));
title('Variogramm')
ylabel('Abweichung');
xlabel('Abstand')
%% modifiy A,B,C to fit
A=650;      %range
B=158;     %nugget
C=2800;      %sill
yexp=(B+(C-B)*(1-exp(-3*x/A)));
ygau=B+(C-B)*(1-exp(-3*(x.^2)/(A^2)));
%% Exponential
hold on
expPlot=plot(x,yexp);
hold off
linkdata on
%%
delete(expPlot);
%% Gaussian
hold on
gauPlot=plot(x,ygau,'-');
hold off
linkdata on
%delete(gauPlot);
%%
hold on
lineSill=line([0 max(middleVariance(:,1))],[C C],'LineStyle','--','Color','g');
lineRange=line([A A],[0 C],'LineStyle','--','Color','green');
lineNugget=line([0 A/2],[B B],'LineStyle','--','Color','green');
hold off
linkdata on
legend("Experimentelle Variogrammkurve", "Variogrammfunktion",'Location','southeast');
