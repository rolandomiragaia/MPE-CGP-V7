function initOffspring(this)

    offspring = cgptoolbox.Offspring(struct( ...
        'config', this.configuration_.config, ...
        'programInputs', this.configuration_.programInputs, ...
        'functionSet', {this.configuration_.functionSet}, ...
        'parameters', {this.configuration_.parameters} ...
    ));

    offspring.createOffspring();

    this.fittestSolution_ = offspring.getFittestSolution();

    this.configuration_.fittestSolution = this.fittestSolution_;
end