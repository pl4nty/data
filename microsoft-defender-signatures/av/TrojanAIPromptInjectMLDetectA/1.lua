-- Threat: Trojan:AIPromptInject/MLDetect.A
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
local l_0_2 = 999999850
local l_0_3 = mp.CONTEXT_DATA_NET_PROMPT_AI_THRESHOLD_BLOCK
if l_0_3 ~= nil then
  local l_0_4, l_0_5 = pcall(mp.get_contextdata, l_0_3)
  if l_0_4 and l_0_5 ~= nil and 980000000 <= l_0_5 then
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
      CPEId = tostring(l_0_10 or ""),
      EnableInPortal = true
    }
    local l_0_12 = safeJsonSerialize(l_0_11)
    if l_0_9 then
      MpCommon.BmTriggerSig(l_0_9, "AIPromptInjectML_MLDetect_A", l_0_12)
    end
    mp.SetDetectionString(l_0_12)
  end
  local l_0_13 = versioning.GetOrgID()
  if l_0_13 ~= nil and l_0_13 ~= "" then
    l_0_13 = string.lower(l_0_13)
  end
  if l_0_13 == "1beec53c-4b52-4aec-a1b1-716d6da36984" or l_0_13 == "e7fdafff-652b-46c3-9f36-a510e063c2d5" or l_0_13 == "891a4168-8094-4df0-bb27-f44256f9f5ca" or l_0_13 == "c7d52edc-7d78-41dd-9aec-9300e5d3b607" or l_0_13 == "cdee90ad-b11a-4938-95f6-cee7775f12d6" or l_0_13 == "7f470839-2198-4f24-80b6-99628a21e66d" or l_0_13 == "6479d9e8-07fb-45f4-b852-3fbab344c52f" or l_0_13 == "2eecd5d9-bedb-453b-a94c-5159e5aa1f92" or l_0_13 == "96b4d52b-faa9-4e52-b6ff-76dfd864f7e2" or l_0_13 == "1d126571-4f73-4f6a-b0be-e90133fec49c" or l_0_13 == "59b0ab2c-2b47-48a6-92e7-e2cb693588b9" then
    return mp.INFECTED
  else
    return mp.LOWFI
  end
end
return mp.CLEAN
