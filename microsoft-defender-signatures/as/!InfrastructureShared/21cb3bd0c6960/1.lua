local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsProcessExcludedFromRansomwareAnalysis
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = IsDetectionThresholdMetLinux
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = AddResearchData
      L2_1 = "BM"
      L3_1 = true
      L1_1(L2_1, L3_1)
      L1_1 = reportRelatedBmHits
      L1_1()
      L1_1 = addRelatedProcess
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1082"
L4_1 = "Discovery"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
