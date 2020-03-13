clc
clear
close all

subnum = 8;

n = 1;
for i=1:subnum
    if i ~= 5
        clear Table Map
        filename = ['C:\Users\fzahedi1admin\OneDrive - Arizona State University\Projects\Damping Map\Experiments\Test\Bisec\Data\Subject',num2str(i),'\Table_S',num2str(i),'.mat'];
        load(filename);
        filename = ['C:\Users\fzahedi1admin\OneDrive - Arizona State University\Projects\Damping Map\Experiments\Test\Bisec\Data\Subject',num2str(i),'\Map_S',num2str(i),'.mat'];
        load(filename);
        Tablegroup(:,:,n) = Table;
        n = n + 1;
    end
end


for j=1:size(Tablegroup,3)
    damping_lowerbound(j,:) = Tablegroup(:,1,j)';
    convergencerate(j,:) = Tablegroup(:,4,j)';
end

AverageTable(:,1) = (round(mean(damping_lowerbound,1)*100,0)/100)';
AverageTable(:,2) = (round(std(damping_lowerbound,1)*100,0)/100)';
AverageTable(:,3) = Tablegroup(:,2,1);
AverageTable(:,4) = Tablegroup(:,3,1);
AverageTable(:,5) = ceil(mean(convergencerate,1))';
AverageTable(:,6) = ceil(std(convergencerate))';

n=1;
figure
for i=0:size(AverageTable,1)/2-1
    j=AverageTable(n+i,3);
    if j==0
        x(j+1) = 0;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==1
        x(j+1) = -0.06;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==2
        x(j+1) = 0;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==3
        x(j+1) = 0.06;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==4
        x(j+1) = 0.06;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==5
        x(j+1) = 0.06;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==6
        x(j+1) = 0;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==7
        x(j+1) = -0.06;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==8
        x(j+1) = -0.06;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==9
        x(j+1) = 0;
        y(j+1) = 0;
        z(j+1) = 0.1;
    elseif j==10
        x(j+1) = 0.04;
        y(j+1) = 0.04;
        z(j+1) = 0.1;
    elseif j==11
        x(j+1) = 0.04;
        y(j+1) = -0.04;
        z(j+1) = 0.1;
    elseif j==12
        x(j+1) = -0.04;
        y(j+1) = -0.04;
        z(j+1) = 0.1;
    elseif j==13
        x(j+1) = -0.04;
        y(j+1) = 0.04;
        z(j+1) = 0.1;
    end
figure(1)
plot3(x(j+1), y(j+1), z(j+1), '.','color',[0.7 0.7 0.7], 'MarkerSize',45);
hold on
line([x(j+1)-0.009,x(j+1)+0.009],[y(j+1),y(j+1)],[z(j+1),z(j+1)],'color','k');
line([x(j+1),x(j+1)],[y(j+1)-0.009,y(j+1)+0.009],[z(j+1),z(j+1)],'color','k');
text(x(j+1)-0.007,y(j+1)+0.015,z(j+1),[num2str(AverageTable(n+j,1)),'\pm',num2str(AverageTable(n+j,2))]);
text(x(j+1)+0.011,y(j+1)+0.0015,z(j+1),[num2str(AverageTable(n+j+1,1)),'\pm',num2str(AverageTable(n+j,2))]);

if i < 9
    figure(2)
    plot(x(j+1), y(j+1), '.','color',[0.7 0.7 0.7], 'MarkerSize',45);
    hold on
    line([x(j+1)-0.009,x(j+1)+0.009],[y(j+1),y(j+1)],'color','k');
    line([x(j+1),x(j+1)],[y(j+1)-0.009,y(j+1)+0.009],'color','k');
    text(x(j+1)-0.007,y(j+1)+0.015,[num2str(AverageTable(n+j,1)),'\pm',num2str(AverageTable(n+j,2))]);
    text(x(j+1)+0.011,y(j+1)+0.0015,[num2str(AverageTable(n+j+1,1)),'\pm',num2str(AverageTable(n+j,2))]);
else
    figure(3)
    plot(x(j+1), y(j+1), '.','color',[0.7 0.7 0.7], 'MarkerSize',45);
    hold on
    line([x(j+1)-0.009,x(j+1)+0.009],[y(j+1),y(j+1)],'color','k');
    line([x(j+1),x(j+1)],[y(j+1)-0.009,y(j+1)+0.009],'color','k');
    text(x(j+1)-0.007,y(j+1)+0.015,[num2str(AverageTable(n+j,1)),'\pm',num2str(AverageTable(n+j,2))]);
    text(x(j+1)+0.011,y(j+1)+0.0015,[num2str(AverageTable(n+j+1,1)),'\pm',num2str(AverageTable(n+j,2))]);
