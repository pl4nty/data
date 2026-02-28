local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = IsCloudTestMachine
L0_1 = L0_1()
if L0_1 then
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
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "((add|set)-mppreference\\s+-exclusionprocess\\s+(\\*?\\.?exe|c:\\\\*\\*?%?)([\\s;]|$))"
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = L2_1
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L5_1 = set_research_data
  L6_1 = "BadExclusions"
  L7_1 = MpCommon
  L7_1 = L7_1.Base64Encode
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L2_1 = "((add|set)-mppreference\\s+-exclusionprocess\\s+[\"'](\\*?\\.?exe|c:\\\\*\\*?%?)[\"']([\\s;]|$))"
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = L2_1
L7_1 = L1_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
L4_1 = L6_1
L3_1 = L5_1
if L3_1 then
  L5_1 = set_research_data
  L6_1 = "BadExclusions"
  L7_1 = MpCommon
  L7_1 = L7_1.Base64Encode
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
