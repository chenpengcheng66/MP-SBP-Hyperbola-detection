function output_signal = median_1D(input_signal, window_size)
    len = length(input_signal);
    output_signal = zeros(size(input_signal));
    half_window = floor(window_size / 2);

    for i = 1:len

        i_min = max(1, i - half_window);
        i_max = min(len, i + half_window);

        window = input_signal(i_min:i_max);

        output_signal(i) = median(window);
    end
end