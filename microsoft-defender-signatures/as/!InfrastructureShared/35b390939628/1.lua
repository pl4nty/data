local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L0_1 = L1_1.ppid
end
if L0_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L0_1
  L4_1 = "T1027"
  L5_1 = "tt-thresholdmet"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
