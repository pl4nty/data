local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "HSTR:Win32/Emotet"
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
