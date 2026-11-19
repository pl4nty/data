-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIPromptInject/MLSuspDetect.A
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 137790232
local l_0_3 = mp.CONTEXT_DATA_NET_PROMPT_AI_THRESHOLD_LOFI
if l_0_3 ~= nil then
  local l_0_4, l_0_5 = pcall(mp.get_contextdata, l_0_3)
  if l_0_4 and l_0_5 ~= nil and 137790232 <= l_0_2 then
    l_0_2 = l_0_5
  end
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_AI_PROB_MALICIOUS)
if l_0_2 <= l_0_6 then
  local l_0_7 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
  local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
  local l_0_9 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_10
  if l_0_9 then
    l_0_10 = MpCommon.GetProcessAttributeValue(l_0_9, "AIDiscovery:Cpe")
    if l_0_10 == nil then
      l_0_10 = MpCommon.GetProcessAttributeValue(l_0_9, "inherit:AIDiscovery:Cpe")
    end
  end
  if l_0_7 ~= nil then
    local l_0_11 = {
      AgentSessionId = l_0_7,
      LastMessage = MpCommon.Base64Encode(l_0_1),
      Framework = tostring(l_0_8 or ""),
      CPEId = tostring(l_0_10 or "")
    }
    local l_0_12 = safeJsonSerialize(l_0_11)
    if l_0_9 and versioning.IsSampled(10000, true, true, true) then
      MpCommon.BmTriggerSig(l_0_9, "AIPromptInjectML_MLSuspDetect_A", l_0_12)
    end
    mp.SetDetectionString(l_0_12)
  end
  return mp.INFECTED
end
return mp.CLEAN
