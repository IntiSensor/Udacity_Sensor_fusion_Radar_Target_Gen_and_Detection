% clear the variables in the workspace and clear the command window
clc;
clear;

% find the frequency components of a signal buried in noise
% Given information: f_sampling = 1 kHz; T_signal_duration = 1.5 s

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

% TODO: Form a signal containing a 77 Hz sinusoid of amplitude 0.7 and a 43Hz sinusoid of amplitude 2.
f1 = 77;                        % sampling frequency (Hz)
%f1 = 50;
A1 = 0.7;                       % amplitude of the signal  (A)
f2 = 43;                        % sampling frequency (Hz)
%f2 = 120;
A2 = 2;                         % amplitude of the signal  (A)                 
%A2 = 1;

S = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t);       % signal definition  

% Corrupt the signal with noise 
%X = S + 2*randn(size(t));
X = S;

% Plot the noisy signal in the time domain. It is difficult to identify the frequency components by looking at the signal X(t). 
plot(1000*t(1:50) ,X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

%%
% TODO : Compute the Fourier transform of the signal. 

Y = fft(X);
P2 = abs(Y/L);

% TODO : Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Plotting

% f = Fs*(0:(L-1))/L;
f = Fs*(0:(L/2))/L;
plot(f,P1); 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
