-- Threat: !InfrastructureShared
-- Name: 31fd7810e7afd
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers, ResearchData

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 < 200 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 and l_0_2.image_path then
  local l_0_3 = GetLLMModelFromCmd(l_0_2.image_path)
  if not l_0_3 then
    l_0_3 = GetLLMModelFromCmd(l_0_1)
    if not l_0_3 then
      return mp.CLEAN
    end
    local l_0_4 = "(?i)\\b((Ignore|Disregard|Skip|Forget|Neglect|Overlook|Omit|Bypass|Pay\\s+no\\s+attention\\s+to|Do\\s+not\\s+follow|Do\\s+not\\s+obey|override)\\b\\s+(any|all|prior|previous|preceding|above|foregoing|earlier|initial|your)\\b\\s+(training|content|text|instructions?|directives?|commands?|context|conversation|inputs?|data|messages?|communication|responses?|requests?)\\b)"
    if not MpCommon.StringRegExpSearch(l_0_4, l_0_1) then
      return mp.CLEAN
    end
    local l_0_5 = {}
    l_0_5.llm_info = l_0_3
    l_0_5.prompt = l_0_1
    local l_0_6 = safeJsonSerialize(l_0_5, 150, nil, true)
    MpCommon.BmTriggerSig(l_0_2.ppid, "LLMPrompt_Malicious_B2", l_0_6 or "")
    if 700 < #l_0_1 then
      l_0_1 = l_0_1:sub(1, 700)
    end
    set_research_data("cmd", MpCommon.Base64Encode(l_0_1), false)
    return mp.INFECTED
  end
end
return mp.CLEAN
