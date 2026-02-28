local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(%a:\\[^\"]-%.ps1)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.ReportLowfi
    L4_1 = L2_1
    L5_1 = 1120308759
    L3_1(L4_1, L5_1)
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L2_1
    L3_1(L4_1)
  end
end
L3_1 = TrackCustomPersistContextNameByPPID
L4_1 = "set"
L5_1 = "bm"
L6_1 = "MimikatzTrigger"
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_action
L4_1 = "EmsScan"
L5_1 = 3000
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
