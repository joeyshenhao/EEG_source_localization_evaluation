function CDF_Area=cdfa(X_input)
    q_input = diag(X_input*X_input.');
    [YCDF,XCDF]=cdfcalc(q_input/max(q_input));
    CDF_Area = trapz([0;XCDF],YCDF);
end