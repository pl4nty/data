local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = this_sigattrlog
L1_1 = L1_1[30]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = nil
  L2_1 = this_sigattrlog
  L2_1 = L2_1[30]
  L2_1 = L2_1.utf8p1
  if L2_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[30]
  L1_1 = L2_1.utf8p1
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "/%.[^/]+$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = TrackPidAndTechniqueBM
      L3_1 = "BM"
      L4_1 = "T1560.001"
      L5_1 = "Collection_ArchiveCollectedData_mt2023"
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = reportRelatedBmHits
      L2_1()
      if L0_1 ~= nil then
        L2_1 = L0_1.ppid
        if L2_1 ~= nil then
          L2_1 = bm
          L2_1 = L2_1.trigger_sig
          L3_1 = "BmTraverseTreeBlock"
          L4_1 = "Detected"
          L5_1 = L0_1.ppid
          L2_1(L3_1, L4_1, L5_1)
        end
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1560.001"
L4_1 = "Collection_ArchiveCollectedData_mt2023"
L1_1(L2_1, L3_1, L4_1)
L1_1 = reportRelatedBmHits
L1_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = bm
    L1_1 = L1_1.trigger_sig
    L2_1 = "BmTraverseTreeBlock"
    L3_1 = "Detected"
    L4_1 = L0_1.ppid
    L1_1(L2_1, L3_1, L4_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
