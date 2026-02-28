local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 24 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "pea_enable_vmm_grow"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "do_exhaustivehstr_rescan"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "pea_deep_analysis"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      goto lbl_43
    end
  end
end
L0_1 = pe
L0_1 = L0_1.set_peattribute
L1_1 = "enable_vmm_grow"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = pe
L0_1 = L0_1.set_peattribute
L1_1 = "deep_analysis"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "do_exhaustivehstr_rescan"
L0_1(L1_1)
L0_1 = pe
L0_1 = L0_1.reemulate
L0_1()
::lbl_43::
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
