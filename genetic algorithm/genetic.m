
%%��������
N = 200;  %��Ⱥ�ڸ�����Ŀ
N_chrom = 10; %Ⱦɫ��ڵ���
mut=0.1;
iter = 2000; %��������
best = 1;

chrom_range = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10;10 10 10 10 10 10 10 10 10 10];%ÿ���ڵ��ֵ�����䣬����x1-x9,��ֵthea
chrom = zeros(N, N_chrom);%���Ⱦɫ��ľ���
fitness = zeros(N, 1);%���Ⱦɫ�����Ӧ��
fitness_ave = zeros(1, iter);%���ÿһ����ƽ����Ӧ��
fitness_best = zeros(1, iter);%���ÿһ����������Ӧ��
chrom_best = zeros(1, N_chrom+1);%��ŵ�ǰ��������Ⱦɫ������Ӧ��

%%��ʼ��
chrom = Initialize(N, N_chrom, chrom_range); %��ʼ��Ⱦɫ��
fitness = CalFitness(chrom, N, N_chrom); %������Ӧ��
chrom_best = FindBest(chrom, fitness, N_chrom); %Ѱ������Ⱦɫ��
fitness_best(1) = chrom_best(end); %����ǰ���Ŵ��������
fitness_ave(1) = CalAveFitness(fitness); %����ǰƽ����Ӧ�ȴ��������

for t = 2:iter
    chrom1 = CopyChrom(chrom, N, N_chrom, fitness); %COPY
    chrom2 = AcrChrom(chrom, N, N_chrom, fitness); %����
    chrom(1:(N/10), : ) =chrom1;      
    chrom((N/10)+1:N , : )=chrom2;   %generate the next chrom
    chrom=mutChrom(chrom, mut, N, N_chrom, chrom_range, t, iter);%mutation
    fitness = CalFitness(chrom, N, N_chrom); %������Ӧ��
    chrom_best = FindBest(chrom, fitness, N_chrom); %Ѱ������Ⱦɫ��
   
    fitness_best(t) = chrom_best(end); %����ǰ���Ŵ��������
    fitness_ave(t) = CalAveFitness(fitness); %����ǰƽ����Ӧ�ȴ��������
    
end

%%��ͼ
figure(1)
plot(1:iter, fitness_ave, 'r', 1:iter, fitness_best, 'b')
grid on
legend('ƽ����Ӧ��', '������Ӧ��')


%%������
disp(['����Ⱦɫ��Ϊ', num2str(chrom_best(1:end-1))])
disp(['������Ӧ��Ϊ', num2str(chrom_best(end))])
