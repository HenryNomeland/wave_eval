%%% main function for evaluation
%%% outputs a csv that is in the correct format for analysis comparisons
function wave_extract(input_dir, output_dir, output_filename, column_indices)

    % import the data and output formant metrics to output dir
    computer = wave_compute();
    extraction = computer.compute(input_dir, column_indices);
    
    % save files and printout to show that the function is finished
    [~, basename, ~] = fileparts(output_filename);
    save(fullfile(output_dir, basename), "extraction");
    writetable(struct2table(extraction), fullfile(output_dir, strcat(basename, ".csv")));
    fprintf("Extraction Successful!\n");
end