%% gaining data
data=zeros(100,3);
data(:,1:2)=rand(100,2).*6-3;
data(:,3)=peaks(data(:,1),data(:,2));

data(:,1:2)=(data(:,1:2)+3)/6*49;

x=data(:,1);
y=data(:,2);
z=data(:,3);

%% plot location of data points
%plot(x,y,'.');

%% plot 3d location of data points
%plot3(x,y,z,'o');

%% scatter plot of data points (color shows z value)
tiledlayout(1,2)
nexttile
surf(peaks)
nexttile
contour(peaks);
hold
tbl=array2table(data,"VariableNames",{'x','y','z'});
scatter(tbl,"x","y", 'filled', 'ColorVariable','z')
colorbar
clear tbl

%% 

