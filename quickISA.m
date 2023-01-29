function [out] = quickISA(h)
    hlower = floor(h/1000)*1000;
    hupper = hlower + 1000;
    ISA = readtable("ISA.xlsx");
    TSL = 288;
    PSL = 101300;
    dSL = 1.22506;
    R = 287;

    rowlower = ISA.Alt_ft_ == hlower;
    rowupper = ISA.Alt_ft_ == hupper;

    pr_l = ISA{rowlower,5};
    pr_u = ISA{rowupper,5};

    tr_l = ISA{rowlower,6};
    tr_u = ISA{rowupper,6};

    dr_l = ISA{rowlower,7};
    dr_u = ISA{rowupper,7};

    pr = pr_l + (h-hlower) * (pr_u - pr_l)/(hupper-hlower);
    tr = tr_l + (h-hlower) * (tr_u - tr_l)/(hupper-hlower);
    dr = dr_l + (h-hlower) * (dr_u - dr_l)/(hupper-hlower);

    P = PSL * pr;
    T = TSL * tr;
    d = dSL * dr;

    out = ['Pressure = ', num2str(P),' Pa, Density = ', num2str(d),' kg/m^3, Temperature = ', num2str(T),' K.'];

end
