%% 1. gaining data
%% 1.1 peaks+plane
n=100;
X=1:49;
Y=1:49;
[X,Y]=meshgrid(X,Y);
Plane=plane(X,Y);

data=zeros(n,3);
data(:,1:2)=rand(n,2).*6-3;
data(:,3)=peaks(data(:,1),data(:,2));
data(:,1:2)=(data(:,1:2)+3)/6*49;
data(:,3)=data(:,3)+plane(data(:,1),data(:,2));

%% 1.1.2 displaying data points
% scatter plot of data points (color shows z value)
tiledlayout(1,2)
nexttile
surf(peaks+Plane)
nexttile
contour(peaks+Plane);
hold on
scatter(data(:,1),data(:,2),10,data(:,3),"filled");
colorbar
hold off

clear tbl X Y Plane n i

%% images
% source image: https://de-de.topographic-map.com/pub/osm/relation/6pv/l7cn/thumbnail.jpg
myimage=imread("thumbnail.jpg");
% changing image to gray-skale
%myimage=im2gray(myimage);
% only selecting one channel
myimage=myimage(:,:,2);
sz=size(myimage);

n=100;
data=zeros(n,3);
data(:,1)=randi(sz(1),n,1);
data(:,2)=randi(sz(2),n,1);

for i=1:n
  data(i,3)=myimage(data(i,1), data(i,2));
end

%% 1.2.2 display data

% scatter plot of data points (color shows z value)
tiledlayout(1,2);
nexttile
scatter(data(:,1),data(:,2),10,data(:,3),"filled");
colorbar
colormap('gray')
nexttile
image(myimage)
clear tbl myimage i n

%% 1.3 Example from youtube
% (https://www.youtube.com/watch?v=zeqrjfOPosU)

data=zeros(7,3);

data(:,1)=[3 5 3 7 3 -6 -3];
data(:,2)=[7 6 3 2 -4 -5 -6];
data(:,3)=[1552 1542 1550 1538 775 490 500];

%% 1.3.2 displaying data points

% plot location of data points
%plot(data(:,1),data(:,2),'.');

% plot 3d location of data points
tiledlayout(2,1)
nexttile
plot3(data(:,1),data(:,2),data(:,3),'o');
grid

% scatter plot of data points (color shows z value)
nexttile
tbl=array2table(data,"VariableNames",{'x','y','z'});
scatter(tbl,"x","y", 'filled', 'ColorVariable','z')
colorbar
clear tbl