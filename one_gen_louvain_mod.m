function mod = one_gen_louvain_mod(filename)
    fid = fopen(filename);
    nodegenes = str2num(fgets(fid));
    nodegenes = [nodegenes; str2num(fgets(fid))];
    fgets(fid);
    fgets(fid);
    connectiongenes = str2num(fgets(fid));
    connectiongenes = [connectiongenes; str2num(fgets(fid))];
    connectiongenes = [connectiongenes; str2num(fgets(fid))];
    connectiongenes = [connectiongenes; str2num(fgets(fid))];
    fclose(fid);
    numnodes = size(nodegenes, 2);
    adjmat = zeros(numnodes);
    for i=1:length(connectiongenes(2,:))
        from = find(nodegenes(2,:)==connectiongenes(2,i));
        to = find(nodegenes(2,:)==connectiongenes(3,i));
        adjmat(from, to) = connectiongenes(4,i);
    end
    M = abs(adjmat);
    %csvwrite('adjmat.csv', M, 1, 1);
    modvec = cluster_jl_orient(M);
    %make_adjmats(modvec, M);
    mod = modvec.MOD;
end