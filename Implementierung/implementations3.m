figure
p=plot(middleVariance(:,1),middleVariance(:,2),'-x');
x=1:1.2*max(middleVariance(:,1));
title('Variogramm')
ylabel('Abweichung');
xlabel('Abstand')
%% modifiy A,B,C to fit
A=48;      %range
B=0.5;     %nugget
C=50;      %sill
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
gauPlot=plot(x,ygau);
lineSill=line([0 max(middleVariance(:,1))],[C C],'Color','g');
lineRange=line([A A],[0 C],'Color','g');
lineNugget=line([0 A/2],[B B],'Color','green');
hold off
linkdata on%%
delete(gauPlot);
