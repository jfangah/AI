
%%基础参数
N = 200;  %种群内个体数目
N_chrom = 10; %染色体节点数
mut=0.1;
iter = 2000; %迭代次数
best = 1;

chrom_range = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10;10 10 10 10 10 10 10 10 10 10];%每个节点的值的区间，输入x1-x9,阈值thea
chrom = zeros(N, N_chrom);%存放染色体的矩阵
fitness = zeros(N, 1);%存放染色体的适应度
fitness_ave = zeros(1, iter);%存放每一代的平均适应度
fitness_best = zeros(1, iter);%存放每一代的最优适应度
chrom_best = zeros(1, N_chrom+1);%存放当前代的最优染色体与适应度

%%初始化
chrom = Initialize(N, N_chrom, chrom_range); %初始化染色体
fitness = CalFitness(chrom, N, N_chrom); %计算适应度
chrom_best = FindBest(chrom, fitness, N_chrom); %寻找最优染色体
fitness_best(1) = chrom_best(end); %将当前最优存入矩阵当中
fitness_ave(1) = CalAveFitness(fitness); %将当前平均适应度存入矩阵当中

for t = 2:iter
    chrom1 = CopyChrom(chrom, N, N_chrom, fitness); %COPY
    chrom2 = AcrChrom(chrom, N, N_chrom, fitness); %交叉
    chrom(1:(N/10), : ) =chrom1;      
    chrom((N/10)+1:N , : )=chrom2;   %generate the next chrom
    chrom=mutChrom(chrom, mut, N, N_chrom, chrom_range, t, iter);%mutation
    fitness = CalFitness(chrom, N, N_chrom); %计算适应度
    chrom_best = FindBest(chrom, fitness, N_chrom); %寻找最优染色体
   
    fitness_best(t) = chrom_best(end); %将当前最优存入矩阵当中
    fitness_ave(t) = CalAveFitness(fitness); %将当前平均适应度存入矩阵当中
    
end

%%作图
figure(1)
plot(1:iter, fitness_ave, 'r', 1:iter, fitness_best, 'b')
grid on
legend('平均适应度', '最优适应度')


%%输出结果
disp(['最优染色体为', num2str(chrom_best(1:end-1))])
disp(['最优适应度为', num2str(chrom_best(end))])
