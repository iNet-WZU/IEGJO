% Please refer to the main paper:
% Energy-saving access point configurations in WLANs: a swarm intelligent approach
% Long Chen, Fangyi Xu, Kezhong Jin and Zhenzhou Tang 
% The journal of Supercomputing , DOI: 
%        AND
% Nitish Chopra, Muhammad Mohsin Ansari 
% Golden jackal optimization: A novel nature-inspired optimizer for engineering applications
% Expert Systems with Applications, DOI: https://doi.org/10.1016/j.eswa.2022.116924
% _____________________________________________________
function [current_X] = Global_exploration(random_Jackal, E, ub, lb)
        current_X=(random_Jackal-(E)+rand()*((ub-lb)*rand+lb));    
end