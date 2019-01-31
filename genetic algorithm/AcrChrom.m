function chrom_new = AcrChrom(chrom, N, N_chrom,fitness)
chrom_new = zeros(N-N/10, N_chrom);
for i = 1:2:(N-N/10)
    co1_rand = floor(rand*(N-1)+1);
    co2_rand = floor(rand*(N-1)+1);
    co3_rand = floor(rand*(N-1)+1);
    co4_rand = floor(rand*(N-1)+1);
    co5_rand = floor(rand*(N-1)+1);
    total=[fitness(co1_rand),fitness(co2_rand),fitness(co3_rand),fitness(co4_rand),fitness(co5_rand)];
    [b,t]=sort(total);
    site1=0;
    site2=0;
    if t(4)==1
        site1=co1_rand;
    end
    if t(4)==2
        site1=co2_rand;
    end
    if t(4)==3
        site1=co3_rand;
    end
    if t(4)==4
        site1=co4_rand;
    end
    if t(4)==5
        site1=co5_rand;
    end
    if t(5)==1
        site2=co1_rand;
    end
    if t(5)==2
        site2=co2_rand;
    end
    if t(5)==3
        site2=co3_rand;
    end
    if t(5)==4
        site2=co4_rand;
    end
    if t(5)==5
        site2=co5_rand;
    end
    acr1_chrom = chrom(site1,:) ;%要交叉的染色体1
    acr2_chrom = chrom(site2,:);
    acr_node = floor((N_chrom-1)*rand+1); %要交叉的节点
    %交叉开始
    temp = acr1_chrom(acr_node:N_chrom);
    acr1_chrom(acr_node:N_chrom) = acr2_chrom(acr_node:N_chrom); 
    acr2_chrom(acr_node:N_chrom) = temp;
    
    chrom_new(i,:)=acr1_chrom;
    chrom_new(i+1,:)=acr2_chrom;
end



chrom_new = chrom_new;