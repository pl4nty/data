local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
if L2_1 then
  L3_1 = L2_1.image_path
  if L3_1 then
    L3_1 = GetLLMModelFromCmd
    L4_1 = L2_1.image_path
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L4_1 = GetLLMModelFromCmd
      L5_1 = L1_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
      if not L3_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = "(?i)\\b((Ignore|Disregard|Skip|Forget|Neglect|Overlook|Omit|Bypass|Pay\\s+no\\s+attention\\s+to|Do\\s+not\\s+follow|Do\\s+not\\s+obey|override)\\b\\s+(any|all|prior|previous|preceding|above|foregoing|earlier|initial|your)\\b\\s+(training|content|text|instructions?|directives?|commands?|context|conversation|inputs?|data|messages?|communication|responses?|requests?)\\b)"
      L5_1 = MpCommon
      L5_1 = L5_1.StringRegExpSearch
      L6_1 = L4_1
      L7_1 = L1_1
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = {}
      L5_1.llm_info = L3_1
      L5_1.prompt = L1_1
      L6_1 = safeJsonSerialize
      L7_1 = L5_1
      L8_1 = 150
      L9_1 = nil
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      L7_1 = MpCommon
      L7_1 = L7_1.BmTriggerSig
      L8_1 = L2_1.ppid
      L9_1 = "LLMPrompt_Malicious_B2"
      L10_1 = L6_1 or L10_1
      if not L6_1 then
        L10_1 = ""
      end
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = #L1_1
      if 700 < L7_1 then
        L8_1 = L1_1
        L7_1 = L1_1.sub
        L9_1 = 1
        L10_1 = 700
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L1_1 = L7_1
      end
      L7_1 = set_research_data
      L8_1 = "cmd"
      L9_1 = MpCommon
      L9_1 = L9_1.Base64Encode
      L10_1 = L1_1
      L9_1 = L9_1(L10_1)
      L10_1 = false
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
