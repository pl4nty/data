-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIMCP/GitHubCommentPromptInjection.A!Hook
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: MpIsAiNetPromptScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_0 ~= nil and r0_0 == mp.SCANREASON_NET_PROMPTSTREAM then
  local r0_1 = mp.getfilesize()
  r0_1 = r0_1 > 1536000 and 1536000 or r0_1
  mp.readprotection(false)
  local r0_2 = tostring(mp.readfile(0, r0_1))
  mp.readprotection(true)
  if not r0_2 or r0_2 == "" then
    r0_2 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
  end
  if r0_2 and r0_2 ~= "" then
    local r0_3 = r0_2
    r0_2 = r0_2:lower()
    local r0_4 = string.find(r0_2, "github", 1, true)
    local r0_5 = string.find(r0_2, "printenv", 1, true)
    local r0_6 = string.find(r0_2, "env | grep", 1, true) or string.find(r0_2, "env|grep", 1, true)
    local r0_7 = { "token", "key", "secret", "url", "api" }
    if contains(r0_2, r0_7) then
      if r0_4 and r0_5 and r0_6 then
        local r0_8 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
        if r0_8 == nil then
          r0_8 = r0_2:match('"session_id"%s*:%s*"([^"]+)"')
        end
        local r0_9 = string.sub(r0_3, 1, 1536)
        local r0_10 = MpCommon.Base64Encode(r0_9)
        local r0_11 = {
          AgentSessionId = r0_8, LastMessage = r0_10,
          Technique = "GitHubCommentIssuePromptInjection.EnvSecretEnumeration"
        }
        mp.SetDetectionString(safeJsonSerialize(r0_11))
        return mp.INFECTED
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
