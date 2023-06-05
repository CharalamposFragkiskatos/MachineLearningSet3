%% 3.1
h = 0.0001;
xi = rand([1000 1]);
xar = [];
values = [];
for x = -0.5:0.001:1.5
    values(end+1) = f(x,h,xi);
    xar(end+1) = x;
end
plot(xar,values);
title('h = 0.0001')
% K = exp(-x*x/(2*h))/sqrt(2*pi*h);

%% 3.2
% 
 clear all;
 load('data32.mat');
 lamda = 2;
 h = 0.000005;
 y = ones(21*2,1);
 y(22:42) = -ones(21,1);
 x = ones(21*2,2);
 x(1:21,:)= stars(:,:);
 x(22:42,:)= circles(:,:);
 A = ones(42,42);
 for i = 1:42
     for j = 1:42
         A(i,j) = exp(-norm(x(i,:)-x(j,:))*norm(x(i,:)-x(j,:))/h);
     end
 end
 ab = (A'*A+lamda*A)\A*y;

 xs = [];
 ys = [];
 
 xs2 = [];
 ys2 = [];
 
 k = PHI([-1.05 -0.08],stars,circles,ab);
 if k>0
     state1 = 1;    
 else
     state1 = 0;
 end

 state2 = 0;

 for i = -1.05:0.01:1.1
     for j = -0.08:0.01:1.2
         k = PHI([i j],stars,circles,ab);
       if k>0
           xs(end+1) = i;
           ys(end+1) = j;
           
       else
          xs2(end+1) = i;
           ys2(end+1) = j;
       end

     end
 end
 
 hold on;
 scatter(xs,ys,'red');
 scatter(xs2,ys2,'yellow');
 scatter(stars(:,1),stars(:,2),'green','filled');
 scatter(circles(:,1),circles(:,2),'blue','filled');

 %% 3.3 a
 
 clear all;
 load('data33.mat');
 cluster1 = [];
 cluster2 = [];
 randomIndex = 67;
 cluster1(end+1) = randomIndex;
 max = 0;
 for i = 1:200
     if norm(X(:,i) - X(:,randomIndex))>max
         j = i;
         max = norm(X(:,i) - X(:,randomIndex));
     end
 end
 cluster2(end+1) = j;

 center1 = findCenter(cluster1,X);
 center2 = findCenter(cluster2,X);
 for i = 1:200
     if norm(X(:,i) - center1) > norm(X(:,i) - center2)
         cluster2 = add(cluster2,i); 
     else
         cluster1 = add(cluster1,i);
             
     end
  end


 flag = true;
 while (flag == true)
     flag = false;
     center1 = findCenter(cluster1,X);
     center2 = findCenter(cluster2,X);
     for i = 1:200
         if norm(X(:,i) - center1) > norm(X(:,i) - center2)
             flag = flag || exists(cluster1,i);
             cluster2 = add(cluster2,i);
             cluster1 = remove(cluster1,i);
         else
             flag = flag || exists(cluster2,i);
             cluster1 = add(cluster1,i);
             cluster2 = remove(cluster2,i);
         end
     end
 end
 % cluster1 gia ta 100 prwta
 % cluster2 gia ta 100 teleutaia
error1 = 0;
for i = 1:100
    if ~exists(cluster1,i)
        error1 = error1+1;
    end
end

error2 = 0;
for i = 101:200
    if ~exists(cluster2,i)
        error2 = error2+1;
    end
end
error = 0.5*(error1+error2)/100;

%% 3.3 b
clear all;
load('data33.mat');
Y = zeros(3,200);
for i = 1:200
    Y(1,i) = X(1,i);
    Y(2,i) = X(2,i);
    Y(3,i) = (X(1,i)*X(1,i) + X(2,i)*X(2,i));
end
cluster1 = [];
cluster2 = [];
randomIndex = 101;
cluster1(end+1) = randomIndex;
max = 0;
for i = 1:200
    if norm(Y(:,i) - Y(:,randomIndex))>max
        j = i;
        max = norm(Y(:,i) - Y(:,randomIndex));
    end
end
cluster2(end+1) = j;

center1 = findCenter(cluster1,Y);
center2 = findCenter(cluster2,Y);
for i = 1:200
    if norm(Y(:,i) - center1) > norm(Y(:,i) - center2)
        cluster2 = add(cluster2,i); 
    else
        cluster1 = add(cluster1,i);
             
    end
 end


flag = true;
while (flag == true)
    flag = false;
    center1 = findCenter(cluster1,Y);
    center2 = findCenter(cluster2,Y);
    for i = 1:200
        if norm(Y(:,i) - center1) > norm(Y(:,i) - center2)
            flag = flag || exists(cluster1,i);
            cluster2 = add(cluster2,i);
            cluster1 = remove(cluster1,i);
        else
            flag = flag || exists(cluster2,i);
            cluster1 = add(cluster1,i);
            cluster2 = remove(cluster2,i);
        end
    end
end
% cluster1 gia ta 100 prwta
% cluster2 gia ta 100 teleutaia
error1 = 0;
for i = 1:100
    if ~exists(cluster1,i)
        error1 = error1+1;
    end
end

error2 = 0;
for i = 101:200
    if ~exists(cluster2,i)
        error2 = error2+1;
    end
end
error = 0.5*(error1+error2)/100;

%% testing

predictedC1_x = [];
predictedC1_y = [];
for i = 1:length(cluster1)
    predictedC1_x(end+1) = X(1,cluster1(i));
    predictedC1_y(end+1) = X(2,cluster1(i));
end

predictedC2_x = [];
predictedC2_y = [];
for i = 1:length(cluster2)
    predictedC2_x(end+1) = X(1,cluster2(i));
    predictedC2_y(end+1) = X(2,cluster2(i));
end

hold on;
scatter(X(1,1:100),X(2,1:100),10,'red','filled');
scatter(X(1,101:200),X(2,101:200),10,'green','filled');

scatter(predictedC1_x,predictedC1_y,'red');
scatter(predictedC2_x,predictedC2_y,'green');

% figure;
% hold on;
% scatter3(Y(1,1:100),Y(2,1:100),Y(3,1:100),'red','filled');
% scatter3(Y(1,101:200),Y(2,101:200),Y(3,101:200),'green');