% main function for evaluation
function wave_extract(input_dir, output_dir, output_filename)

    % import the data and output formant metrics to output dir
    computer = wave_compute();
    extraction = computer.compute(input_dir);
    
    % save files and printout to show that the function is finished
    [~, basename, ~] = fileparts(output_filename);
    save(fullfile(output_dir, basename), "extraction");
    writetable(struct2table(extraction), fullfile(output_dir, strcat(basename, ".csv")));
    fprintf("Extraction Successful!\n");
end