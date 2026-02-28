local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1
  L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 ~= nil and L1_1 ~= "" then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = string
    L3_1 = L3_1.format
    L4_1 = "MpInternal_researchdata=fullcmd=%s"
    L5_1 = L1_1
    L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
    L2_1(L3_1, L4_1, L5_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
