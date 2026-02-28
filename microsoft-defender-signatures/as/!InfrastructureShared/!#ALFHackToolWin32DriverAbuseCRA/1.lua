local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L1_1 = MpCommon
L1_1 = L1_1.StringRegExpSearch
L2_1 = "(openhardwaremonitorlib|mpksldrv)"
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L0_1
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L1_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "ALF:HackTool:Win32/DriverAbuse"
L3_1 = L3_1(L4_1)
L4_1 = #L3_1
if 0 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESSDEVICEPATH
L5_1 = L5_1(L6_1)
L6_1 = MpCommon
L6_1 = L6_1.PathToWin32Path
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 == nil or L4_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L6_1 == "" or L4_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L4_1
L7_1 = L7_1(L8_1)
L4_1 = L7_1
L7_1 = L6_1
L8_1 = "\\"
L9_1 = L4_1
L7_1 = L7_1 .. L8_1 .. L9_1
L8_1 = MpCommon
L8_1 = L8_1.StringRegExpSearch
L9_1 = "(agentpackagemonitoring)"
L10_1 = L4_1
L8_1, L9_1 = L8_1(L9_1, L10_1)
L2_1 = L9_1
L1_1 = L8_1
if L1_1 == true then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.IsKnownFriendlyFile
L9_1 = mp
L9_1 = L9_1.getfilename
L9_1 = L9_1()
L10_1 = true
L11_1 = false
L8_1 = L8_1(L9_1, L10_1, L11_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "MpInternal_researchdata=parentProcessPath="
L10_1 = L7_1
L9_1 = L9_1 .. L10_1
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "MpInternal_researchdata=parentProcessName="
L10_1 = L4_1
L9_1 = L9_1 .. L10_1
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
