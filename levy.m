% Please refer to the main paper:
% Energy-saving access point configurations in WLANs: a swarm intelligent approach
% Long Chen, Fangyi Xu, Kezhong Jin and Zhenzhou Tang 
% The journal of Supercomputing , DOI: 
%        AND
% Nitish Chopra, Muhammad Mohsin Ansari 
% Golden jackal optimization: A novel nature-inspired optimizer for engineering applications
% Expert Systems with Applications, DOI: https://doi.org/10.1016/j.eswa.2022.116924
% _____________________________________________________
 
% Input parameters
% n     -> Number of steps 
% m     -> Number of Dimensions 
% beta  -> Power law index  % Note: 1 < beta < 2
% Output 
% z     -> 'n' levy steps in 'm' dimension

function [z] = levy(n,m,beta)

    num = gamma(1+beta)*sin(pi*beta/2); % used for Numerator 
    
    den = gamma((1+beta)/2)*beta*2^((beta-1)/2); % used for Denominator

    sigma_u = (num/den)^(1/beta);% Standard deviation

    u = random('Normal',0,sigma_u,n,m); 
    
    v = random('Normal',0,1,n,m);

    z =u./(abs(v).^(1/beta));

  
  end

