% simply produce a little test density plot for some of the differences

function wave_plotting(compfile)
    comps = importdata(fullfile('results', compfile));
    ksdensity(comps.f1_mean_diff_dist)
end