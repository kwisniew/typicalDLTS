function emmisionRate = emmisionRate(sig,v0,Nc,Ea,T)
    k   = 8.62*10^-5; %eV/K;
    emmisionRate = sig*v0*Nc*exp(-Ea/(k*T)); %s^-1
end