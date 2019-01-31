function fitness = CalFitness(chrom, N, N_chrom)
fitness = zeros(N, 1);
data=csvread('training-set.csv');
[width,high]=size(data);
%开始计算适应度
for i = 1:N
    temp=0;
    w1 = chrom(i, 1);
    w2 = chrom(i, 2);
    w3 = chrom(i, 3);
    w4 = chrom(i, 4);
    w5 = chrom(i, 5);
    w6 = chrom(i, 6);
    w7 = chrom(i, 7);
    w8 = chrom(i, 8);
    w9 = chrom(i, 9);
    seta=chrom(i, 10);
    for j=1:width
        x1 = data(j, 1);
        x2 = data(j, 2);
        x3 = data(j, 3);
        x4 = data(j, 4);
        x5 = data(j, 5);
        x6 = data(j, 6);
        x7 = data(j, 7);
        x8 = data(j, 8);
        x9 = data(j, 9);
        total=w1*x1+w2*x2+w3*x3+w4*x4+w5*x5+w6*x6+w7*x7+w8*x8+w9*x9-1*seta;
        if total>=0 && data(j,10)==1
            temp=temp+1;
        else if total<0 && data(j,10)==0
            temp=temp+1;
            else
                temp=temp;
            end
        end
    end
    fitness(i) = temp;
end