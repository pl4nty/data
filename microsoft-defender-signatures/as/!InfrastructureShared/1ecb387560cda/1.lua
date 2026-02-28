local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[9]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = nil
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.utf8p1
  if L1_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L0_1 = L1_1.utf8p1
  if L0_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "/%.[^/]+$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = TrackPidAndTechniqueBM
      L2_1 = "BM"
      L3_1 = "T1105"
      L4_1 = "CommandandControl_IngressToolTransfer_mt2023"
      L1_1(L2_1, L3_1, L4_1)
      L1_1 = reportRelatedBmHits
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    else
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1105"
L3_1 = "CommandAndControl_IngressToolTransfer_mt2023"
L0_1(L1_1, L2_1, L3_1)
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
