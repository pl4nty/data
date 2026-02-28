local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = AddResearchData
L2_1 = L0_1.ppid
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = MpCommon
L1_1 = L1_1.EnumThreatHistory
L2_1 = ""
L3_1 = 3600
L4_1 = crypto
L4_1 = L4_1.bitor
L5_1 = MpCommon
L5_1 = L5_1.THREAT_HISTORY_CATEGORY_ASR
L6_1 = MpCommon
L6_1 = L6_1.THREAT_HISTORY_CATEGORY_NP
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = next
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "EnumThreatHistory"
  L4_1 = safeJsonSerialize
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
