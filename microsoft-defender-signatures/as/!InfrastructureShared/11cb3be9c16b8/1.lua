local L0_1, L1_1, L2_1
L0_1 = 30000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = addRelatedProcess
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
