local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 ~= nil then
  L1_1 = "|.exe|.dll|docx|.doc|docm|.dot|dotm|.xls|xlsm|.xlt|xltm|.ppt|pptx|.pps|ppsm|.zip|"
  L2_1 = pcall
  L3_1 = bm_AddRelatedFileFromCommandLine
  L4_1 = L0_1.command_line
  L5_1 = L1_1
  L6_1 = 4
  L7_1 = 1
  L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = L0_1.ppid
L3_1 = "T1218"
L4_1 = "parent_msdt_url"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
