local L0_1, L1_1
L0_1 = 3000000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = add_parents
L1_1()
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = addOverallNetworkVolume
L1_1()
L1_1 = reportSessionInformation
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
