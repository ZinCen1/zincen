%  �����ܶȵ�ɢ��ͼ
% x�����꣬y������
function plot_density(x,y)
if nargin==1   %����1���������
    if size(x,1)
        x=x';    %ת��Ϊ������
    end
    y=x;
    x=(1:length(y))';
else if nargin==2   %��2���������
        if size(x,1)
            x=x';   %ת��Ϊ������
        end
        if size(y,1)
            y=y';       %ת��Ϊ������
        end
    end
end
N=length(x);   %���ݳ���
c=zeros(N,1);
max_x=max(x);min_x=min(x);   %�����߽��
max_y=max(y);min_y=min(y);    %�����߽��
NLevel=101;   %���ֵȼ�100��
color_Map=zeros(NLevel+1);
step_x=(max_x-min_x)/(NLevel-1);  % x�Ჽ��
step_y=(max_y-min_y)/(NLevel-1);    % y�Ჽ�� 
for j=1:N
    color_Map_x=int32((x(j)-min_x)/step_x)+1;
    color_Map_y=int32((y(j)-min_y)/step_y)+1;
    color_Map(color_Map_x,color_Map_y)=color_Map(color_Map_x,color_Map_y)+1;
end
for j=1:N
    color_Map_x=int32((x(j)-min_x)/step_x)+1;
    color_Map_y=int32((y(j)-min_y)/step_y)+1;
    c(j)=color_Map(color_Map_x,color_Map_y);
end
scatter(x,y,10,c,'filled')
%image(linspace(min_x,max_x,NLevel+1),linspace(min_y,max_y,NLevel+1),color_Map);
colormap(jet)   %����colormap�����ı���ɫ�仯����
colorbar   %��ʾ��ɫ��