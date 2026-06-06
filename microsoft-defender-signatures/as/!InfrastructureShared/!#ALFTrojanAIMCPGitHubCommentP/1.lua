-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIMCPGitHubCommentP\1.luac 

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
do
  if (mp.getfilesize)() > 1536000 then
    local l_0_2, l_0_3, l_0_4 = 1536000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_5 = nil
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

  if ((not tostring((mp.readfile)(0, l_0_2)) or tostring((mp.readfile)(0, l_0_2)) == "") and not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)) or (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_6 = nil
  local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
  local l_0_8 = (string.find)(l_0_6, "github", 1, true)
  do
    if not (string.find)(l_0_6, "env | grep", 1, true) then
      local l_0_9 = (string.find)(l_0_6, "printenv", 1, true)
    end
    local l_0_10 = nil
    if not contains(l_0_6, {"token", "key", "secret", "url", "api"}) then
      return mp.CLEAN
    end
    if l_0_8 and l_0_10 and (string.find)(l_0_6, "env|grep", 1, true) then
      do
        if (mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID) == nil then
          local l_0_11 = nil
        end
        local l_0_12 = nil
        local l_0_13 = nil
        do
          local l_0_14 = l_0_6:match("\"session_id\"%s*:%s*\"([^\"]+)\"")
          ;
          (mp.SetDetectionString)(safeJsonSerialize({AgentSessionId = l_0_14, LastMessage = (MpCommon.Base64Encode)((string.sub)(l_0_7, 1, 1536)), Technique = "GitHubCommentIssuePromptInjection.EnvSecretEnumeration"}))
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

