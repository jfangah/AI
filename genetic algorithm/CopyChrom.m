function chrom_new = CopyChrom(chrom, N, N_chrom, fitness)
chrom_new = zeros(N/10, N_chrom);
for i = 1:(N/10)  %copy
    co1_rand = floor(rand*(N-1)+1);
    co2_rand = floor(rand*(N-1)+1);
    co3_rand = floor(rand*(N-1)+1);
    co4_rand = floor(rand*(N-1)+1);
    co5_rand = floor(rand*(N-1)+1);
    total=[fitness(co1_rand),fitness(co2_rand),fitness(co3_rand),fitness(co4_rand),fitness(co5_rand)];
    maxfitness=max(total);
    site=0;
     if maxfitness==fitness(co1_rand)
        site=co1_rand;
    end
     if maxfitness==fitness(co2_rand)
        site=co2_rand;
     end
     if maxfitness==fitness(co3_rand)
        site=co3_rand;
     end
     if maxfitness==fitness(co4_rand)
        site=co4_rand;
     end
     if maxfitness==fitness(co5_rand)
        site=co5_rand;
    end
    chrom_new(i, :)=chrom(site, :);
end

chrom_new = chrom_new;