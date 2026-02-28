local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L1_1.command_line
  L4_1 = nil
  L5_1 = nil
  L6_1 = 1
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1.ppid
  L4_1 = "T1059.001"
  L5_1 = "amsi_bypass"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
