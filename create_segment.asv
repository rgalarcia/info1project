function [seg] = create_segment(i1, i2, w)
    Tsegment = struct('source', 0, 'destination', 0, 'weight', 0); % We create a structure of type Tsegment
    seg = Tsegment;

    if (i1 <= 0 || i2 <= 0 || w < 0) % We make sure that the data with which we are being provided is valid
        fprintf('Warning: source and destination nodes must be equal to or higher than 1. Weight can not be negative.');
    else % If it is valid, we create a segment of type Tsegment with the provided data
        seg.source = i1;
        seg.destination = i2;
        seg.weight = w;
    end
end