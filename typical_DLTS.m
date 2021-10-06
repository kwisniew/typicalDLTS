%% parameters %%%%
me  = 9.10938356*10^(-31);%kg
sig = 10^-15;%cm^2 - cross section (pl: przekrój czynny);
Ea  = 0.5; %eV
C0  = 10^-9; %F
delta_C = 10^-10; %F
Tmin = 150; %K
Tmax = 300; %K
DLTS_Temp = linspace(Tmin, Tmax, (Tmax-Tmin+1));
chosen_moments = [0.02, 0.05, 0.1, 0.2, 0.5]; %s
DLTS_ampl = zeros(length(chosen_moments), length(DLTS_Temp));

%% DLTS %%%% 
hold on
for j = 1:length(chosen_moments) 
  t1 = chosen_moments(j);
  t2 = chosen_moments(j)*100;
  for i = 1:length(DLTS_Temp)
      % C0 is not iportant since it is constant and, as we subtract 2
      % values, it will canceal out 
      DLTS_ampl(j,i) = Cj(C0,delta_C,emmisionRate(sig,v_th(me,DLTS_Temp(i)),Nc(me,DLTS_Temp(i)),Ea,DLTS_Temp(i)), t1) - ...
                       Cj(C0,delta_C,emmisionRate(sig,v_th(me,DLTS_Temp(i)),Nc(me,DLTS_Temp(i)),Ea,DLTS_Temp(i)), t2);
   
  end
  plot(DLTS_Temp(:),DLTS_ampl(j,:)*10^9);
end
hold off

%% Postprocessing
%find full width at half maximum od DLTS signal
for j=1:length(chosen_moments)
    % Find the half max value.
    halfMax = (min(abs(DLTS_ampl(j,:))) + max(abs(DLTS_ampl(j,:)))) / 2;
    % Find where the data first drops below half the max.
    index1 = find(abs(DLTS_ampl(j,:)) >= halfMax, 1, 'first');
    % Find where the data last rises above half the max.
    index2 = find(abs(DLTS_ampl(j,:)) >= halfMax, 1, 'last');
    fwhm = DLTS_Temp(index2) - DLTS_Temp(index1)
end