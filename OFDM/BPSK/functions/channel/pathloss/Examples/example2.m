%%
% Copyright 2019, Alexandros-Apostolos A. Boulogeorgos, All rights reserved
% 
%%

%% 
% Description: This script plots the expected path losses as a function of the
% carrier frequency for different values of pathloss exponent using the
% log-normal model.
%%

close all
clear all
% Simulation parameters
fc = [0.1:0.2:10];             % carrier frequency
fcUnits = 'GHz';    % units of carrier frequency
d0 = 1;             % reference distance
d0Units='m';        % units of reference distance
L = 0;              % additional losses
n = [1.8, 2, 2.5, 3, 3.5, 4]; % pathloss exponent 
d=10;    % transmission distance
dUnits='m';         % transmission distance unit

sprintf(' Reference distance: %d %s \n Transmission distance %d %s \n Additional losses: %d dB ', d0, d0Units, d, dUnits, L)


xl = ['f (', fcUnits,')'];       % x label sting
yl = 'Path loss (dB)';          % y label sting
lC =[ 'k','m','c','r','g','b']; % legend colors

% Initialization 
PLdB = zeros(length(n),length(fc));

cd ..
for ii=1:1:length(n)
    [ PLdB(ii,:) ] = logNormalPathlossModel( fc, fcUnits, d0, d0Units, L, n(ii), d, dUnits );
end
cd('Examples')


figure
for ii=1:1:length(n)
    plot(fc,PLdB(ii,:),lC(ii),'LineWidth',2)
    hold on
end
xlabel(xl)
ylabel(yl)
legend('n=1.8', 'n=2', 'n=2.5', 'n=3', 'n=3.5', 'n=4')
grid on