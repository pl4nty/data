local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1
    L5_1 = "T1055.002"
    L6_1 = "processinjection_source_dridex"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
