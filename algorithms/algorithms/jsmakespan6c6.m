%�Ľ�֮������ǰ���ð�����,�����������ÿ���ʱ�β��.�ɸ�Ϊ�����,�׵����Ž�

function minmakespan=jsmakespan6c6(gen) 
T=[1 3 6 7 3 6      %���������ĸ���������Ӧ�ļӹ�ʱ��
   8 5 10 10 10 4 
   5 4 8 9 1 7  
   5 5 5 3 8 9 
   9 3 5 4 3 1  
   3 3 9 10 4 1]; 
js=[3 1 2 4 6 5     %���������ĸ���������Ӧ�Ļ���(������=������)
    2 3 5 6 1 4 
    3 4 6 1 2 5 
    2 1 3 4 5 6 
    3 2 5 6 1 4 
    2 4 6 1 5 3]; 
[n,m]=size(T); 
wpn=length(gen); 
starts=zeros(m,n);   %��¼ÿ��������ÿ�������Ŀ�ʼ�ӹ�ʱ��
ends=zeros(m,n);     %��¼ÿ��������ÿ�������Ľ����ӹ�ʱ��
jp=zeros(1,n);       %��¼ÿ��������ǰִ�е��˵ڼ������� 
mj=zeros(m,1);       %��¼ÿ���ӹ�������Ŀǰ���ۻ��Ĳ�����
mjn=zeros(m,n);      %��¼ÿ��������ÿ�������ڼӹ������ϵļӹ�����
%gen=[6  3  6  5  5  3  4  1  2  4   6  3   3  6   1  5   1   6   4   2   2   5   5]; 
for i=1:wpn 
    jp(gen(i))=jp(gen(i))+1; 
    mj(js(gen(i),jp(gen(i))))=mj(js(gen(i),jp(gen(i))))+1; 
    mjn(js(gen(i),jp(gen(i))),gen(i))=mj(js(gen(i),jp(gen(i)))); 
    if jp(gen(i))==1 %��ִ�е��ǵ�ǰ�����ĵ�һ������
       if mj(js(gen(i),1))==1 %��ǰ�ӹ������Ͽ���
          starts(js(gen(i),1),1)=0; 
          ends(js(gen(i),1),1)=T(gen(i),1); 
       else %������
          starts(js(gen(i),1),mj(js(gen(i),1)))=ends(js(gen(i),1),mj(js(gen(i),1))-1); %��ԴԼ��:ĳ�����ϵķǿ���ʱ�μ�����²����Ŀ�ʼʱ��=�û����ϵ�ǰ�ӹ������Ľ���ʱ��
          ends(js(gen(i),1),mj(js(gen(i),1)))=starts(js(gen(i),1),mj(js(gen(i),1)))+T(gen(i),1); 
       end 
    else 
       if mj(js(gen(i),jp(gen(i))))==1 
          starts(js(gen(i),jp(gen(i))),1)=ends(js(gen(i),jp(gen(i))-1),mjn(js(gen(i),jp(gen(i))-1),gen(i))); %����Լ��:ĳ�����ķ��׵�������ʼʱ��=�ù������ϵ������Ľ���ʱ��
          ends(js(gen(i),jp(gen(i))),1)=starts(js(gen(i),jp(gen(i))),1)+T(gen(i),jp(gen(i))); 
       else %������
           %��ǰ�����ǹ������׵������Ҽӹ�����������ʱ,��ʼʱ��ѡ��max[�ù�����ǰ������,�û�����ǰ������]
          starts(js(gen(i),jp(gen(i))),mj(js(gen(i),jp(gen(i)))))=max(ends(js(gen(i),jp(gen(i))),mj(js(gen(i),jp(gen(i))))-1),ends(js(gen(i),jp(gen(i))-1),mjn(js(gen(i),jp(gen(i))-1),gen(i)))); 
          ends(js(gen(i),jp(gen(i))),mj(js(gen(i),jp(gen(i)))))=starts(js(gen(i),jp(gen(i))),mj(js(gen(i),jp(gen(i)))))+T(gen(i),jp(gen(i))); 
       end 
    end 
end 
minmakespan=max(max(ends)); 