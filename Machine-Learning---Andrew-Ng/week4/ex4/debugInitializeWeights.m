function W = debugInitializeWeights(output_neurons, input_neurons)
%   DEBUGINITIALIZEWEIGHTS Initialize the weights of a layer with fan_in
%   incoming connections and fan_out outgoing connections using a fixed
%   strategy, this will help you later in debugging.

%   W = DEBUGINITIALIZEWEIGHTS(output_neurons, input_neurons) initializes the weights 
%   of a layer with input_neurons incoming connections and output_neruons outgoing 
%   connections using a fix set of values.
%
%   Note that W should be set to a matrix of size(output_neurons, 1 + input_neurons) as
%   the first row of W handles the "bias" terms.
%

% Set W to zeros considering bias as well with the input neurons
W = zeros(output_neurons, 1 + input_neurons);

% Initialize W using "sin", this ensures that W is always of the same
% values and will be useful for debugging
W = reshape(sin(1:numel(W)), size(W)) / 10;
% =========================================================================

end
