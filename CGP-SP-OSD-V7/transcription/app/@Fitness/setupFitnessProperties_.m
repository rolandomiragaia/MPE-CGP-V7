function [nodesResult, params, store] = setupFitnessProperties_(this, sizes)
    if isfield(sizes, 'nodes')
        nodesResult(sizes.nodes, this.config_.signal.fft_samples) = zeros();
        params = zeros(1, sizes.parameters);
    else
        nodesResult(sizes.NODES, this.config_.signal.fft_samples) = zeros();
        params = zeros(1, sizes.PARAMETERS);
    end


    store = struct ( ...
        'tp', struct ( ...
            'total', 0, ...
            'values', zeros(1, this.config_.signal.test_cases) ...
        ), ...
        'fp', struct ( ...
            'total', 0, ...
            'values', zeros(1, this.config_.signal.test_cases) ...
        ), ...
        'fn', struct ( ...
            'total', 0, ...
            'values', zeros(1, this.config_.signal.test_cases) ...
        ), ...
        'tn', struct ( ...
            'total', 0, ...
            'values', zeros(1, this.config_.signal.test_cases) ...
        ), ...
        'results', zeros( ...
            this.config_.signal.test_cases, ...
            size(nodesResult, 2) ...
        ), ...
        'threshold', this.threshold_ ...
    );

end
