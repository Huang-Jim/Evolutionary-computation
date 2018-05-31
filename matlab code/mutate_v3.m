function [ out] = mutate_v3( len, ref, pop, gen)
g = 0;
sigma = [0.1,0.01,0.001];
buf = zeros(len,pop);
err = zeros(1,pop);
for p = 1:pop
    buf(:,p) = buf(:,p) + ones(len,1)*randn()*sigma(randi([1 3]));
    err(1,p) = fitness(buf(:,p), ref);
end
while 1
    [val, idx] = sort(err);
    if abs(val(1,1)) == abs(val(1,2)) || abs(val(1,3)) == abs(val(1,4)) || abs(val(1,1)) == abs(val(1,4))
        g = g+1;
    end    
    if g == 100
        for p = 1:pop
            err(1,p) = fitness(buf(:,p), ref);
        end
        [val, idx] = sort(err);
        out = buf(:,idx(1,1));
        break
    end
    % Choose best four
    buf(:,1) = buf(:,idx(1,1));
    buf(:,2) = buf(:,idx(1,2));
    buf(:,3) = buf(:,idx(1,3));
    buf(:,4) = buf(:,idx(1,4));
    % Crossover
    cross = randi([2 len-1]);
    tmp = buf(1:cross,1);
    buf(1:cross,1) = buf(1:cross,3);
    buf(1:cross,3) = tmp;
    tmp = buf(1:cross,2);
    buf(1:cross,2) = buf(1:cross,4);
    buf(1:cross,4) = tmp;
    % Mutate
    buf(:,5) = buf(:,1) + ones(len,1)*randn()*sigma(randi([1 3]));
    buf(:,6) = buf(:,2) + ones(len,1)*randn()*sigma(randi([1 3]));
    buf(:,7) = buf(:,3) + ones(len,1)*randn()*sigma(randi([1 3]));
    buf(:,8) = buf(:,4) + ones(len,1)*randn()*sigma(randi([1 3]));
    for p = 1:pop
        err(1,p) = fitness(buf(:,p), ref);
    end
end
end

