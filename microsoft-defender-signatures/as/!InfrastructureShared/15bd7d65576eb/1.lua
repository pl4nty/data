local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
if L1_1 then
  L2_1 = #L1_1
  if not (L2_1 < 200) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = LLMPromptGrader
L3_1 = L1_1
L2_1, L3_1 = L2_1(L3_1)
if L2_1 <= 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = false
if 215 <= L2_1 then
  L5_1 = L3_1.hasSuspPattern
  if L5_1 then
    L4_1 = true
  end
end
L3_1.Cmdline = L1_1
L5_1 = add_parents_mp
L5_1 = L5_1()
L3_1.Parents = L5_1
L5_1 = parent_mp_contains
L6_1 = L3_1.Parents
L7_1 = "curl"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = parent_mp_contains
  L6_1 = L3_1.Parents
  L7_1 = "wget"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    goto lbl_60
  end
end
L2_1 = L2_1 + 20
::lbl_60::
L5_1 = GetLLMModelFromCmd
L6_1 = L1_1
L5_1 = L5_1(L6_1)
L3_1.LLM_Info = L5_1
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L5_1 = L5_1()
L6_1 = safeJsonSerialize
L7_1 = L3_1
L8_1 = 150
L9_1 = nil
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L5_1 then
  L7_1 = L5_1.ppid
  if L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.BmTriggerSig
    L8_1 = L5_1.ppid
    L9_1 = "xplat_LLMPromptGrader"
    L10_1 = L6_1
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = set_research_data
L8_1 = "IsBlocking"
L9_1 = L4_1
L10_1 = false
L7_1(L8_1, L9_1, L10_1)
L7_1 = set_research_data
L8_1 = "Evidence"
L9_1 = MpCommon
L9_1 = L9_1.Base64Encode
L10_1 = L6_1
L9_1 = L9_1(L10_1)
L10_1 = false
L7_1(L8_1, L9_1, L10_1)
L7_1 = set_research_data
L8_1 = "LLM_Technology"
L9_1 = MpCommon
L9_1 = L9_1.Base64Encode
L10_1 = safeJsonSerialize
L11_1 = L3_1.LLM_Info
L10_1, L11_1 = L10_1(L11_1)
L9_1 = L9_1(L10_1, L11_1)
L10_1 = false
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
