%%%%%%%%%%%%%%%% Эͬ����Ⱥ�㷨 %%%%%%%%%%%%%%%%
%�ص㣺�����ٶȽ���,����������ٶȿ�
%˼·��������Ⱥ��ֳ����ɸ���Ⱥ,����ʱ�ֱ�����Լ���Ⱥ�ĵ�ǰ����Ⱥ��subpop*,��¼��ǰ��Ⱥ����������xmin*,��������Ⱥ�ĸ��½��ƴ����
%�������⣺
%2)���ֵ���ȶ�
%3)���ֵ�����Ⱥ�ظ��������,д��ѭ���ҿ��Խ�����������Ⱥ������
%4)�㷨�ڲ�����c1/c2/a��Ӱ�죿
%5)����������r�����壿���Ӷ�����,���ή���������ʣ�
%6)�����㷨��������/��������/��������/����ʱ��ȵ�����
%7)find�����Ľ���

function [opsch,opx,opy,optimy]=CPSOjobshop_5Group(gennum,psize,w,C1,C2,jnum,mnum) 
n=mnum*jnum; 
current_gen=1; 

%%%%%%%%%%%%%%%%% ��ʼ�� %%%%%%%%%%%%%%%%%%%
newgen=zeros(psize,n+1); 
pop=zeros(psize,n); 
A=zeros(psize,n/5);%ȫ������������Ⱥ 
vel=zeros(psize,n/5); 
optimy=ones(1,gennum); 
newgen(1:psize,1:n)=rand(psize,n); %��newgen�����ǰn�г�ʼ�������
%ÿ����Ⱥ����µ��Ӳ���
subpop1=zeros(psize,n/5); 
subpop2=zeros(psize,n/5); 
subpop3=zeros(psize,n/5); 
subpop4=zeros(psize,n/5); 
subpop5=zeros(psize,n/5); 
%ÿ����Ⱥ�嵱ǰ����״̬
newgen1=zeros(psize,n+1); 
newgen2=zeros(psize,n+1); 
newgen3=zeros(psize,n+1); 
newgen4=zeros(psize,n+1); 
newgen5=zeros(psize,n+1); 
%�м����
pop1=zeros(psize,n); 
pop2=zeros(psize,n); 
pop3=zeros(psize,n); 
pop4=zeros(psize,n); 
pop5=zeros(psize,n); 
%��¼ÿ����Ⱥ����º�������Ⱥ���ϵĲ���(��Ϣ�ֲ�������)
min1=zeros(psize,n/5); 
min2=zeros(psize,n/5); 
min3=zeros(psize,n/5); 
min4=zeros(psize,n/5); 
min5=zeros(psize,n/5); 
%��¼ÿ����Ⱥ��ÿ�ε�����ȫ������ֵ
optimy1=ones(1,gennum); 
optimy2=ones(1,gennum); 
optimy3=ones(1,gennum); 
optimy4=ones(1,gennum); 
optimy5=ones(1,gennum); 
%��¼ÿ����Ⱥ�嵱ǰ�����и����ӵ�����ֵ
optt1=ones(psize,1); 
optt2=ones(psize,1); 
optt3=ones(psize,1); 
optt4=ones(psize,1); 
optt5=ones(psize,1); 
%ÿ����Ⱥ����ٶȾ���
vel1=vel; 
vel2=vel; 
vel3=vel; 
vel4=vel; 
vel5=vel; 
%ÿ����Ⱥ��Ӧ��Ҫ���չ�ʽ���µĲ���
subpop1=newgen(:,1:n/5);                
subpop2=newgen(:,n/5+1:2*n/5);         
subpop3=newgen(:,2*n/5+1:3*n/5); 
subpop4=newgen(:,3*n/5+1:4*n/5); 
subpop5=newgen(:,4*n/5+1:n); 
%��Ⱥ(�ֲ�)������С����,��ʼλ����㶨
xmin1=subpop1(1,:);          
xmin2=subpop2(1,:); 
xmin3=subpop3(1,:); 
xmin4=subpop4(1,:); 
xmin5=subpop5(1,:); 
 