end
n=n+1;
end
figure(1)
axis([-0.13 0.13 -0.13 0.13]);
xs=[-0.12 0.12 0.12 -0.12 -0.12];
ys=[0.12 0.12 -0.12 -0.12 0.12];
zs=[0 0 0 0 0];
plot3(xs,ys,zs,'k-.');
xs2=[-0.08 0.08 0.08 -0.08 -0.08];
ys2=[0.08 0.08 -0.08 -0.08 0.08];
zs2=[0.1 0.1 0.1 0.1 0.1];
plot3(xs2,ys2,zs2,'k-.');
box off
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');

figure(2)
axis([-0.13 0.13 -0.13 0.13]);
xs=[-0.12 0.12 0.12 -0.12 -0.12];
ys=[0.12 0.12 -0.12 -0.12 0.12];
plot(xs,ys,'k-.');
box off
xlabel('x (m)');
ylabel('y (m)');

figure(3)
axis([-0.13 0.13 -0.13 0.13]);
xs2=[-0.08 0.08 0.08 -0.08 -0.08];
ys2=[0.08 0.08 -0.08 -0.08 0.08];
plot(xs2,ys2,'k-.');
box off
xlabel('x (m)');
ylabel('y (m)');

%%

% for one layer

clc
clear
close all

subnum = 10;

for i=1:subnum
    clear Table Map
    filename = ['C:\Users\Default.ASUS\OneDrive - Arizona State University\Projects\Damping Map\Experiments\Test\Bisec\Data\Subject',num2str(i),'\Table_S',num2str(i),'.mat'];
    load(filename);
    filename = ['C:\Users\Default.ASUS\OneDrive - Arizona State University\Projects\Damping Map\Experiments\Test\Bisec\Data\Subject',num2str(i),'\Map_S',num2str(i),'.mat'];
    load(filename);
    Tablegroup(:,:,i) = Table(1:18,:);
end

for j=1:subnum
    damping_lowerbound(j,:) = Tablegroup(:,1,j)';
    convergencerate(j,:) = Tablegroup(:,4,j)';
end

AverageTable(:,1) = (round(mean(damping_lowerbound,1)*100,0)/100)';
AverageTable(:,2) = (round(std(damping_lowerbound,1)*100,0)/100)';
AverageTable(:,3) = Tablegroup(:,2,1);
AverageTable(:,4) = Tablegroup(:,3,1);
AverageTable(:,5) = ceil(mean(convergencerate,1))';
AverageTable(:,6) = ceil(std(convergencerate))';

n=1;

for i=0:size(AverageTable,1)/2-1
    j=AverageTable(n+i,3);
    if j==0
        x(j+1) = 0;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==1
        x(j+1) = -0.06;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==2
        x(j+1) = 0;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==3
        x(j+1) = 0.06;
        y(j+1) = 0.06;
        z(j+1) = 0;
    elseif j==4
        x(j+1) = 0.06;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==5
        x(j+1) = 0.06;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==6
        x(j+1) = 0;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==7
        x(j+1) = -0.06;
        y(j+1) = -0.06;
        z(j+1) = 0;
    elseif j==8
        x(j+1) = -0.06;
        y(j+1) = 0;
        z(j+1) = 0;
    elseif j==9
        x(j+1) = 0;
        y(j+1) = 0;
        z(j+1) = 0.1;
    elseif j==10
        x(j+1) = 0.04;
        y(j+1) = 0.04;
        z(j+1) = 0.1;
    elseif j==11
        x(j+1) = 0.04;
        y(j+1) = -0.04;
        z(j+1) = 0.1;
    elseif j==12
        x(j+1) = -0.04;
        y(j+1) = -0.04;
        z(j+1) = 0.1;
    elseif j==13
        x(j+1) = -0.04;
        y(j+1) = 0.04;
        z(j+1) = 0.1;
    end
    figure(1)
    plot(x(j+1), y(j+1), '.','color',[0.7 0.7 0.7], 'MarkerSize',45);
    hold on
    line([x(j+1)-0.009,x(j+1)+0.009],[y(j+1),y(j+1)],'color','k');
    line([x(j+1),x(j+1)],[y(j+1)-0.009,y(j+1)+0.009],'color','k');
    text(x(j+1)-0.007,y(j+1)+0.015,[num2str(AverageTable(n+j,1)),'\pm',num2str(AverageTable(n+j,2))]);
    text(x(j+1)+0.011,y(j+1)+0.0015,[num2str(AverageTable(n+j+1,1)),'\pm',num2str(AverageTable(n+j,2))]);

    n=n+1;
end


figure(1)
axis([-0.13 0.13 -0.13 0.13]);
xs=[-0.12 0.12 0.12 -0.12 -0.12];
ys=[0.12 0.12 -0.12 -0.12 0.12];
plot(xs,ys,'k-.');
box off
xlabel('x (m)');
ylabel('y (m)');
%--------------------------------------------------------

