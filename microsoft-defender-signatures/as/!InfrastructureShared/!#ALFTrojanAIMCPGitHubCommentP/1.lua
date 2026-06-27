-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIMCPGitHubCommentP\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
do
  if (mp.getfilesize)() > 1536000 then
    local l_0_1, l_0_2, l_0_3 = 1536000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

  if ((not tostring((mp.readfile)(0, l_0_1)) or tostring((mp.readfile)(0, l_0_1)) == "") and not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)) or (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_5 = nil
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
  local l_0_7 = (string.find)(l_0_5, "github", 1, true)
  do
    if not (string.find)(l_0_5, "env | grep", 1, true) then
      local l_0_8 = (string.find)(l_0_5, "printenv", 1, true)
    end
    local l_0_9 = nil
    if not contains(l_0_5, {"token", "key", "secret", "url", "api"}) then
      return mp.CLEAN
    end
    if l_0_7 and l_0_9 and (string.find)(l_0_5, "env|grep", 1, true) then
      do
        if (mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID) == nil then
          local l_0_10 = nil
        end
        local l_0_11 = nil
        local l_0_12 = nil
        do
          local l_0_13 = l_0_5:match("\"session_id\"%s*:%s*\"([^\"]+)\"")
          ;
          (mp.SetDetectionString)(safeJsonSerialize({AgentSessionId = l_0_13, LastMessage = (MpCommon.Base64Encode)((string.sub)(l_0_6, 1, 1536)), Technique = "GitHubCommentIssuePromptInjection.EnvSecretEnumeration"}))
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

