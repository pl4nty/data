local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1 or L0_1
  if not L1_1 then
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "(.*)%->"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "%w+%->.*/(.*)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "%->(.*%.exe)$"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L0_1
    L4_1 = "%->(.*%.dll)$"
    L2_1 = L2_1(L3_1, L4_1)
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 259200
L4_1 = 1000
L5_1 = AppendToRollingQueue
L6_1 = "ArchivesWithExec_FileName"
L7_1 = L2_1
L8_1 = L1_1
L9_1 = L3_1
L10_1 = L4_1
L11_1 = 0
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L5_1 = string
L5_1 = L5_1.match
L6_1 = L2_1
L7_1 = "%.(.*)$"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = nil
if L5_1 == "exe" then
  L6_1 = ".dll"
else
  L6_1 = ".exe"
end
L7_1 = IsKeyInRollingQueue
L8_1 = "ArchivesWithExec_FileName"
L9_1 = L6_1
L10_1 = false
L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1, L10_1)
if not L7_1 or not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = ipairs
L11_1 = L9_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = L14_1.value
  if L15_1 == L1_1 then
    if L5_1 == "exe" then
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L14_1.key
      L17_1 = "loc.dll"
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 then
        L15_1 = Contains_any_caseinsenstive
        L16_1 = L2_1
        L17_1 = {}
        L18_1 = "U3BoostSvr"
        L19_1 = "USHSVC"
        L20_1 = "AgentInstall"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 then
          L15_1 = mp
          L15_1 = L15_1.set_mpattribute
          L16_1 = "DllSideLoading_VulnerableExe_Asus"
          L15_1(L16_1)
          L15_1 = mp
          L15_1 = L15_1.INFECTED
          return L15_1
        end
      end
    end
    if L5_1 == "dll" then
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L2_1
      L17_1 = "loc.dll"
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 then
        L15_1 = Contains_any_caseinsenstive
        L16_1 = L14_1.key
        L17_1 = {}
        L18_1 = "U3BoostSvr"
        L19_1 = "USHSVC"
        L20_1 = "AgentInstall"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 then
          L15_1 = mp
          L15_1 = L15_1.set_mpattribute
          L16_1 = "DllSideLoading_VulnerableExe_Asus"
          L15_1(L16_1)
          L15_1 = mp
          L15_1 = L15_1.INFECTED
          return L15_1
        end
      end
    end
    L15_1 = set_research_data
    L16_1 = "Evidence"
    L17_1 = MpCommon
    L17_1 = L17_1.Base64Encode
    L18_1 = L0_1
    L19_1 = "|"
    L20_1 = L14_1.key
    L18_1 = L18_1 .. L19_1 .. L20_1
    L17_1 = L17_1(L18_1)
    L18_1 = false
    L15_1(L16_1, L17_1, L18_1)
    L15_1 = "([^\\\\/?%*:|\"<>\\.][A-Za-z0-9._\\-\\+\\(\\)\\[\\]\\{\\}&~]*[^\\\\/?%*:|\"<>\\.]\\.(exe|dll)+$)"
    L16_1 = MpCommon
    L16_1 = L16_1.StringRegExpSearch
    L17_1 = L15_1
    L18_1 = L2_1
    L16_1, L17_1 = L16_1(L17_1, L18_1)
    L18_1 = MpCommon
    L18_1 = L18_1.StringRegExpSearch
    L19_1 = L15_1
    L20_1 = L14_1.key
    L18_1, L19_1 = L18_1(L19_1, L20_1)
    if L17_1 and L19_1 then
      L20_1 = nil
      L21_1 = nil
      if L6_1 == ".exe" then
        L21_1 = L19_1
        L20_1 = L17_1
      else
        L21_1 = L17_1
        L20_1 = L19_1
      end
      L22_1 = IsDllInExpectedPath
      L23_1 = L20_1
      L24_1 = L1_1
      L25_1 = L21_1
      L22_1, L23_1, L24_1 = L22_1(L23_1, L24_1, L25_1)
      if L24_1 then
        L25_1 = mp
        L25_1 = L25_1.set_mpattribute
        L26_1 = "DllSideLoading_VulnerableExe_"
        L27_1 = L24_1
        L26_1 = L26_1 .. L27_1
        L25_1(L26_1)
      end
      if L22_1 then
        L25_1 = mp
        L25_1 = L25_1.set_mpattribute
        L26_1 = "DllSideLoading_VulnerableDll_"
        L27_1 = L22_1
        L26_1 = L26_1 .. L27_1
        L25_1(L26_1)
      end
    end
    L20_1 = mp
    L20_1 = L20_1.INFECTED
    return L20_1
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
