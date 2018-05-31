clear; close all;
fname = 'peaches_16';
% fname = 'Do';
[x, fs] = audioread([fname '.wav']);
z = zeros(length(x),1);
x = x(:,1);
x = x/max(abs(x));
generation = 500;
population = 8;
%% Initial
initial = z;
cur_gen = 0;
window_len = 10;
hop = floor(window_len/2);
num_window = floor((length(x)-window_len)/hop) + 1;
tic
figure(1);
subplot(1,2,1);
plot(x);
title('Original sound');
xlabel('Samples')
set(gca,'xlim',[0 length(x)],'ylim',[-1 1]);
for w = 1:num_window
         [ out ] = mutate_v3( window_len, x((w-1)*hop+1:(w-1)*hop+window_len,1), population, generation);
         initial((w-1)*hop+1:(w-1)*hop+window_len,1) = out(:,1);
         
         subplot(1,2,2);
         plot(initial);
         xlabel('Samples')
         title(['Nth window : ' , num2str(w)]);
         set(gca,'xlim',[0 length(x)],'ylim',[-1 1]);
         drawnow;
end
toc
audiowrite(sprintf('%s_%d.wav',fname,window_len),initial,fs);
