clc; 
clear; 
close all;


% High-Pass Section (2 kHz)
R1 = 800;   % 800Ω
R2 = 800;   % 800Ω
C1 = 0.1e-6; % 0.1µF (100nF)
C2 = 0.1e-6; % 0.1µF (100nF)

% Low-Pass Section (8 kHz)
R3 = 200;   % 200Ω
R4 = 200;   % 200Ω
C3 = 0.1e-6; % 0.1µF (100nF)
C4 = 0.1e-6; % 0.1µF (100nF)

% Compute Cutoff Frequencies
fc_low = 1 / (2 * pi * sqrt(R3 * R4 * C3 * C4));
fc_high = 1 / (2 * pi * sqrt(R1 * R2 * C1 * C2));
fprintf('High-Pass Cutoff: %.2f Hz\n', fc_high);
fprintf('Low-Pass Cutoff: %.2f Hz\n', fc_low);

% Transfer Functions
s = tf('s');

% High-Pass Filter Transfer Function
HPF = (R1 * R2 * C1 * C2 * s^2) / (R1 * R2 * C1 * C2 * s^2 + (R1 + R2) * C1 * s + 1);

% Low-Pass Filter Transfer Function
LPF = 1 / (R3 * R4 * C3 * C4 * s^2 + (R3 + R4) * C3 * s + 1);

% Combined Band-Pass Filter
BPF = HPF * LPF;

% Bode Plot
figure;
bode(BPF);
grid on;
title('Bode Plot of Active Band-Pass Filter (2kHz - 8kHz)');

% Frequency Response (Magnitude Plot)
figure;
freqs([1, 0, 0], [R1 * R2 * C1 * C2, (R1 + R2) * C1, 1]); % High-Pass
hold on;
freqs([1], [R3 * R4 * C3 * C4, (R3 + R4) * C3, 1]); % Low-Pass
grid on;
title('Frequency Response of Active Band-Pass Filter (2kHz - 8kHz)');
legend('High-Pass', 'Low-Pass');

% Step Response
figure;
step(BPF);
grid on;
title('Step Response of Active Band-Pass Filter (2kHz - 8kHz)');
