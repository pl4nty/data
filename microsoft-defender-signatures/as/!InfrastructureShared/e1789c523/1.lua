local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 12 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 1 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "HSTR:Adware:Win32/EoRezo"
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "do_exhaustivehstr_rescan_onescan"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "do_vmmgrow_rescan"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
