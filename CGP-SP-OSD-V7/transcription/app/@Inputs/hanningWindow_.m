function outputSignal = hanningWindow_(~, samples, inputSignal)
    %janela hanning
    %sinal no tempo antes de aplicar a fft deve passar por esta janela
    %depois aplica-se a fft
    % [n, l] = size(input);
    
    %hanning window XXXXXXXXXXX;
    window = hann(samples); 
    
    %window = hamming(samples);
    
    outputSignal = inputSignal.*(window)';
end
