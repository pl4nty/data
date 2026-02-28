local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1.ppid
  L4_1 = "T1560"
  L5_1 = "Collection"
  L6_1 = 7200
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = addRelatedProcess
  L2_1()
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
