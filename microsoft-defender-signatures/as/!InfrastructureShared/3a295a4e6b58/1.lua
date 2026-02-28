local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = L0_1.match_offset
if L1_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.match_offset
L2_1 = 78
L3_1 = mp
L3_1 = L3_1.FOOTERPAGE_SZ
L4_1 = L1_1 + L2_1
if L3_1 < L4_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L0_1.is_footer
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.readfooter
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = L3_1
  L3_1 = L3_1.lower
  L3_1 = L3_1(L4_1)
  L4_1 = MpCommon
  L4_1 = L4_1.Base64Encode
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = set_research_data
  L6_1 = "PDID:C:B"
  L7_1 = L4_1
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
