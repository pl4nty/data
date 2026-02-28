local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1003.002"
L3_1 = "credentialdumping"
L0_1(L1_1, L2_1, L3_1)
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = L1_1.command_line
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = L2_1
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
      if L9_1 then
        L9_1 = bm
        L9_1 = L9_1.add_related_file
        L10_1 = L8_1
        L9_1(L10_1)
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
