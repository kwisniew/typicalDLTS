function Cj = Cj(C0, delta_C, emmisionRate, t)
    %C0 and delta_C must have the same units!!
    Cj = C0-delta_C*exp(-emmisionRate*t); %units depends on input
end