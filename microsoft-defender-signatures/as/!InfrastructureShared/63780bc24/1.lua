local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = pe
L0_1 = L0_1.set_peattribute
L1_1 = "hstr_exhaustive"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = pe
L0_1 = L0_1.reemulate
L0_1()
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
