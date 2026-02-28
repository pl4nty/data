local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 30000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1049"
L3_1 = "Discovery_SystemNetworkConnectionsDiscovery"
L0_1(L1_1, L2_1, L3_1)
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
