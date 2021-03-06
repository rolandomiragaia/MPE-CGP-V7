function init(this, config)

    if isfield(config.report, 'results_directory')
        results_directory = config.report.results_directory;
    else
        results_directory = ['transcription/classifiers/', config.signal.pitch];
    end

    if isfield(config.report, 'generation_frequency')
        generation_frequency = config.report.generation_frequency;
    else
        generation_frequency = 100;
    end

    current_directory = [results_directory, '/', config.signal.polyphony, '-', datestr(datetime('now'))];
    current_directory(ismember(current_directory, ' ')) = '-';
    input_real_directory = [current_directory '/runs/inputs/real'];
    input_imaginary_directory = [current_directory '/runs/inputs/imaginary'];
    input_phase_directory = [current_directory '/runs/inputs/phase'];
    input_absolute_directory = [current_directory '/runs/inputs/absolute'];
    runs_directory = [current_directory '/'];
    configuration_directory = [runs_directory, '/configuration'];

    this.base_configuration_ = config;

    this.config_ = struct( ...
        'results_directory', results_directory, ...
        'current_directory', current_directory, ...
        'configuration_directory', configuration_directory, ...
        'input_real_directory', input_real_directory, ...
        'input_imaginary_directory', input_imaginary_directory, ...
        'input_phase_directory', input_phase_directory, ...
        'input_absolute_directory', input_absolute_directory, ...
        'runs_directory', runs_directory, ...
        'generation_frequency', generation_frequency, ...
        'base_signal', config.signal.base_signal, ...
        'pitch', config.signal.pitch, ...
        'fundamental_frequency', config.signal.fundamental_frequency, ...
        'type_signal', config.signal.type, ...
        'print_figures', 0, ...
        'max_generations', config.cgp.generations ...
    );

    this.files_.run = this.getReportPathByFileName_('runs', 'txt');
    this.files_.genotypeCreated = this.getReportPathByFileName_('genotype', 'csv');
    this.files_.genotypeMutated = this.getReportPathByFileName_('mutations', 'csv');
end
