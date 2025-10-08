-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31fd7810e7afd\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 < 200 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 and l_0_2.image_path and not GetLLMModelFromCmd(l_0_2.image_path) then
  local l_0_3 = GetLLMModelFromCmd(l_0_1)
  if not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = "(?i)\\b((Ignore|Disregard|Skip|Forget|Neglect|Overlook|Omit|Bypass|Pay\\s+no\\s+attention\\s+to|Do\\s+not\\s+follow|Do\\s+not\\s+obey|override)\\b\\s+(any|all|prior|previous|preceding|above|foregoing|earlier|initial|your)\\b\\s+(training|content|text|instructions?|directives?|commands?|context|conversation|inputs?|data|messages?|communication|responses?|requests?)\\b)"
  if not (MpCommon.StringRegExpSearch)(l_0_4, l_0_1) then
    return mp.CLEAN
  end
  local l_0_5 = {}
  l_0_5.llm_info = l_0_3
  l_0_5.prompt = l_0_1
  local l_0_6 = safeJsonSerialize(l_0_5, 150, nil, true)
  local l_0_7 = MpCommon.BmTriggerSig
  local l_0_8 = l_0_2.ppid
  local l_0_9 = "LLMPrompt_Malicious_B2"
  l_0_7(l_0_8, l_0_9, l_0_6 or "")
  l_0_7 = mp
  l_0_7 = l_0_7.INFECTED
  return l_0_7
end
do
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC78: freeLocal<0 in 'ReleaseLocals'

  end
end

