local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_12
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_12::
L0_1 = L1_1.ppid
L2_1 = TrackPidAndTechniqueBM
L3_1 = L0_1
L4_1 = "T1562.002"
L5_1 = "event_logger_disable"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
