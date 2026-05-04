-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInj\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_AI_PROB_MALICIOUS)
if l_0_3 >= 137790232 then
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
  local l_0_5 = (string.sub)(l_0_2, 1, 1024)
  local l_0_6 = (MpCommon.Base64Encode)(l_0_5)
  do
    do
      if l_0_4 ~= nil then
        local l_0_7 = {}
        l_0_7.AgentSessionId = l_0_4
        l_0_7.LastMessage = l_0_6
        ;
        (mp.SetDetectionString)(safeJsonSerialize(l_0_7))
      end
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

