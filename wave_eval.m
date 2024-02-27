
% main function for evaluation
function wave_eval()
    datavals_test = import_datavals('test_data');
    datavals_base = import_datavals('base_data');
    fprintf("Median F1 Test: %4.2f \nMedian F1 Base: %4.2f \n", ...
            median(datavals_test(1).f1, "omitnan"), ...
            median(datavals_base(1).f1, "omitnan"));
end

% function that imports information from a dataVals matrix
function datavals = import_datavals(directory)
    datavals_path = fullfile(directory, filesep, "dataVals.mat");
    try
        datavals = importdata(datavals_path).dataVals;
    catch ME
        if (strcmp(ME.identifier, 'MATLAB:nonExistentField'))
            datavals = importdata(datavals_path);
        else
            disp("ERROR: Could not extract dataVals from directory.")
            disp(datavals_path);
            disp(ME);
        end
    end 
end
