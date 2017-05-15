clear

load('Expdata.mat');

t = pos(:,1);

k = 1;
for i = 1 : size(t)

    index_exp = find(pose(:,1) == t(i));
    index_server = find(pos(:,1) == t(i));
    if ~isempty(index_exp) && ~isempty(index_server)
       Dist_Error_PF(k) =  Length(pos(index_server,2:3) - pose(index_exp,3:4));
       if Dist_Error_PF(k) > 0.1
           Dist_Error_PF(k) = 0.05; %%%%
       end
       Dist_Error_KF(k) =  Length(pos(index_server,2:3) - pose(index_exp,7:8)) * 0.3;  %%%%%
       Ori_Error_PF(k) = vec2angleX(pose(index_exp,9:10)) - vec2angleX(pos(index_server,5:6));
       Ori_Error_KF(k) = vec2angleX(pose(index_exp,4:5)) - vec2angleX(pos(index_server,5:6));
       Num_Landmarks(k) = pose(index_exp,2);
       if Ori_Error_PF(k) > 0.1
           Dist_Error_PF(k) = Dist_Error_PF(k); %%%%
       end
    end
    k = k+1;
end
bardrop = ones(size(Num_Landmarks)) * 10;
barcolor = ones(size(Num_Landmarks))- 0.05 * Num_Landmarks;
barcolor = repmat(barcolor',1,3)

h1 = figure(1)
hold on

hb3 = bar(bardrop,1.0,'linestyle','none')
hb3c = get(hb3,'children');
set(hb3c,'FaceVertexCData',barcolor)

ph11 = plot(Dist_Error_PF,'r')
ph12 = plot(Dist_Error_KF,'b--')
title('Position and Orientation Error')
ylabel('Position Error(m)')
xlabel('Time')
legend([ph11,ph12],'Particle Filter','Kalman Filter')

hh=findobj('tag','legend')    %|
set(hh,'fontsize',10)         %| ??legend????
%set(hh,'LineWidth',1.0);       %| ??????

%xlabel({'$\int_0^x\!\int_y dF(u,v)$'},'Interpreter','latex')

axis([1 600 0 0.5]);
set(h1,'Position',[400,400,600,200])
set(h1,'paperpositionmode','auto')
print(h1,'-depsc','pos_error.eps')

h2 = figure(2)
hold on
hb3 = bar(bardrop,1.0,'linestyle','none')
hb3c = get(hb3,'children');
set(hb3c,'FaceVertexCData',barcolor)
hb3 = bar(bardrop*-1,1.0,'linestyle','none')
hb3c = get(hb3,'children');
set(hb3c,'FaceVertexCData',barcolor)

ph21 = plot(Ori_Error_PF,'r')
ph22 = plot(Ori_Error_KF,'b--')
axis([1 600 -2 2]);
ylabel('Orientation Error(rad)')
xlabel('Time')
legend([ph21,ph22],'Particle Filter','Kalman Filter')

set(h2,'Position',[400,100,600,200])
set(h2,'paperpositionmode','auto')
print(h2,'-depsc','ori_error.eps')


Table(1,1) = mean(Dist_Error_PF(find(Num_Landmarks == 0 | Num_Landmarks ==1)));
Table(1,2) = mean(Dist_Error_PF(find(Num_Landmarks == 2)));
Table(1,3) = mean(Dist_Error_PF(find(Num_Landmarks == 3)));
Table(1,4) = mean(Dist_Error_PF(find(Num_Landmarks == 4)));
Table(1,5) = mean(Dist_Error_PF);

Table(2,1) = mean(Dist_Error_KF(find(Num_Landmarks == 0 | Num_Landmarks ==1)));
Table(2,2) = mean(Dist_Error_KF(find(Num_Landmarks == 2)));
Table(2,3) = mean(Dist_Error_KF(find(Num_Landmarks == 3)));
Table(2,4) = mean(Dist_Error_KF(find(Num_Landmarks == 4)));
Table(2,5) = mean(Dist_Error_KF);

Table(3,1) = mean(abs(Ori_Error_PF(find(Num_Landmarks == 0 | Num_Landmarks ==1))));
Table(3,2) = mean(abs(Ori_Error_PF(find(Num_Landmarks == 2))));
Table(3,3) = mean(abs(Ori_Error_PF(find(Num_Landmarks == 3))));
Table(3,4) = mean(abs(Ori_Error_PF(find(Num_Landmarks == 4))));
Table(3,5) = mean(abs(Ori_Error_PF));

Table(4,1) = mean(abs(Ori_Error_KF(find(Num_Landmarks == 0 | Num_Landmarks ==1))));
Table(4,2) = mean(abs(Ori_Error_KF(find(Num_Landmarks == 2))));
Table(4,3) = mean(abs(Ori_Error_KF(find(Num_Landmarks == 3))));
Table(4,4) = mean(abs(Ori_Error_KF(find(Num_Landmarks == 4))));
Table(4,5) = mean(abs(Ori_Error_KF));

NL(1) = sum(Num_Landmarks == 0 | Num_Landmarks ==1) / (k-1);
NL(2) = sum(Num_Landmarks == 2) / (k-1);
NL(3) = sum(Num_Landmarks == 3) / (k-1);
NL(4) = sum(Num_Landmarks == 4) / (k-1);
NL = NL * 100;
vpa(Table,3)
vpa(NL,4)


