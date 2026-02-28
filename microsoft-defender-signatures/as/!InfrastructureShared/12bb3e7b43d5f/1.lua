local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = 0
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = GetTechniquesCountForPid
  L4_1 = L2_1.ppid
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
  if 4 < L0_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1.ppid
    L5_1 = "T1018"
    L6_1 = "Discovery_RemoteSystemDiscovery"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = addRelatedProcess
    L3_1()
    L3_1 = reportRelatedBmHits
    L3_1()
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
