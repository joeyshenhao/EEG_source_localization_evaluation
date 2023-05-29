load scout_Desikan-Killiany_34_Left.mat
Left_vertices = [];
for ii = 1:34
    Left_vertices = [Left_vertices,Scouts(ii).Vertices];
end
load scout_Desikan-Killiany_34_Right.mat
Right_vertices = [];
for ii = 1:34
    Right_vertices = [Right_vertices,Scouts(ii).Vertices];
end