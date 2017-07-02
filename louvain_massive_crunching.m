baseString1 = 'C:\Users\jessiehl\Documents\DEMO\GrandTheoryOfModularity\GPEAT2\results\eqn\';
baseString2 = 'C:\Users\jessiehl\Documents\DEMO\GrandTheoryOfModularity\GPEAT2\results\eqn2\';
%baseString3 = 'C:\Users\jessiehl\Documents\DEMO\GrandTheoryOfModularity\neat4j_1_0_src\results\retinaSeq2\';

[a1, a2, a3, a4] = louvain_across_runs(baseString1);
[b1, b2, b3, b4] = louvain_across_runs(baseString2);
%[c1, c2, c3, c4] = louvain_across_runs(baseString3);

ma1 = nanmean(a1);
ma2 = nanmean(a2);
ma3 = nanmean(a3);
ma4 = nanmean(a4);

mb1 = nanmean(b1);
mb2 = nanmean(b2);
mb3 = nanmean(b3);
mb4 = nanmean(b4);

% mc1 = nanmean(c1);
% mc2 = nanmean(c2);
% mc3 = nanmean(c3);
% mc4 = nanmean(c4);

va1 = nanvar(a1);
va3 = nanvar(a3);
va4 = nanvar(a4);

vb1 = nanvar(b1);
vb3 = nanvar(b3);
vb4 = nanvar(b4);

% vc1 = nanvar(c1);
% vc3 = nanvar(c3);
% vc4 = nanvar(c4);

figure;
errorbar(ma1,va1);
hold on;
errorbar(mb1,vb1);
%errorbar(mc1,vc1);

figure;
plot(ma2, 'o');
hold on;
plot(mb2, 'o');
%plot(mc2, 'o');

figure;
errorbar(ma3,va3);
hold on;
errorbar(mb3,vb3);
%errorbar(mc3,vc3);

figure;
errorbar(ma4,va4);
hold on;
errorbar(mb4,vb4);
%errorbar(mc4,vc4);

% figure;
% plot(ma1);
% hold on;
% plot(mb1);
% plot(mc1);
% 
% figure;
% plot(ma2, 'o');
% hold on;
% plot(mb2, 'o');
% plot(mc2, 'o');
% 
% figure;
% plot(ma3);
% hold on;
% plot(mb3);
% plot(mc3);
% 
% figure;
% plot(ma4);
% hold on;
% plot(mb4);
% plot(mc4);
