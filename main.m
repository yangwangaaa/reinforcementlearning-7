clear all;
close all;
gridworld;
maxit = 600;

%Value Iteration
[v, pi, normV, it] = valueIteration(model, maxit);
it-1
figure()
plot(normV);
title('L3 Norm of the Value Function with Value Iteration');
xlabel('iteration');
ylabel('L3 Norm of V');

figure()
plotVP(v,pi,paramSet)
title('Greedy  policy  corresponding  to  the value function estimates with Value Iteration for the gridWorld') 

%Policy Iteration
[v, pi, normV, itTotal] = policyIteration(model,maxit);
length(itTotal)
sum(itTotal)
figure()
plot(normV);
title('L3 Norm of the Value Function with Policy Iteration');
xlabel('iteration');
ylabel('L3 Norm of V');
figure()
plotVP(v,pi,paramSet)
title('Greedy  policy  corresponding  to  the value function estimates with Policy Iteration for the gridWorld') 



clear all;
close all;
smallworld;
maxit = 2000;
maxeps = 500;

%SARSA with small world 
figure
for eps = 0.1:.2:1
[v, pi, cumulativeR, itEps, epsIt] = sarsa(model, maxit, maxeps)
hold on
plot(epsIt)
end
%legend('eps = 0.1', 'eps = 0.3', 'eps = 0.5','eps = 0.7','eps = 0.9', 'eps = 1/i')
%legend('a = 0.1', 'a = 0.3', 'a = 0.5','a = 0.7','a = 0.9', 'a = 1/i')

figure
for alpha = 0.1:.2:1
[v, pi, cumulativeR,  itEps, epsIt] = qLearning(model, maxit, maxeps)
hold on
plot(epsIt)
end

%cliffworld
clear all;
close all;
cliffworld;
maxit = 2000;
maxeps = 500;

itLengthSarsa = [];
crossCumRSarsa = zeros(10,500);
for i = 1:10
[v, pi, cumulativeR, itEps, epsIt] = sarsa(model, maxit, maxeps)
itLengthSarsa = [itLengthSarsa, epsIt]
crossCumRSarsa(i,:) = cumulativeR';
end
plotVP(v,pi,paramSet)

itLengthQL = [];
crossCumRQL = zeros(10,500);
for i = 1:10
[v, pi, cumulativeR, itEps, epsIt] = qLearning(model, maxit, maxeps)
itLengthQL = [itLengthQL, epsIt]
crossCumRQL(i,:) = cumulativeR';
end
plotVP(v,pi,paramSet)

figure
hold on
plot(sum(crossCumRSarsa)/10)
plot(sum(crossCumRQL)/10)



