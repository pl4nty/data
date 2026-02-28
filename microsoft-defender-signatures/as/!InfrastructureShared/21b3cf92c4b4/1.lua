local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = parseLogonEvent
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L0_1(L1_1)
  L1_1 = processPasswordChangeEvent
  L2_1 = L0_1
  L1_1(L2_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