%��ʼ��5��min����,Ԫ�ؾ�Ϊnewgen�е�һ�е�Ԫ�� 
for i=1:psize 
    min1(i,:)=xmin1; 
    min2(i,:)=xmin2; 
    min3(i,:)=xmin3; 
    min4(i,:)=xmin4; 
    min5(i,:)=xmin5; 
end 

%%%%%%%%%%%%%%%%%%% ������Ⱥ(��һ��) %%%%%%%%%%%%%%%%%%%
%���⣺
%2)ÿ����Ⱥ֮����ڽ��������(min*)ÿ����Ⱥ�ڲ�ֻ��subpop*��һ��,���������---һ����һ���ֵظ���(¬ �и�Ź���,��������ֲ�����)
%3)ֻȡÿ����Ⱥ��1/5������һ����Ⱥ,��1/5�Ƿ���Ч���ܷ�֤���������ǽ���Ϊ��������Ⱥ�����ԣ�

%�����һ����Ⱥ
newgen1=[subpop1,min2,min3,min4,min5,optt1]; 
for i=1:psize 
    [Ya,pop1(i,1:n)]=sort(newgen1(i,1:n)); %YaΪ��С��������������,pop1(i,1:n)Ϊ�����������ÿ��Ԫ����ԭ�����е�λ��
    lz=ceil(pop1(i,1:n)/mnum); %����һ�����еĵ�������(AMAZING!!):��������õ�������(��n=j��m��),����m������ȡ����֤ÿ��j����m��,�����
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen1(i,n+1)=jsmakespan6c6(lz);    % makespan6c6
    %newgen1(i,n+1)=jsmakespan10c10(lz); % makespan10c10
    %newgen1(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
    newgen1(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen1(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen1(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen1(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen1(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    optt1(i)=newgen1(i,n+1); 
end 
[Ya,Ia]=sort(optt1); %YaΪ������º��optt1����,IaΪ��Ԫ����ԭ�����е�λ��
optimy1(current_gen)=newgen1(Ia(1),n+1); %��¼��ǰ��������Ⱥ1��ȫ����Сmakespan
newgenp1=newgen1(1:psize,:); %��¼��ǰ�����еõ�����������Ⱥ1
newgeng1=newgen1(Ia(1),:); %��¼��ǰ��������Ⱥ1�����ŵ���
xmin1=newgen1(Ia(1),1:n/5);%ȫ������������Ⱥ 
for i=1:psize 
    min1(i,:)=xmin1; 
end 
%����ڶ�����Ⱥ
newgen2=[min1,subpop2,min3,min4,min5,optt2]; 
for i=1:psize 
    [Ya,pop2(i,1:n)]=sort(newgen2(i,1:n)); 
    lz=ceil(pop2(i,1:n)/mnum); 
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen2(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
    %newgen2(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
    %newgen2(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
    newgen2(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen2(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen2(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen2(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen2(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    optt2(i)=newgen2(i,n+1); 
end 
[Ya,Ia]=sort(optt2); 
optimy2(current_gen)=newgen2(Ia(1),n+1); 
newgenp2=newgen2(1:psize,:); 
newgeng2=newgen2(Ia(1),:); 
xmin2=newgen2(Ia(1),n/5+1:2*n/5);%ȫ������������Ⱥ 
for i=1:psize 
    min2(i,:)=xmin2; 
end 
%�����������Ⱥ
newgen3=[min1,min2,subpop3,min4,min5,optt3]; 
for i=1:psize 
    [Ya,pop3(i,1:n)]=sort(newgen3(i,1:n)); 
    lz=ceil(pop3(i,1:n)/mnum); 
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen3(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
    %newgen3(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
    %newgen3(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
    newgen3(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen3(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen3(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen3(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen3(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    optt3(i)=newgen3(i,n+1); 
end 
[Ya,Ia]=sort(optt3); 
optimy3(current_gen)=newgen3(Ia(1),n+1); 
newgenp3=newgen3(1:psize,:); 
newgeng3=newgen3(Ia(1),:); 
xmin3=newgen3(Ia(1),2*n/5+1:3*n/5);%ȫ������������Ⱥ 
for i=1:psize 
    min3(i,:)=xmin3; 
end 
%������ĸ���Ⱥ
newgen4=[min1,min2,min3,subpop4,min5,optt4]; 
for i=1:psize 
    [Ya,pop4(i,1:n)]=sort(newgen4(i,1:n)); 
    lz=ceil(pop4(i,1:n)/mnum); 
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen4(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
    %newgen4(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
    %newgen4(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
    newgen4(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen4(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen4(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen4(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen4(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    optt4(i)=newgen4(i,n+1); 
end 
[Ya,Ia]=sort(optt4); 
optimy4(current_gen)=newgen4(Ia(1),n+1); 
newgenp4=newgen4(1:psize,:); 
newgeng4=newgen4(Ia(1),:); 
xmin4=newgen4(Ia(1),3*n/5+1:4*n/5);%ȫ������������Ⱥ 
for i=1:psize 
    min4(i,:)=xmin4; 
end 
%����������Ⱥ
newgen5=[min1,min2,min3,min4,subpop5,optt5]; 
for i=1:psize 
    [Ya,pop5(i,1:n)]=sort(newgen5(i,1:n)); 
    lz=ceil(pop5(i,1:n)/mnum); 
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen5(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
    %newgen5(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
    %newgen5(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
    newgen5(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen5(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen5(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen5(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen5(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    optt5(i)=newgen5(i,n+1); 
end 
[Ya,Ia]=sort(optt5); 
optimy5(current_gen)=newgen5(Ia(1),n+1); 
newgenp5=newgen5(1:psize,:); 
newgeng5=newgen5(Ia(1),:); 
xmin5=newgen5(Ia(1),4*n/5+1:n);%ȫ������������Ⱥ 
for i=1:psize 
    min5(i,:)=xmin5; 
end 
%��¼��һ��ȫ����Сmakespan
a=[optimy1(1),optimy2(1),optimy3(1),optimy4(1),optimy5(1)]; 
optimy(1)=min(a); 

%%%%%%%%%%%%%%%%% �������� %%%%%%%%%%%%%%%%%%% 
%ÿ�ֵ�������:subpop*(PSO��ʽ)��optimy*(current_gen)��newgeng*(��Ⱥ*��ȫ����������)��xmin*(��Ⱥ*�ķֲ�������С����)��min*(��Ⱥ*�ĵ�ǰ���ŷֲ�)
while (current_gen<gennum) 
      current_gen=current_gen+1; 
      optimy1(current_gen)=optimy1(current_gen-1); 
      optimy2(current_gen)=optimy2(current_gen-1); 
      optimy3(current_gen)=optimy3(current_gen-1); 
      optimy4(current_gen)=optimy4(current_gen-1); 
      optimy5(current_gen)=optimy5(current_gen-1); 
     
      %���µ�һ����Ⱥ
      for i=1:psize 
          A(i,:)=xmin1; 
      end   
      R1 = rand(psize,n/5); 
      R2 = rand(psize,n/5); 
      vel1=w*vel1+C1*R1.*(newgenp1(1:psize,1:n/5)-subpop1)+ C2*R2.*(A-subpop1);  
      subpop1=subpop1+vel1;  
      newgen1=[subpop1,min2,min3,min4,min5,optt1];%���ֵ������Ѹ��£�subpop1 
      % Evaluate the new swarm and update
      for i=1:psize 
          [Ya,pop1(i,1:n)]=sort(newgen1(i,1:n)); 
          lz=ceil(pop1(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen1(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
          %newgen1(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          %newgen1(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
          newgen1(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen1(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen1(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen1(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen1(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          optt1(i)=newgen1(i,n+1); 
          if newgen1(i,n+1)<=optimy1(current_gen) 
             optimy1(current_gen)=newgen1(i,n+1); 
             newgeng1=newgen1(i,:); 
             xmin1=newgen1(i,1:n/5); 
          end  
      end   
      % Updating the best position for each particle 
      changeColumns=newgen1(:,n+1)<newgenp1(:,n+1);     
      newgenp1(find(changeColumns),:)=newgen1(find(changeColumns),:);   
      r=fix(rand(1,1)*psize)+1; 
      newgen1(r,1:n/5)=xmin1; %������������
      subpop1=newgen1(:,1:n/5); %����1/2��Ϊxmin1
      for i=1:psize 
          min1(i,:)=xmin1; 
      end 
     
      %���µڶ�����Ⱥ
      for i=1:psize 
          A(i,:)=xmin2; 
      end   
      R1 = rand(psize,n/5); 
      R2 = rand(psize,n/5); 
      vel2=w*vel2+C1*R1.*(newgenp2(1:psize,n/5+1:2*n/5)-subpop2)+ C2*R2.*(A-subpop2);  
      subpop2=subpop2+vel2; 
      newgen2=[min1,subpop2,min3,min4,min5,optt2]; %���ֵ������Ѹ��£�min1��subpop2
      % Evaluate the new swarm  
      for i=1:psize 
          [Ya,pop2(i,1:n)]=sort(newgen2(i,1:n)); 
          lz=ceil(pop2(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen2(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
          %newgen2(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          %newgen2(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
          newgen2(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen2(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen2(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen2(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen2(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          optt2(i)=newgen2(i,n+1); 
          if newgen2(i,n+1)<=optimy2(current_gen) 
             optimy2(current_gen)=newgen2(i,n+1); 
             newgeng2=newgen2(i,:); 
             xmin2=newgen2(i,n/5+1:2*n/5); 
          end  
      end   
      % Updating the best position for each particle 
      changeColumns=newgen2(:,n+1)<newgenp2(:,n+1);     
      newgenp2(find(changeColumns),:)=newgen2(find(changeColumns),:);   
      r=fix(rand(1,1)*psize)+1; 
      newgen2(r,n/5+1:2*n/5)=xmin2; 
      subpop2=newgen2(:,n/5+1:2*n/5); 
      for i=1:psize 
          min2(i,:)=xmin2; 
      end 
    
      %���µ�������Ⱥ
      for i=1:psize 
          A(i,:)=xmin3; 
      end   
      R1 = rand(psize,n/5); 
      R2 = rand(psize,n/5); 
      vel3=w*vel3+C1*R1.*(newgenp3(1:psize,2*n/5+1:3*n/5)-subpop3)+ C2*R2.*(A-subpop3); %( +a*)+R3.*()+) 
      subpop3=subpop3+vel3; 
      newgen3=[min1,min2,subpop3,min4,min5,optt3]; %���ֵ������Ѹ��£�min1��min2��subpop3
      % Evaluate the new swarm  
      for i=1:psize 
          [Ya,pop3(i,1:n)]=sort(newgen3(i,1:n)); 
          lz=ceil(pop3(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen3(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
          %newgen3(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          %newgen3(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
          newgen3(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen3(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen3(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen3(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen3(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          optt3(i)=newgen3(i,n+1); 
          if newgen3(i,n+1)<=optimy3(current_gen) 
             optimy3(current_gen)=newgen3(i,n+1); 
             newgeng3=newgen3(i,:); 
             xmin3=newgen3(i,2*n/5+1:3*n/5); 
          end  
      end   
      % Updating the best position for each particle 
      changeColumns=newgen3(:,n+1)<newgenp3(:,n+1);     
      newgenp3(find(changeColumns),:)=newgen3(find(changeColumns),:);   
      r=fix(rand(1,1)*psize)+1; 
      newgen3(r,2*n/5+1:3*n/5)=xmin3; 
      subpop3=newgen3(:,2*n/5+1:3*n/5); 
      for i=1:psize 
          min3(i,:)=xmin3; 
      end 
   
      %���µ��ĸ���Ⱥ
      for i=1:psize 
          A(i,:)=xmin4; 
      end   
      R1 = rand(psize,n/5); 
      R2 = rand(psize,n/5); 
      vel4=w*vel4+C1*R1.*(newgenp4(1:psize,3*n/5+1:4*n/5)-subpop4)+ C2*R2.*(A-subpop4); %( +a*)+R3.*()+) 
      subpop4=subpop4+vel4; 
      newgen4=[min1,min2,min3,subpop4,min5,optt4]; %���ֵ������Ѹ��£�min1��min2��min3��subpop4
      % Evaluate the new swarm  
      for i=1:psize 
          [Ya,pop4(i,1:n)]=sort(newgen4(i,1:n)); 
          lz=ceil(pop4(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen4(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
          %newgen4(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          %newgen4(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
          newgen4(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen4(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen4(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen4(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen4(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          optt4(i)=newgen4(i,n+1); 
          if newgen4(i,n+1)<=optimy4(current_gen) 
             optimy4(current_gen)=newgen4(i,n+1); 
             newgeng4=newgen4(i,:); 
             xmin4=newgen4(i,3*n/5+1:4*n/5); 
          end  
      end   
      % Updating the best position for each particle 
      changeColumns=newgen4(:,n+1)<newgenp4(:,n+1);     
      newgenp4(find(changeColumns),:)=newgen4(find(changeColumns),:);   
      r=fix(rand(1,1)*psize)+1; 
      newgen4(r,3*n/5+1:4*n/5)=xmin4; 
      subpop4=newgen4(:,3*n/5+1:4*n/5); 
      for i=1:psize 
          min4(i,:)=xmin4; 
      end 
    
      %���µ������Ⱥ
      for i=1:psize 
          A(i,:)=xmin5; 
      end   
      R1 = rand(psize,n/5); 
      R2 = rand(psize,n/5); 
      vel5=w*vel5+C1*R1.*(newgenp5(1:psize,4*n/5+1:5*n/5)-subpop5)+ C2*R2.*(A-subpop5); %( +a*)+R3.*()+) 
      subpop5=subpop5+vel5; 
      newgen5=[min1,min2,min3,min4,subpop5,optt5]; %���ֵ������Ѹ��£�min1��min2��min3��min4��subpop5,��newgen5Ϊ���ֵ��������°汾
      % Evaluate the new swarm  
      for i=1:psize 
          [Ya,pop5(i,1:n)]=sort(newgen5(i,1:n)); 
          lz=ceil(pop5(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen5(i,n+1)=jsmakespan6c6(lz);   % makespan6c6
          %newgen5(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          %newgen5(i,n+1)=jsmakespan20c5(lz);  % makespan20c5
          newgen5(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen5(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen5(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen5(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen5(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          optt5(i)=newgen5(i,n+1); 
          if newgen5(i,n+1)<=optimy5(current_gen) 
             optimy5(current_gen)=newgen5(i,n+1); 
             newgeng5=newgen5(i,:); 
             xmin5=newgen5(i,4*n/5+1:n); 
          end  
      end   
      % Updating the best position for each particle 
      changeColumns=newgen5(:,n+1)<newgenp5(:,n+1);     
      newgenp5(find(changeColumns),:)=newgen5(find(changeColumns),:);   
      r=fix(rand(1,1)*psize)+1; 
      newgen5(r,4*n/5+1:n)=xmin5; 
      subpop5=newgen5(:,4*n/5+1:n); 
      for i=1:psize 
          min5(i,:)=xmin5; 
      end 
    
      %���µ�ǰ�����Ľ��
      a=[optimy1(current_gen),optimy2(current_gen),optimy3(current_gen),optimy4(current_gen),optimy5(current_gen)]; 
      b=[newgeng1(1:n);newgeng2(1:n);newgeng3(1:n);newgeng4(1:n);newgeng5(1:n)]; %������Ⱥ�����ŵ��ȼ���
      optimy(current_gen)=min(a); %Ŀǰ������������Ⱥ�Ƚ��µ���Сmakespan
      l=find(optimy(current_gen)==a); 
      L=l(1); %��¼��������Сmakespan����Ⱥ
end 

%������
[Ya,bsort(1,1:n)]=sort(b(L,:));
opsch=ceil(bsort(1,1:n)/mnum);%���ȫ�����ŵ���
opx=b(L,:); %���ȫ�����ŵ���(С��,������ͼ����)
opy=min(optimy); %������ŵ����µ���Сmakespan