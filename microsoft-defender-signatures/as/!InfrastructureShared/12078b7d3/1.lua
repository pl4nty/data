local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 8 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "HSTR:TrojanProxy:Win32/Banker.AU"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
