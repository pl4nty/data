local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
L3_1 = {}
L4_1 = "winlogon.exe"
L5_1 = "explorer.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
if L2_1 then
  L4_1 = L2_1.image_path
  if L4_1 then
    L4_1 = Contains_any_caseinsenstive
    L5_1 = L2_1.image_path
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L4_1 = LLMPromptGrader
L5_1 = L1_1
L4_1, L5_1 = L4_1(L5_1)
L6_1 = false
if 215 <= L4_1 then
  L7_1 = L5_1.hasSuspPattern
  if L7_1 then
    L6_1 = true
  end
end
if L4_1 <= 0 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L4_1 < 5 then
  L7_1 = #L1_1
  if L7_1 < 500 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L5_1.Cmdline = L1_1
L7_1 = add_parents_mp
L7_1 = L7_1()
L5_1.Parents = L7_1
L7_1 = parent_mp_contains
L8_1 = L5_1.Parents
L9_1 = "curl"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = parent_mp_contains
  L8_1 = L5_1.Parents
  L9_1 = "wget"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    goto lbl_84
  end
end
L4_1 = L4_1 + 20
::lbl_84::
L5_1.IsBlocking = L6_1
L7_1 = GetLLMModelFromCmd
L8_1 = L1_1
L7_1 = L7_1(L8_1)
L5_1.LLM_Info = L7_1
L7_1 = safeJsonSerialize
L8_1 = L5_1
L9_1 = 150
L10_1 = nil
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L2_1 then
  L8_1 = L2_1.ppid
  if L8_1 then
    L8_1 = MpCommon
    L8_1 = L8_1.BmTriggerSig
    L9_1 = L2_1.ppid
    L10_1 = "LLMPromptGrader"
    L11_1 = L7_1
    L8_1(L9_1, L10_1, L11_1)
  end
end
L8_1 = set_research_data
L9_1 = "IsBlocking"
L10_1 = L6_1
L11_1 = false
L8_1(L9_1, L10_1, L11_1)
L8_1 = set_research_data
L9_1 = "Evidence"
L10_1 = MpCommon
L10_1 = L10_1.Base64Encode
L11_1 = L7_1
L10_1 = L10_1(L11_1)
L11_1 = false
L8_1(L9_1, L10_1, L11_1)
L8_1 = set_research_data
L9_1 = "LLM_Technology"
L10_1 = MpCommon
L10_1 = L10_1.Base64Encode
L11_1 = safeJsonSerialize
L12_1 = L5_1.LLM_Info
L11_1, L12_1 = L11_1(L12_1)
L10_1 = L10_1(L11_1, L12_1)
L11_1 = false
L8_1(L9_1, L10_1, L11_1)
if L6_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.LOWFI
return L8_1
