% Developed in MATLAB R2021b
% Source codes demo version 1.0
% _____________________________________________________
%  Author, inventor and programmer of IEGJO: Long Chen,
%  Email: chenlong@zjnu.edu.cn
%  Co-authors:Fangyi Xu, Kezhong Jin, Jun Li, Zhenzhou Tang,
% _____________________________________________________
% Please refer to the main paper:
% Energy-saving access point configurations in WLANs: a swarm intelligent approach
% Long Chen, Fangyi Xu, Kezhong Jin and Zhenzhou Tang 
% The journal of Supercomputing , DOI: 
%        AND
% Nitish Chopra, Muhammad Mohsin Ansari 
% Golden jackal optimization: A novel nature-inspired optimizer for engineering applications
% Expert Systems with Applications, DOI: https://doi.org/10.1016/j.eswa.2022.116924
% _____________________________________________________
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all 
close all
clc

N=30; % Number of search agents

Function_name='F23'; % Name of the test function 

T=1000; % Maximum number of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,CNVG]=IEGJO(N,T,lb,ub,dim,fobj);

%Draw objective space
figure,
hold on
semilogy(CNVG,'Color','b','LineWidth',4);
title('Convergence curve')
xlabel('Iteration');
ylabel('Best fitness obtained so far');
axis tight
grid off
box on
legend('IEGJO')

display(['The best location of EESHHO is: ', num2str(Best_pos)]);
display(['The best fitness of EESHHO is: ', num2str(Best_score)]);

        



