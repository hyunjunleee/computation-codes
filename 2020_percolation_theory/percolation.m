N = 10;
n = input('n?? > ');
%{
p = input('p?? > ');
q = input('q?? > ');
%}
V = zeros(40, 40);
for indp = 1:40
p = indp/40;
for indq = 1:40
q = indq/40;

avg = 0;
for numb = 1:N
G = graph((1:n^2),(1:n^2));
for i = 1:n
    for j = 1:n-1
        if(rand < p)
            G = addedge(G,n*i-n+j,n*i-n+j+1);
        end
        if(rand < q)
            G = addedge(G,n*j+i,n*j-n+i);
        end
    end
end
%plot(G)
C = conncomp(G);
tf = 0;
for i = 1:n
    if(C(n*i) == C((n^2+1)/2))
        tf = 1;
        break;
    end
    if(C(n*i-n+1) == C((n^2+1)/2))
        tf = 1;
        break;
    end
    if(C(i) == C((n^2+1)/2))
        tf = 1;
        break;
    end
    if(C(n*n - i + 1) == C((n^2+1)/2))
        tf = 1;
        break;
    end
end
avg = avg + tf;
end
avg = avg / N;
V(indp, indq) = avg;
end
disp('p = ', p);
end
surf((0.1:0.1:1), (0.1:0.1:1), V);
