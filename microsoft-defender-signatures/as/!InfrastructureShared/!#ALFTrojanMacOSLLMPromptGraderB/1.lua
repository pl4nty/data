local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L0_1 = L0_1 .. L1_1
L1_1 = LLMPromptGrader
L2_1 = L0_1
L1_1, L2_1 = L1_1(L2_1)
L3_1 = set_research_data
L4_1 = "GradingInfo"
L5_1 = table
L5_1 = L5_1.concat
L6_1 = L2_1
L7_1 = "|"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = false
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.BmTriggerSig
  L5_1 = L3_1
  L6_1 = "xplat_LLMPromptGrader_AMSI"
  L7_1 = safeJsonSerialize
  L8_1 = L2_1
  L7_1, L8_1 = L7_1(L8_1)
  L4_1(L5_1, L6_1, L7_1, L8_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
