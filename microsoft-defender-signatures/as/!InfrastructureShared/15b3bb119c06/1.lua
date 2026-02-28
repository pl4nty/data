local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_current_process_startup_info
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      goto lbl_18
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_18::
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1.command_line
  L3_1 = nil
  L4_1 = nil
  L5_1 = 1
  L1_1(L2_1, L3_1, L4_1, L5_1)
  L1_1 = bm
  L1_1 = L1_1.get_process_relationships
  L1_1, L2_1 = L1_1()
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = bm
    L8_1 = L8_1.add_threat_process
    L9_1 = L7_1.ppid
    L8_1(L9_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
