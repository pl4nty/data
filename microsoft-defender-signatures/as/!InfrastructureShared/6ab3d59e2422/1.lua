local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = L0_1.image_path
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.ContextualExpandEnvironmentVariables
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = MpCommon
  L2_1 = L2_1.ExpandEnvironmentVariables
  L3_1 = "%windir%\\system32\\cmd.exe"
  L2_1 = L2_1(L3_1)
  if L1_1 == L2_1 then
    L3_1 = mp
    L3_1 = L3_1.GetParentProcInfo
    L4_1 = L0_1.ppid
    L3_1 = L3_1(L4_1)
    L4_1 = L3_1.image_path
    if L4_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.ContextualExpandEnvironmentVariables
      L5_1 = L3_1.image_path
      L4_1 = L4_1(L5_1)
      L5_1 = MpCommon
      L5_1 = L5_1.ExpandEnvironmentVariables
      L6_1 = "%windir%\\system32\\gpscript.exe"
      L5_1 = L5_1(L6_1)
      if L4_1 == L5_1 then
        L6_1 = mp
        L6_1 = L6_1.GetProcessCommandLine
        L7_1 = L0_1.ppid
        L6_1 = L6_1(L7_1)
        if L6_1 ~= nil then
          L8_1 = L6_1
          L7_1 = L6_1.match
          L9_1 = "\"[^\"]+\""
          L7_1 = L7_1(L8_1, L9_1)
          L8_1 = L7_1
          L7_1 = L7_1.gsub
          L9_1 = "\""
          L10_1 = ""
          L7_1 = L7_1(L8_1, L9_1, L10_1)
          if L7_1 then
            L8_1 = reportSessionInformation
            L8_1()
            L8_1 = bm
            L8_1 = L8_1.add_related_file
            L9_1 = L7_1
            L8_1(L9_1)
            L8_1 = mp
            L8_1 = L8_1.INFECTED
            return L8_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
