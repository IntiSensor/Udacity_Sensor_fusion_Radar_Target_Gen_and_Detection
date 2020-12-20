%calculate the range in meters of four targets with respective 
%measured beat frequencies [0 MHz, 1.1 MHz, 13 MHz, 24 MHz].
%Given information: range_max = 300 m; delta_r = 1 m; c = 3 * 10^8 m/s

% TODO : Find the Bsweep of chirp for 1 m resolution
c = 3 * 10^8;               %speed of light (m/s)
delta_r = 1.0;              %range resolution (m)
B_sweep = c / (2 * delta_r);%sweep calculation

% TODO : Calculate the chirp time based on the Radar's Max Range
range_max = 300;                 %Maximum range (m)
T_s = 5.5 * (range_max * 2 / c); %Chirp time calculation

% TODO : define the frequency shifts 
b_freq = [0 1.1e6 13e6 24e6];                     %beat frequencies (MHz)
calculated_range = (c * T_s * b_freq)/(2 * B_sweep);   %Range calculation

% Display the calculated range
disp(calculated_range);