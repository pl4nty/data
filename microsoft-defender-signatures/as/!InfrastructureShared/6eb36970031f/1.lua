local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = MpCommon
L0_1 = L0_1.EnumThreatHistory
L1_1 = ""
L2_1 = 7200
L3_1 = crypto
L3_1 = L3_1.bitor
L4_1 = MpCommon
L4_1 = L4_1.THREAT_HISTORY_CATEGORY_ASR
L5_1 = MpCommon
L5_1 = L5_1.THREAT_HISTORY_CATEGORY_NP
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.Severity
  if L6_1 ~= 5 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "Ransom_EnumThreatHistory"
  L8_1 = safeJsonSerialize
  L9_1 = L0_1
  L8_1 = L8_1(L9_1)
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
