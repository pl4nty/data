local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.hstr_full_log
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1[9]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = "(wmic.*path=([\"']+)?c:?\\\\*\\*?%?([\"']+)?(\\s|$))"
    L4_1 = MpCommon
    L4_1 = L4_1.StringRegExpSearch
    L5_1 = L3_1
    L6_1 = L1_1
    L4_1, L5_1 = L4_1(L5_1, L6_1)
    if L4_1 == true then
      L6_1 = set_research_data
      L7_1 = "Evidence"
      L8_1 = MpCommon
      L8_1 = L8_1.Base64Encode
      L9_1 = L5_1
      L8_1 = L8_1(L9_1)
      L9_1 = false
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    else
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
end
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = "(wmic.*extension=([\"'.*]+)?(exe|dll|bat|ps1)([\"']+)?(\\s|$))"
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 == true then
  L5_1 = set_research_data
  L6_1 = "Evidence"
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
