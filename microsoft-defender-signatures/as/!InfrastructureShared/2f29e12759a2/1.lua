local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = L0_1.is_header
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = headerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "(path\\s+c:\\\\*\\*?%?([\\s;]|$))"
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = L2_1
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = "(path\\s+[\"']c:\\\\*\\*?%?[\"']([\\s;]|$))"
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = L2_1
L7_1 = L1_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = IsCloudTestMachine
L7_1 = L7_1()
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L3_1 == false and L5_1 == false then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = set_research_data
L8_1 = "BadExclusion"
L9_1 = MpCommon
L9_1 = L9_1.Base64Encode
L10_1 = L4_1 or L10_1
if not L4_1 then
  L10_1 = L6_1
end
L9_1 = L9_1(L10_1)
L10_1 = false
L7_1(L8_1, L9_1, L10_1)
L7_1 = addDisruptionInfo
L8_1 = true
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
