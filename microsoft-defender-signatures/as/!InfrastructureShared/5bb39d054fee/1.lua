local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = "OFFICE"
L2_1 = "EMAILCLIENT"
L3_1 = "WMI"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = {}
L1_1.min = 1
L1_1.max = 5
L2_1 = QueryProcContext
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
