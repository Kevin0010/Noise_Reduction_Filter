close all; clear all; clc;

AudioSignal = audioread ('Audio_Sample.wav');
N = 10; %filter order
fc = 0.2; %freq cutoff

%highpass filter
highpass = fir1 (N, fc, 'high');
fvtool (highpass); %plot magnitude response of HP filter

%lowpass filter
lowpass = fir1 (N, fc, 'low');
fvtool (lowpass); %plot magnitude response of LP filter

%bandpass filter
bandpass = fir1 (N, [0.2 0.21], 'bandpass');
fvtool (bandpass); %plot magnitude response of BP filter

% plot signal in time domain (High Pass Filter)
figure(1)
subplot (2,1,1);
plot (AudioSignal);%plot signal before filtering
title ('Audio Signal Before Filtering');
SignalHighpass = filter (highpass,1, AudioSignal); %make signal after filtering
subplot (2,1,2);
plot (SignalHighpass); %plot signal after filltering
title ('Audio Signal After HighPass Filtering');

% plot signal in time domain (Low Pass Filter)
figure(2)
subplot (2,1,1);
plot (AudioSignal); %plot signal before filtering
title ('Audio Signal Before Filtering');
SignalLowpass = filter (lowpass,1, AudioSignal); %make signal after filtering
subplot (2,1,2);
plot (SignalLowpass); %plot signal after filltering
title ('Audio Signal After LowPass Filtering');

% plot signal in time domain (Band Pass Filter)
figure(3)
subplot (2,1,1);
plot (AudioSignal); %plot signal before filtering
title ('Audio Signal Before Filtering');
SignalBandpass = filter (bandpass,1, AudioSignal); %make signal after filtering
subplot (2,1,2);
plot (SignalBandpass); %plot signal after filltering
title ('Audio Signal After BandPass Filtering');

%plot signal in freq domain (High Pass Filter)
FsHp=fft(AudioSignal);
AFsHp=abs(FsHp);
figure (4)
subplot (2,1,1)
plot(AFsHp) %plot signal before High Pass filtering
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('Frequency-domain diagram before High Pass filtering');
Fs_filterHp=fft(SignalHighpass);
AFs_filterHp=abs(Fs_filterHp);
subplot (2,1,2)
plot(AFs_filterHp) %plot signal after High Pass filtering
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain diagram after High Pass filtering');

%plot signal in freq domain (Low Pass Filter)
FsLp=fft(AudioSignal);
AFsLp=abs(FsLp);
figure (5)
subplot (2,1,1)
plot(AFsLp) %plot signal before Low Pass filtering
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain diagram before Low Pass filtering');
Fs_filterLp=fft(SignalLowpass);
AFs_filterLp=abs(Fs_filterLp);
subplot (2,1,2)
plot(AFs_filterLp) %plot signal after Low Pass filtering
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain diagram after Low Pass filtering');

%plot signal in freq domain (Band Pass Filter)
FsBp=fft(AudioSignal);
AFsBp=abs(FsBp);
figure (6)
subplot (2,1,1)
plot(AFsBp) %plot signal before Band Pass filtering
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain diagram before Band Pass filtering');
Fs_filterBp=fft(SignalBandpass);
AFs_filterBp=abs(Fs_filterBp);
subplot (2,1,2)
plot(AFs_filterBp) %plot signal after Band Pass filtering
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain diagram after Band Pass filtering');
