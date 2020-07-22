%  画带密度的散点图
% x横坐标，y纵坐标
function plot_density(x,y)
if nargin==1   %仅有1个输入变量
    if size(x,1)
        x=x';    %转置为列向量
    end
    y=x;
    x=(1:length(y))';
else if nargin==2   %有2个输入变量
        if size(x,1)
            x=x';   %转置为列向量
        end
        if size(y,1)
            y=y';       %转置为列向量
        end
    end
end
N=length(x);   %数据长度
c=zeros(N,1);
max_x=max(x);min_x=min(x);   %搜索边界点
max_y=max(y);min_y=min(y);    %搜索边界点
NLevel=101;   %划分等级100份
color_Map=zeros(NLevel+1);
step_x=(max_x-min_x)/(NLevel-1);  % x轴步长
step_y=(max_y-min_y)/(NLevel-1);    % y轴步长 
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
colormap(jet)   %查阅colormap函数改变颜色变化趋势
colorbar   %显示颜色条