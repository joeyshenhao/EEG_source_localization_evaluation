function [YCDF,XCDF]=cdf_calculate(X_input)
    q_input = diag(X_input*X_input.');
    [YCDF,XCDF]=cdfcalc(q_input/max(q_input));
    XCDF = [0;XCDF];
end