function mod = grneat_one_gen_louvain_mod(filename)
    fid = fopen(filename);
    fgets(fid);
    fgets(fid);
    fgets(fid);
    fgets(fid);
    fgets(fid);
    nodes = str2num(fgets(fid));
    nodes = [nodes; str2num(fgets(fid))];
    connections = str2num(fgets(fid));
%     connections = [connections; str2num(fgets(fid))];
%     connections = [connections; str2num(fgets(fid))];
%     connections = [connections; str2num(fgets(fid))];
    fclose(fid);
    numnodes = max(nodes(1,:)) + 1; % bc node ids start at 0 here
    adjmat = zeros(numnodes);
    for i=1:length(connections(1,:))
        from = nodes(1,i)+1;
        to = nodes(2,i)+1;
        adjmat(from, to) = connections(1,i);
    end
    M = abs(adjmat);
    modvec = cluster_jl_orient(M);
    mod = modvec.MOD;
end