local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "^\\device\\cdrom[0-9][0-9]?$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = nil
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.GetLnkInfo
L4_1 = L4_1()
L2_1 = L4_1
L3_1 = L2_1.BasePath
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.ContextualExpandEnvironmentVariables
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L5_1 = L3_1
  L4_1 = L3_1.lower
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = MpCommon
  L4_1 = L4_1.ExpandEnvironmentVariables
  L5_1 = "%systemdrive%"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L6_1 = L4_1
    L5_1 = L4_1.lower
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L6_1 = L3_1
    L5_1 = L3_1.sub
    L7_1 = 1
    L8_1 = 2
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    if L5_1 == L4_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:OpenLnkCrossVolume_CdToSys"
      L5_1(L6_1)
      L1_1 = true
    end
  end
end
if not L1_1 then
  L4_1 = L2_1.RelativePath
  if L4_1 then
    L6_1 = L4_1
    L5_1 = L4_1.find
    L7_1 = "^%.%."
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:OpenLnkCrossVolume_CdToSysRel"
      L5_1(L6_1)
      L1_1 = true
    end
  end
end
if L1_1 then
  if L3_1 then
    L4_1 = mp
    L4_1 = L4_1.IsKnownFriendlyFile
    L5_1 = L3_1
    L6_1 = false
    L7_1 = false
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.ReportLowfi
      L5_1 = L3_1
      L6_1 = 441180191
      L4_1(L5_1, L6_1)
    end
  end
  if L2_1 then
    L4_1 = L2_1.Arguments
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.GetExecutablesFromCommandLine
      L5_1 = L2_1.Arguments
      L4_1 = L4_1(L5_1)
      if L4_1 then
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
            L10_1 = mp
            L10_1 = L10_1.IsKnownFriendlyFile
            L11_1 = L3_1
            L12_1 = false
            L13_1 = false
            L10_1 = L10_1(L11_1, L12_1, L13_1)
            if not L10_1 then
              L10_1 = mp
              L10_1 = L10_1.ReportLowfi
              L11_1 = L9_1
              L12_1 = 441180191
              L10_1(L11_1, L12_1)
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
