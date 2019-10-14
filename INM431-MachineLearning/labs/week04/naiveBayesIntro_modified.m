clear; clc;

X = [ 0 0 1 1 0 ;
1 0 1 0 0 ;
1 1 0 1 0 ;
1 1 0 0 0 ;
0 1 0 1 0 ;
0 0 1 0 0 ;
1 0 1 1 1 ;
1 1 0 1 1 ;
1 1 1 0 1 ;
1 1 1 0 1 ;
1 1 1 1 1 ;
1 0 1 0 1 ;
1 0 0 0 1 ];

Y = X(:,5);
X = X(:,1:4)'; % X in proper format now.
% class priors - Lecture 2 - pg 5, two priors, 
pS = sum (Y)/size(Y,1);     % all rows with Y = 1 - pg 5
pE = sum(1 - Y)/size(Y,1);  % all rows with Y = 0
% Lecture 2, pg 19 - same idea of max log likelihood
% mu parameter
phiS = X * Y / sum(Y);  % all instances for which attrib phi(i) and Y are both 1
                        % P (X/Y=1)
% mu parameter              
phiE = X * (1-Y) / sum(1-Y) ;  % all instances for which attrib phi(i) = 1 and Y = 0
                               % P(X/Y=0)
% 1-Y looks like
%     1
%     1
%     1
%     1
%     1
%     1
%     0
%     0
%     0
%     0
%     0
%     0
%     0
% test point 
x=[1 0 1 0]';  % test point 
              
% Bernoulli distribution: f = (p^k)((1-p)^(1-k))
% Remember our x here is a vector of binary values, so that 
% phiS.^x.*(1-phiS).^(1-x) below will yeild a vector with each element being 
% a probability. 
% Then prod can be used to multiply all the values in x, as follows: 
pxS = prod(phiS.^x.*(1-phiS).^(1-x));
pxE = prod(phiE.^x.*(1-phiE).^(1-x));
% Bayesian formula
pxSF = (pxS * pS ) / (pxS * pS + pxE * pE) %P(Y=1|X)
pxEF = (pxE * pE ) / (pxS * pS + pxE * pE) %P(Y=0|X) 
