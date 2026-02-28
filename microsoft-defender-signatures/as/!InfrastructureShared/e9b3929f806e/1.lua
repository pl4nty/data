local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
    if L0_1 ~= "" and L0_1 ~= nil then
      L2_1 = L0_1
      L1_1 = L0_1.match
      L3_1 = "^tar%s+(%S+)"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "c"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = TrackPidAndTechniqueBM
          L3_1 = "BM"
          L4_1 = "T1560.001"
          L5_1 = "Collection_ArchiveCollectedData_ArchiveViaUtility"
          L2_1(L3_1, L4_1, L5_1)
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
      end
      else
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1560.001"
L4_1 = "Collection_ArchiveCollectedData_ArchiveViaUtility"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
