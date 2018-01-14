%%%%%%%%%%%%%% ��ͨ����Ⱥ�㷨 %%%%%%%%%%%%%%%%

function [opsch,opx,opy,avgen,optimy]=psojssp(gennum,psize,w,C1,C2,jnum,mnum) 
n=mnum*jnum; 
current_gen=1; 
newgen=zeros(psize,n+1); %��ǰ������Ⱥ
pop=zeros(psize,n); 
A=pop;%ȫ���������ӵĸ���(psize��)
vel=pop; 
optimy=ones(1,gennum); 
opt=zeros(1,psize); %newgen��������һ�е�ת��,���������ǰһ������Сmakespan
avgen=zeros(1,gennum); %��¼ÿһ�����������Ӷ�Ӧ�ĵ������������ƽ��makespan(�������ܣ�)

newgen(1:psize,1:n)=rand(psize,n); 
for i=1:psize 
    [Ya,pop(i,1:n)]=sort(newgen(i,1:n)); 
    lz=ceil(pop(i,1:n)/mnum); %����һ�����еĵ�������
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    %newgen(i,n+1)=jsmakespan6c6(lz);     % makespan6c6
    %newgen(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
    newgen(i,n+1)=jsmakespan20c5(lz);   % makespan20c5
    %newgen(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
    %newgen(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
    %newgen(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
    %newgen(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
    %newgen(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
    %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
    avgen(current_gen)=avgen(current_gen)+newgen(i,n+1);     
    opt(i)=newgen(i,n+1); 
end 
avgen(current_gen)=avgen(current_gen)/psize; 

[Ya,Ia]=sort(opt); 
optimy(current_gen)=newgen(Ia(1),n+1); 
newgenp=newgen(1:psize,:); %ÿ�����ӵ���ʷ����ֵ��ɵ���Ⱥ
%B=newgenp(1:psize,1:n); 
%optimx=newgen(Ia(1),1:n); %��ǰ�����е���������(����������,������makespan)
newgeng=newgen(Ia(1),:);%ȫ����������(�����������м���Ӧ��makespan)
 
%%%%%%%%%%%%%%%%% �������� %%%%%%%%%%%%%%%%%%%
while current_gen<gennum 
      current_gen=current_gen+1; 
      optimy(current_gen)=optimy(current_gen-1); 
      for i=1:psize 
          A(i,:) = newgeng(1:n); 
      end 
      %�����ٶȺ�λ��
      R1 = rand(psize,n); 
      R2 = rand(psize,n); 
      vel =w*vel + C1*R1.*(newgenp(1:psize,1:n) - newgen(1:psize,1:n)) + C2*R2.*(A - newgen(1:psize,1:n)); %����c1/c2��Ӱ�죿
      newgen(1:psize,1:n) =newgen(1:psize,1:n) + vel; 
      % a=rand(1,1)^iter; 
      % Evaluate the new swarm 
      for i=1:psize 
          [Ya,pop(i,1:n)]=sort(newgen(i,1:n)); 
          lz=ceil(pop(i,1:n)/mnum); 
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          %newgen(i,n+1)=jsmakespan6c6(lz);    % makespan6c6
          %newgen(i,n+1)=jsmakespan10c10(lz);  % makespan10c10
          newgen(i,n+1)=jsmakespan20c5(lz);    % makespan20c5
          %newgen(i,n+1)=jsmakespan10c5(lz);  % makespan10c5
          %newgen(i,n+1)=jsmakespan20c10(lz);  % makespan20c10
          %newgen(i,n+1)=jsmakespan30c10(lz);  % makespan30c10
          %newgen(i,n+1)=jsmakespan15c15(lz);  % makespan15c15
          %newgen(i,n+1)=jsmakespan15c10(lz);  % makespan15c10
          %%%%%%%%%%%%% ���������� %%%%%%%%%%%%%%
          avgen(current_gen)=avgen(current_gen)+newgen(i,n+1); 
          opt(i)=newgen(i,n+1); 
          %����ȫ����������
          if newgen(i,n+1)<=optimy(current_gen) 
              optimy(current_gen)=newgen(i,n+1); 
              newgeng=newgen(i,:); 
          end  
      end 
      avgen(current_gen)=avgen(current_gen)/psize; 
      %[Ya,Ia]=sort(opt); 
      %optimx=newgen(Ia(1),1:n);    
      % Updating the best position for each particle 
      %changeColumns=newgen(:,n+1)<newgenp(:,n+1); 
      %newgenp(find(changeColumns),:)=newgen(find(changeColumns),:); 
      for i=1:psize
          if newgen(i,n+1)<newgenp(i,n+1)
              newgenp(i,:)=newgen(i,:);
          end
      end
      %����������,��������ٶȣ�
      r=fix(rand(1,1)*psize)+1; 
      newgen(r,:)=newgeng; 
end 

%������
[Ya,newgengsort(1,1:n)]=sort(newgeng(1:n));
opsch=ceil(newgengsort(1,1:n)/mnum);%���ȫ�����ŵ���
opx=newgeng(1:n); 
opy=optimy(1,current_gen);