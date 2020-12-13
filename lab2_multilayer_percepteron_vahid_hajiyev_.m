% Vahid Hajiyev laboratory work 2- multilayer percepteron

x = 0.1:1/22:1; % x have 20 input parameters
learning_rate=0.2;
%giving random parameters to weights
w1_first=randn(1);
w2_first=randn(1);
w3_first=randn(1);
w4_first=randn(1);

w1_second=randn(1);
w2_second=randn(1);
w3_second=randn(1);
w4_second=randn(1);

%giving random parameters to bias
bias1=randn(1);
bias2=randn(1);
bias3=randn(1);
bias4=randn(1);

BIAS=randn(1);

%-----------------------------------------------------------
%OUR RESULT - DESIRED OUTPUT
desired_output=(1+0.6*sin(2*pi*x/0.7)+0.3*sin(2*pi*x))/2;



%training section
for z=1:1200000
for j=1:20
v1_first=x(j)*w1_first+bias1;
y1=1/(1+exp((-1)*v1_first));
      
v2_first=x(j)*w2_first+bias2;
y2=1/(1+exp((-1)*v2_first));

v3_first=x(j)*w3_first+bias3;
y3=1/(1+exp((-1)*v3_first));
    
v4_first=x(j)*w4_first+bias4;
y4=1/(1+exp((-1)*v4_first));
    
v(j)=y1*w1_second+y2*w2_second+y3*w3_second+y4*w4_second+BIAS;
    
error(j)=desired_output(j)-v(j);
    
  
    %weight update
w1_second=w1_second+learning_rate*y1*error(j);
w2_second=w2_second+learning_rate*y2*error(j);
w3_second=w3_second+learning_rate*y3*error(j);
w4_second=w4_second+learning_rate*y4*error(j);
    
      %bias update
BIAS=BIAS+learning_rate*error(j);
   
   
w1_first=w1_first+error(j)*learning_rate*y1*(1-y1)*w1_second*x(j);
w2_first=w2_first+error(j)*learning_rate*y2*(1-y2)*w2_second*x(j);
w3_first=w3_first+error(j)*learning_rate*y3*(1-y3)*w3_second*x(j);
w4_first=w4_first+error(j)*learning_rate*y4*(1-y4)*w4_second*x(j);
   
   
    %bias update
bias1=bias1+error(j)*learning_rate*y1*(1-y1)*w1_second;
bias2=bias2+error(j)*learning_rate*y2*(1-y2)*w2_second;
bias3=bias3+error(j)*learning_rate*y3*(1-y3)*w3_second;
bias4=bias4+error(j)*learning_rate*y4*(1-y4)*w4_second;
      
end
end
    


loop1=0.1:1/99:1; %because our vectors must be in the same length for plotting graphs
for r=1:90
v1_first=loop1(r)*w1_first+bias1;
y1=1/(1+exp((-1)*v1_first));
    
   
v2_first=loop1(r)*w2_first+bias2;
y2=1/(1+exp((-1)*v2_first));
   
v3_first=loop1(r)*w3_first+bias3;
y3=1/(1+exp((-1)*v3_first));
   
v4_first=loop1(r)*w4_first+bias4;
y4=1/(1+exp((-1)*v4_first));
    
v(r)=y1*w1_second+y2*w2_second+y3*w3_second+y4*w4_second+BIAS;
end

plot(x,desired_output,loop1,v); %plotting graphs for comparing results

   
