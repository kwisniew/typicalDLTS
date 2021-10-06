function v_th = v_th(me,T)
    k   = 8.62*10^-5; %eV/K;
    eV_to_J = 1.60217662*10^(-19);
    m_to_cm = 100;
    v_th = sqrt(3*k*eV_to_J*T/me)*m_to_cm; %cm/s
end