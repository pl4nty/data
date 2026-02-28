local L0_1, L1_1, L2_1, L3_1
L0_1 = nri
L0_1 = L0_1.GetURI
L0_1 = L0_1()
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "http[s]?://(%d+%.%d+%.%d+%.%d+)"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = isPublicIP
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
