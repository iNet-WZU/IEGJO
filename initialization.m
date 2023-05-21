% Please refer to the main paper:
% Energy-saving access point configurations in WLANs: a swarm intelligent approach
% Long Chen, Fangyi Xu, Kezhong Jin and Zhenzhou Tang 
% The journal of Supercomputing , DOI: 
%        AND
% Nitish Chopra, Muhammad Mohsin Ansari 
% Golden jackal optimization: A novel nature-inspired optimizer for engineering applications
% Expert Systems with Applications, DOI: https://doi.org/10.1016/j.eswa.2022.116924
% _____________________________________________________

function [X]=initialization(N,dim,up,down)

if size(up,1)==1
    X=rand(N,dim).*(up-down)+down;
end
if size(up,1)>1
    for i=1:dim
        high=up(i);low=down(i);
        X(:,i)=rand(1,N).*(high-low)+low;
    end
end
end