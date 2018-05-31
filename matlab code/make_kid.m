function [make_kid,err_parent,err_child]= offspring(parent, child,ref,p_1,p_2)
err_parent = fitness(parent(p_1:p_2,1),ref(p_1:p_2,1));
err_child = fitness(child(p_1:p_2,1),ref(p_1:p_2,1));
if err_parent < err_child
    make_kid = parent;
else
    make_kid = child;
    disp('child win')
end
end