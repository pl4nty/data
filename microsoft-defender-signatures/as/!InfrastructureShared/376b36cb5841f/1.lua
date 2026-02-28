local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.command_line
  L3_1 = L1_1.ppid
  if L3_1 ~= nil then
    L4_1 = IsDetectionThresholdMet
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      if L2_1 ~= nil then
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = L2_1
        L4_1 = L4_1(L5_1)
        L2_1 = L4_1
        L4_1 = mp
        L4_1 = L4_1.GetExecutablesFromCommandLine
        L5_1 = L2_1
        L4_1 = L4_1(L5_1)
        L5_1 = ipairs
        L6_1 = L4_1
        L5_1, L6_1, L7_1 = L5_1(L6_1)
        for L8_1, L9_1 in L5_1, L6_1, L7_1 do
          L10_1 = mp
          L10_1 = L10_1.ContextualExpandEnvironmentVariables
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          L9_1 = L10_1
          L10_1 = sysio
          L10_1 = L10_1.IsFileExists
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = AddResearchData
            L11_1 = L3_1
            L12_1 = true
            L10_1(L11_1, L12_1)
            L10_1 = bm
            L10_1 = L10_1.add_related_file
            L11_1 = L9_1
            L10_1(L11_1)
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
