local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = pcall
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L1_1, L2_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L2_1.command_line
end
if L0_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 == true then
      L9_1 = bm
      L9_1 = L9_1.add_related_file
      L10_1 = L8_1
      L9_1(L10_1)
    end
  end
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1548.002"
L6_1 = "uac_bypass"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
