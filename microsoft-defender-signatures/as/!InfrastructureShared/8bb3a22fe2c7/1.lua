local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = bm_AddRelatedFileFromCommandLine
    L2_1 = L0_1.command_line
    L3_1 = nil
    L1_1(L2_1, L3_1)
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = L0_1.ppid
    L3_1 = "T1021.002"
    L4_1 = "proc_launch_from_share"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
