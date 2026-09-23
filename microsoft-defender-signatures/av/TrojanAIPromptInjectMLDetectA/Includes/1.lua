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
    local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
    local l_0_11 = ((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID))
    local l_0_12 = nil
    if l_0_11 then
      l_0_12 = (MpCommon.GetProcessAttributeValue)(l_0_11, "AIDiscovery:Cpe")
      if l_0_12 == nil then
        l_0_12 = (MpCommon.GetProcessAttributeValue)(l_0_11, "inherit:AIDiscovery:Cpe")
      end
    end
    if l_0_7 ~= nil then
      local l_0_13 = {}
      l_0_13.AgentSessionId = l_0_7
      l_0_13.LastMessage = l_0_9
      local l_0_14 = tostring
      l_0_14 = l_0_14(l_0_10 or "")
      l_0_13.Framework = l_0_14
      l_0_14 = tostring
      l_0_14 = l_0_14(l_0_12 or "")
      l_0_13.CPEId = l_0_14
      l_0_13.EnableInPortal = true
      l_0_14 = safeJsonSerialize
      l_0_14 = l_0_14(l_0_13)
      if l_0_11 then
        (MpCommon.BmTriggerSig)(l_0_11, "AIPromptInjectML_MLDetect_A", l_0_14)
      end
      ;
      (mp.SetDetectionString)(l_0_14)
    end
    do
      do
        do
          local l_0_16 = nil
          -- DECOMPILER ERROR at PC135: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC137: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC141: Unhandled construct in 'MakeBoolean' P3

          if ((versioning.GetOrgID)() ~= nil and (versioning.GetOrgID)() ~= "" and (string.lower)((versioning.GetOrgID)()) == "1beec53c-4b52-4aec-a1b1-716d6da36984") or (string.lower)((versioning.GetOrgID)()) == "891a4168-8094-4df0-bb27-f44256f9f5ca" then
            return mp.INFECTED
          else
            return mp.LOWFI
          end
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC149: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

