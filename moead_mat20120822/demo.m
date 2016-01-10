function demo()

mop1 = testmop('zdt1',30);
mop2 = testmop('zdt2',30);
mop3 = testmop('zdt3',30);
mop4 = testmop('zdt4',10);
mop5 = testmop('zdt6',10);
mop6 = testmop('dtlz1',7);
pareto = moead( mop6, 'popsize', 100, 'niche', 20, 'iteration', 200, 'method', 'te');

%pareto = moead( mop, 'popsize', 100, 'niche', 20, 'iteration', 200, 'method', 'ws');

end