%read file
data = load('/Volumes/kovi ssd/egyetem/7.felev-szakdoga/THUMB/patients/pt5/awake/thumb2/pt5_5_5_awake_thumb_2.mat');      
lfpdataread = data.lfpdata;
%%

% delete 24th channel - was used to synch with other electrodes
lfpdataread(24,:) = [];

%%

%"delete" channel 14,15 for Pt4 (_v2)

lfpdataread([14 15], :) = 0; %will alter results

%%

% trim to 4 minutes
fs = 2000;                                  % 2000 Hz for Pt1,5,6, 20000 for others
dur_min = 4;                                 % desired length in minutes
n_keep = floor(dur_min * 60 * fs); 

n_keep = min(n_keep, size(lfpdataread, 2));  % safety check

%480000 or 4800000 long snippets
lfpdata = lfpdataread(:, 1:n_keep); %first4mins
%lfpdata = lfpdataread(:, 2*n_keep+1:3*n_keep); %from 8-12mins
%%
%save new data
save('pt5__5_5_awake_th2_4mins1.mat', 'lfpdata', '-v7.3');
%%
clc
clear
