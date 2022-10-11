%% 2. calculating distance and variance

clear distance_variance sum 
distance_variance=zeros(sum(1:length(data)-1),2);
h=1;
for i=1:length(data)
  for j=i+1:length(data)
    distance_variance(h,1)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
    distance_variance(h,2)=(data(i,3)-data(j,3))^2;
    h=h+1;
  end
end

clear h i j

%% 2.2 display variogram
figure
scatter(distance_variance(:,1),distance_variance(:,2)/2, '.')
title('(Semi-)Variogrammwolke')
ylabel('Abweichung');
xlabel('Abstand')

%% calculating the middle variance
steps=50;
singleStep=max(distance_variance(:,1))/steps;
middleVariance=zeros(ceil(steps),2);
middleVariance(:,1)=(1:ceil(steps))'*singleStep;

for i=1:steps
  b=(distance_variance(:,1)<i*singleStep);
  middleVariance(i,2)=dot(b,distance_variance(:,2))/sum(b);
end

clear b i 

scatter(distance_variance(:,1),distance_variance(:,2)/2, '.')
title('(Semi-)Variogramm')
ylabel('Abweichung');
xlabel('Abstand')
hold on
p=plot(middleVariance(:,1),middleVariance(:,2)/2,'-x');
hold off
