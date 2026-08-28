-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectMLSuspDetectA\1.luac 

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
local l_0_2 = 137790232
local l_0_3 = mp.CONTEXT_NAME_NET_PROMPT_AI_THRESHOLD_LOFI
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
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
    local l_0_9 = (string.sub)(l_0_1, 1, 1024)
    local l_0_10 = (MpCommon.Base64Encode)(l_0_9)
    do
      if (MpCommon.GetProcessAttributeValue)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "AIDiscovery:Cpe") == nil then
        local l_0_11, l_0_12 = (MpCommon.GetProcessAttributeValue)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "inherit:AIDiscovery:Cpe")
      end
      if l_0_7 ~= nil then
        local l_0_13 = nil
        local l_0_14 = {AgentSessionId = l_0_7, LastMessage = l_0_10}
        l_0_14.Framework = tostring(l_0_8 or "")
        l_0_14.CPEId = tostring(l_0_13 or "")
        ;
        (mp.SetDetectionString)(safeJsonSerialize(l_0_14))
        set_research_data(safeJsonSerialize(l_0_14))
      end
      do
        do
          do
            do return mp.INFECTED end
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC121: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

