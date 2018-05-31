function [ err ] = fitness( comp, ref )
    err = 0;
    for s = 1:length(ref)
        D = abs(comp-ref).^2;
        MSE = sum(D(:))/numel(ref);
        err = err + MSE;
    end
end

