local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = GetRollingQueueKeys
L1_1 = "GODOT-PCK"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "[i] MALICIOUS COMMANDLINE: "
  L4_1 = L1_1.command_line
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = add_parents
  L2_1()
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
