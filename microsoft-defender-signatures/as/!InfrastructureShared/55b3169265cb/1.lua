local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = L1_1
L2_1(L3_1)
L2_1 = add_parents
L2_1()
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.ContextualExpandEnvironmentVariables
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.sub
    L9_1 = L7_1
    L10_1 = -3
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 == ".js" then
      L8_1 = bm
      L8_1 = L8_1.add_threat_file
      L9_1 = L7_1
      L8_1(L9_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
