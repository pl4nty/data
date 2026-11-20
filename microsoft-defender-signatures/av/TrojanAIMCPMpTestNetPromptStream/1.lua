-- Threat: Trojan:AIMCP/MpTestNetPromptStream
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = versioning.GetTestMode()
if r0_0 ~= 1779941598 and r0_0 ~= 61185 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_NET_PROMPTSTREAM then
  local r0_1, r0_2 = "MDE-NETPROMPTSTREAM-kiLFPWu9qkKOBe_bSzgDLA", 1536000
  local r0_3 = mp.getfilesize() or 0
  if r0_3 < 0 then
    return mp.CLEAN
  end
  if r0_2 < r0_3 then
    r0_3 = r0_2
  end
  local r0_4 = nil
  if r0_3 > 0 then
    mp.readprotection(false)
    r0_4 = mp.readfile(0, r0_3)
    mp.readprotection(true)
    if r0_4 ~= nil then
      r0_4 = tostring(r0_4)
    end
  end
  local r0_5 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
  if r0_5 ~= nil then
    r0_5 = tostring(r0_5):sub(1, r0_2)
  end
  local r0_6 = r0_5 and string.find(r0_5, r0_1, 1, true)
  local r0_7 = r0_6 or r0_4 and string.find(r0_4, r0_1, 1, true)
  if r0_7 then
    local r0_8 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
    if r0_8 == nil and r0_4 ~= nil then
      r0_8 = r0_4:match('"session_id"%s*:%s*"([^"]+)"')
    end
    if r0_8 ~= nil then
      local r0_9 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      local r0_10
      if r0_9 == nil then
        r0_10 = nil
      elseif MpCommon.GetProcessAttributeValue(r0_9, "AIDiscovery:Cpe") == nil then
        r0_10 = MpCommon.GetProcessAttributeValue(r0_9, "inherit:AIDiscovery:Cpe")
      else
        r0_10 = MpCommon.GetProcessAttributeValue(r0_9, "AIDiscovery:Cpe")
      end
      local r0_11 = {}
      r0_11.AgentSessionId = r0_8
      local r0_12 = MpCommon.Base64Encode
      r0_12 = r0_12((r0_5 or r0_4 or ""):sub(1, 1024))
      r0_11.LastMessage = r0_12
      r0_12 = r0_10 or ""
      r0_11.CPEId = r0_12
      local r0_13 = tostring
      r0_13 = r0_13(mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK) or "")
      r0_11.Framework = r0_13
      r0_11.EnableInPortal = true
      r0_13 = mp
      r0_13 = r0_13.SetDetectionString
      r0_13(safeJsonSerialize(r0_11))
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
