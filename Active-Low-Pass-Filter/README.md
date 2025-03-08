# Active Low Pass Filter 8Khz

## MATLAB Test:-

```bash
clc; 
clear; 
close all;


R1 = 200;   % 200Ω
R2 = 200;   % 200Ω
R3 = 10e3;  % 10kΩ (For Op-Amp feedback)
R4 = 10e3;  % 10kΩ (For Op-Amp feedback)
C1 = 0.1e-6; % 0.1µF (100nF)
C2 = 0.1e-6; % 0.1µF (100nF)


fc = 1 / (2 * pi * sqrt(R1 * R2 * C1 * C2));
fprintf('Cutoff Frequency: %.2f Hz\n', fc);

%  (Laplace Domain)
s = tf('s');
H = 1 / (R1 * R2 * C1 * C2 * s^2 + (R1 + R2) * C1 * s + 1);

%  (Magnitude & Phase Response)
figure;
bode(H);
grid on;
title('Bode Plot of Active Low-Pass Filter (8kHz)');

% Frequency Response (Magnitude Plot)
figure;
freqs([1], [R1 * R2 * C1 * C2, (R1 + R2) * C1, 1]);
grid on;
title('Frequency Response of Active Low-Pass Filter (8kHz)');

% Step Response
figure;
step(H);
grid on;
title('Step Response of Active Low-Pass Filter (8kHz)');
```
<br>
<br>
<br>


<img src="./img/lpfckt.png">

<br>
<br>
<br>

<img src="./img/lpfcode.png">

<br>
<br>
<br>

<img src="./img/low-pass-bode.png">

<br>
<br>
<br>

<img src ="./img/low-pass-fr.png">

<br>
<br>
<br>

<img src="./img/low-pass-sr.png">