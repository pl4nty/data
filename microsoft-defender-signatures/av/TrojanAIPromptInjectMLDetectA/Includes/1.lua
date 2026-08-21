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
local l_0_2 = 999999850
local l_0_3 = mp.CONTEXT_NAME_NET_PROMPT_AI_THRESHOLD_BLOCK
do
  if l_0_3 ~= nil then
    local l_0_4, l_0_5 = pcall(mp.get_contextdata, l_0_3)
    if l_0_4 and l_0_5 ~= nil then
      l_0_2 = l_0_5
    end
  end
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_AI_PROB_MALICIOUS)
  if l_0_2 <= l_0_6 then
    local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
    local l_0_8 = (string.sub)(l_0_1, 1, 1024)
    local l_0_9 = (MpCommon.Base64Encode)(l_0_8)
    do
      if l_0_7 ~= nil then
        local l_0_10 = {}
        l_0_10.AgentSessionId = l_0_7
        l_0_10.LastMessage = l_0_9
        ;
        (mp.SetDetectionString)(safeJsonSerialize(l_0_10))
        set_research_data(safeJsonSerialize(l_0_10))
      end
      do
        local l_0_11 = (versioning.GetOrgID)()
        if l_0_11 ~= nil and l_0_11 ~= "" then
          l_0_11 = (string.lower)(l_0_11)
        end
        if l_0_11 == "1beec53c-4b52-4aec-a1b1-716d6da36984" or l_0_11 == "25044e66-9451-403b-a3a6-1cb863e3d45e" then
          return mp.INFECTED
        else
          return mp.LOWFI
        end
        return mp.CLEAN
      end
    end
  end
end

