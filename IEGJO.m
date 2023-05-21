% Please refer to the main paper:
% Energy-saving access point configurations in WLANs: a swarm intelligent approach
% Long Chen, Fangyi Xu, Kezhong Jin and Zhenzhou Tang
% The journal of Supercomputing , DOI:
%        AND
% Nitish Chopra, Muhammad Mohsin Ansari
% Golden jackal optimization: A novel nature-inspired optimizer for engineering applications
% Expert Systems with Applications, DOI: https://doi.org/10.1016/j.eswa.2022.116924
% _____________________________________________________
function [Male_Jackal_score,Male_Jackal_pos,Convergence_curve]=IEGJO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

%% initialize Golden jackal pair
Male_Jackal_pos=zeros(1,dim);
Male_Jackal_score=inf;
Female_Jackal_pos=zeros(1,dim);
Female_Jackal_score=inf;

%% Initialize the positions of search agents
Positions=initialization(SearchAgents_no,dim,ub,lb);
Convergence_curve=zeros(1,Max_iter);
l=0;% Loop counter
%% Main loop
while l<Max_iter
    for i=1:size(Positions,1)
        % boundary checking
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        % Calculate objective function for each search agent
        fitness=fobj(Positions(i,:));
        % Update Male Jackal
        if fitness<Male_Jackal_score
            Male_Jackal_score=fitness;
            Male_Jackal_pos=Positions(i,:);
        end
        if fitness>Male_Jackal_score && fitness<Female_Jackal_score
            Female_Jackal_score=fitness;
            Female_Jackal_pos=Positions(i,:);
        end
    end

    E1=1.5*(1-(l/Max_iter));
    RL=0.05*levy(SearchAgents_no,dim,1.5);

    for i=1:size(Positions,1)
        r1=rand();
        E0=2*r1-1;
        E=E1*E0;            %EQ.(12)
        if abs(E)<1
            %% EXPLOITATION
            %Elite evolution strategy 
            sp=abs(E);
            if rand>=0.5
                for j=1:size(Positions,2)
                    r5=rand;
                    if r5<sp %Gene cross-recombination of elite chromosomes 
                        N2(1,j)=Female_Jackal_pos(1,j);
                    else
                        N2(1,j)=Male_Jackal_pos(1,j);
                    end
                end
                Positions(i,:)=N2+(normrnd(0,0.33333,1,dim).*abs(N2-Positions(i,:))); %EQ.(22)
            else
                %Two:Elite random mutation 
                j1=round(1+rand*(dim-1));
                GSnum=randn;
                LB=ones(1,dim).*lb;
                UB=ones(1,dim).*ub;
                V=((UB+LB)/2);
                for j=1:size(Positions,2)
                    r5=rand;
                    if r5<sp || j==j1
                        distance2Leader=abs(V(1,j)-Male_Jackal_pos(1,j));
                        Positions(i,j)=V(1,j)+(GSnum*distance2Leader);    %EQ.(23)
                    else
                        Positions(i,j)=Male_Jackal_pos(1,j);
                    end
                end
            end
        else
            %% EXPLORATION
            if rand<0.5
                for j=1:size(Positions,2) 
                    D_male_jackal=abs( (Male_Jackal_pos(j)- RL(i,j)*Positions(i,j)));%EQ.(15)
                    Male_Positions(i,j)=Male_Jackal_pos(j)-E*D_male_jackal;
                    D_female_jackal=abs( (Female_Jackal_pos(j)- RL(i,j)*Positions(i,j)));
                    Female_Positions(i,j)=Female_Jackal_pos(j)-E*D_female_jackal;
                    Positions(i,j)=(Male_Positions(i,j)+Female_Positions(i,j))/2;%EQ.(19)
                end
            else
                % The global search strategy EQ.(20)
                if randi(2)==1
                    random_Jackal =  Male_Jackal_pos;
                else
                    random_Jackal =  Female_Jackal_pos;
                end
                Positions(i,:) = Global_exploration(random_Jackal, E, ub, lb); %EQ.(20)
            end
        end
    end
    l=l+1;
    Convergence_curve(l)=Male_Jackal_score;
end
end