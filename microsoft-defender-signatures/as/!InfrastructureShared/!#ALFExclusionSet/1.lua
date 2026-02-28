local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetResmgrBasePlugin
L0_1 = L0_1()
if L0_1 ~= "Regkeyvalue" then
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
L1_1 = {}
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Extensions"
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Extensions_Perf_Count = L4_1
  end
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Extensions"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Extensions_Policies_Count = L4_1
  end
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Paths_Perf_Count = L4_1
  end
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Paths_Policies_Count = L4_1
  end
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Processes"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Processes_Perf_Count = L4_1
  end
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Processes"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumValues
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = #L3_1
    L1_1.Processes_Policies_Count = L4_1
  end
end
L3_1 = set_research_data
L4_1 = "ExclusionsCount"
L5_1 = MpCommon
L5_1 = L5_1.Base64Encode
L6_1 = safeJsonSerialize
L7_1 = L1_1
L6_1, L7_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1)
L6_1 = false
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
