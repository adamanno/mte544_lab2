function particles = createParticles(n,freespace,scale)
    p = struct('x',{},'y',{},'theta',{});
    
    for i = 1:n
        randi = size(freespace,1)*scale; 
        randj = size(freespace,2)*scale;
        rando = 2*pi;
        
        idx_i = 1;
        idx_j = 1;


        while freespace(idx_i,idx_j) == 0
            randi = rand()*size(freespace,1)*scale;
            randj = rand()*size(freespace,2)*scale;
            rando = rand()*2*pi;

            idx_i = uint16(randi);
            idx_j = uint16(randj);

            if idx_i < 1 
                idx_i = 1;
            elseif idx_i > size(freespace,1)
                idx_i = size(freespace,1);
            end
    
            if idx_j < 1 
                idx_j = 1;
            elseif idx_j > size(freespace,2)
                idx_j = size(freespace,2);
            end

        end

        p(i).x = randi;
        p(i).y = randj;
        p(i).theta = rando;
        
    end

    particles = p;

end

