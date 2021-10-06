function Nv = Nv(mh,T)
    h   = 6.62607004*10^(-34);% m^2 kg / s
    k   = 8.62*10^-5; %eV/K;
    pi  = 3.14159265359;
    eV_to_J = 1.60217662*10^(-19);
    %result will be in m^-3, and we want cm^-3, so we need to devide
    %everything by 10^6
    Nv = 2*(2*pi*mh*(k*eV_to_J)*T/(h^2))^(3/2)/10^6; %cm^-3
end