[Xmesh,Ymesh]=meshgrid([-0.06 0 0.06],[-0.06 0 0.06]);

for i=1:2:size(AverageTable,1)
    if AverageTable(i,3) == 0
        n = 5;
    elseif AverageTable(i,3) == 1
        n = 1;
    elseif AverageTable(i,3) == 2
        n = 2;
    elseif AverageTable(i,3) == 3
        n = 3;
    elseif AverageTable(i,3) == 4
        n = 6;
    elseif AverageTable(i,3) == 5
        n = 9;
    elseif AverageTable(i,3) == 6
        n = 8;
    elseif AverageTable(i,3) == 7
        n = 7;
    elseif AverageTable(i,3) == 8
        n = 4;
    end
    APlowerdamp(n) = AverageTable(i,1);
end
Zmesh = reshape(APlowerdamp,[3, 3]);
figure
surf(Xmesh,Ymesh,Zmesh')
view(3)
colormap gray
colorbar

% figure
% h = heatmap([1 2 3], [1 2 3], Zmesh');
% colormap cool
% h.Title = 'lowerdamping in AP direction';
% h.XLabel = 'x';
% h.YLabel = 'y';
figure
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,Zmesh')
colormap gray
colorbar
set(gca,'YDir','normal')
xlabel('x (m)')
ylabel('y (m)')
title('Lowerdamping in AP direction')

[Xmesh,Ymesh]=meshgrid([-0.06 0 0.06],[-0.06 0 0.06]);

for i=2:2:size(AverageTable,1)
    if AverageTable(i,3) == 0
        n = 5;
    elseif AverageTable(i,3) == 1
        n = 1;
    elseif AverageTable(i,3) == 2
        n = 2;
    elseif AverageTable(i,3) == 3
        n = 3;
    elseif AverageTable(i,3) == 4
        n = 6;
    elseif AverageTable(i,3) == 5
        n = 9;
    elseif AverageTable(i,3) == 6
        n = 8;
    elseif AverageTable(i,3) == 7
        n = 7;
    elseif AverageTable(i,3) == 8
        n = 4;
    end
    MLlowerdamp(n) = AverageTable(i,1);
end
ZmeshML = reshape(MLlowerdamp,[3, 3]);
figure
surf(Xmesh,Ymesh,ZmeshML')
view(3)
colormap gray
colorbar

figure
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,ZmeshML')
colormap gray
colorbar
set(gca,'YDir','normal')
xlabel('x (m)')
ylabel('y (m)')
title('Lowerdamping in ML direction')

Zmesh=Zmesh';
Zmeshnew = [Zmesh(:,1) Zmesh Zmesh(:,3)];
Zmeshnew = [Zmeshnew(1,:); Zmeshnew; Zmeshnew(3,:)];
[Xmeshnew,Ymeshnew]=meshgrid([-0.06 -0.03 0 0.03 0.06],[0.06 0.03 0 -0.03 -0.06]);
figure
surf(Xmeshnew,Ymeshnew,Zmeshnew)
colormap gray
colorbar
xlabel('x (m)')
ylabel('y (m)')
zlabel('Lowerdamping')
title('AP direction')

ZmeshML=ZmeshML';
ZmeshnewML = [ZmeshML(:,1) ZmeshML ZmeshML(:,3)];
ZmeshnewML = [ZmeshnewML(1,:); ZmeshnewML; ZmeshnewML(3,:)];
[XmeshnewML,YmeshnewML]=meshgrid([-0.06 -0.03 0 0.03 0.06],[0.06 0.03 0 -0.03 -0.06]);
figure
surf(XmeshnewML,YmeshnewML,ZmeshnewML)
colormap gray
colorbar
xlabel('x (m)')
ylabel('y (m)')
zlabel('Lowerdamping')
title('ML direction')

figure
subplot(2,1,1)
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,Zmesh')
colormap gray
colorbar
set(gca,'YDir','normal')
ylabel('y (m)')
title('Lowerdamping in AP direction')

subplot(2,1,2)
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,ZmeshML')
colormap gray
colorbar
set(gca,'YDir','normal')
xlabel('x (m)')
ylabel('y (m)')
title('Lowerdamping in ML direction')

%%
figure

[ha, pos] = tight_subplot(2,1,[.1 .1],[.1 .1],[.1 .05])
axes(ha(1))
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,Zmesh')
colormap gray
colorbar
set(gca,'YDir','normal')
ylabel('y (m)')
title('Lower viscousity in AP direction')

axes(ha(2))
y = [0.04 -0.04];
x = [-0.04 0.04];
imagesc(x,y,ZmeshML')
colormap gray
colorbar
set(gca,'YDir','normal')
xlabel('x (m)')
ylabel('y (m)')
title('Lower viscousity in ML direction')
