-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIPromptInjectMLDetectA\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_AI_PROB_MALICIOUS)
if l_0_2 >= 999999850 then
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
  local l_0_4 = (string.sub)(l_0_1, 1, 1024)
  local l_0_5 = (MpCommon.Base64Encode)(l_0_4)
  do
    if l_0_3 ~= nil then
      local l_0_6 = {}
      l_0_6.AgentSessionId = l_0_3
      l_0_6.LastMessage = l_0_5
      ;
      (mp.SetDetectionString)(safeJsonSerialize(l_0_6))
    end
    do
      local l_0_7 = (versioning.GetOrgID)()
      if l_0_7 ~= nil and l_0_7 ~= "" then
        l_0_7 = (string.lower)(l_0_7)
      end
      if l_0_7 == "1beec53c-4b52-4aec-a1b1-716d6da36984" or l_0_7 == "25044e66-9451-403b-a3a6-1cb863e3d45e" then
        return mp.INFECTED
      else
        return mp.LOWFI
      end
      return mp.CLEAN
    end
  end
end

