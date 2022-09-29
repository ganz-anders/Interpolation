%% 2. calculating distance and semivariance

distance_variance=zeros(sum(1:length(data)-1),2);
h=1;
for i=1:length(data)
  for j=i+1:length(data)
    distance_variance(h,1)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
    distance_variance(h,2)=(data(i,3)-data(j,3))^2;
    h=h+1;
  end
end

%distance_variance=tall(distance_variance);

%% 2.2 display semi-variogram
scatter(distance_variance(:,1),distance_variance(:,2)/2, '.')
title('(Semi-)Variogrammwolke')
ylabel('Abweichung');
xlabel('Abstand')