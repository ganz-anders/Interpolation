%% gaining data

sz=100;
data=zeros(sz,3);
data(:,1:2)=rand(sz,2).*6-3;
data(:,3)=peaks(data(:,1),data(:,2));

data(:,1:2)=(data(:,1:2)+3)/6*49;

x=data(:,1);
y=data(:,2);
z=data(:,3);

%% displaying data points

% plot location of data points
%plot(x,y,'.');

% plot 3d location of data points
%plot3(x,y,z,'o');

% scatter plot of data points (color shows z value)
tiledlayout(1,2)
nexttile
surf(peaks)
nexttile
contour(peaks);
hold
tbl=array2table(data,"VariableNames",{'x','y','z'});
scatter(tbl,"x","y", 'filled', 'ColorVariable','z')
colorbar
hold
clear tbl

%% calculating distance and semivariance

distance_variance=zeros(sum(1:length(data)-1),2);

h=1;
for i=1:length(data)
  for j=i+1:length(data)
    distance_variance(h,1)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
    distance_variance(h,2)=(data(i,3)-data(j,3))^2;
    h=h+1;
  end
end

%% display semi-variogram
figure
plot(distance_variance(:,1),distance_variance(:,2)/2, '.')
title('(Semi-)Variogrammwolke')
ylabel('Abweichung');
xlabel('Abstand')