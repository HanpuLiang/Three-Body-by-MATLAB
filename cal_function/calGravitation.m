% 计算两个小球引力大小
function F = calGravitation(r, i, j)
    global m G;
    F = G*m(i)*m(j)/r^2;
end