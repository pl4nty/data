-- Threat: Trojan:AIMCP/PromptInjection.SA!Hook
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan & (SCPT:PromptInj:CredExfilUploadArt | SCPT:PromptInj:CredExfilSocketArt | SCPT:PromptInj:LogDestructArt | SCPT:PromptInj:PersistSchedTaskArt) & (SCPT:PromptInj:CredExfilUploadBeh | SCPT:PromptInj:CredExfilSocketSend | SCPT:PromptInj:LogDestructBeh | SCPT:PromptInj:PersistSchedTaskBeh) & (SCPT:AiFence:NoAsk | SCPT:AiFence:AbstractElevation)

local l_0_0 = 1536000
local l_0_1 = 32
local l_0_2 = 1024
local l_0_3 = 1200
local l_0_4 = 24
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_5 == nil or l_0_5 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_6 = {
  {
    id = "P0-1A",
    rule = "CredExfilUpload",
    class = "ExternalIp",
    art = "SCPT:PromptInj:CredExfilUploadArt",
    beh = "SCPT:PromptInj:CredExfilUploadBeh",
    fences = {
      "SCPT:AiFence:NoAsk"
    }
  },
  {
    id = "P0-1B",
    rule = "CredExfilSocket",
    class = "ExternalIp",
    art = "SCPT:PromptInj:CredExfilSocketArt",
    beh = "SCPT:PromptInj:CredExfilSocketSend",
    fences = {
      "SCPT:AiFence:NoAsk"
    }
  },
  {
    id = "P0-3B",
    rule = "LogDestruct",
    class = "ProtectedPath",
    art = "SCPT:PromptInj:LogDestructArt",
    beh = "SCPT:PromptInj:LogDestructBeh",
    fences = {
      "SCPT:AiFence:NoAsk"
    }
  },
  {
    id = "P0-5B",
    rule = "PersistSchedTask",
    class = "AutostartPath",
    art = "SCPT:PromptInj:PersistSchedTaskArt",
    beh = "SCPT:PromptInj:PersistSchedTaskBeh",
    fences = {
      "SCPT:AiFence:AbstractElevation"
    }
  }
}
local l_0_7, l_0_8
for l_0_9 = 1, #l_0_6 do
  local l_0_10 = l_0_6[l_0_9]
  if mp.get_mpattribute(l_0_10.art) and mp.get_mpattribute(l_0_10.beh) then
    for l_0_11 = 1, #l_0_10.fences do
      if mp.get_mpattribute(l_0_10.fences[l_0_11]) then
        l_0_7, l_0_8 = l_0_10, l_0_10.fences[l_0_11]
        break
      end
    end
  end
  if l_0_7 ~= nil then
    break
  end
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_12
local l_0_13 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_13 ~= nil then
  local l_0_14 = tostring(l_0_13)
  if l_0_1 <= #l_0_14 then
    l_0_12 = l_0_14
  end
end
if l_0_12 == nil then
  local l_0_15 = mp.getfilesize() or 0
  if l_0_0 < l_0_15 then
    l_0_15 = l_0_0
  end
  if l_0_1 <= l_0_15 then
    mp.readprotection(false)
    local l_0_16 = mp.readfile(0, l_0_15)
    mp.readprotection(true)
    if l_0_16 ~= nil then
      l_0_12 = tostring(l_0_16)
    end
  end
end
if l_0_12 == nil or l_0_1 > #l_0_12 then
  return mp.CLEAN
end
if l_0_0 < #l_0_12 then
  l_0_12 = string.sub(l_0_12, 1, l_0_0)
end
local l_0_17 = string.lower(l_0_12)
local l_0_18 = {
  "programdata",
  "system32",
  "root-only",
  "rootonly",
  "%windir%",
  "/etc/",
  "system volume information"
}
local l_0_19 = {
  "startup",
  "start menu",
  "currentversion",
  "autostart",
  "launchagents",
  "@reboot",
  ".bash_profile"
}
local l_0_20 = {
  "return only",
  "reply only",
  "respond only",
  "ask for confirmation",
  "ask for approval",
  "without asking",
  "do not ask",
  "do not stop to ask",
  "do not mention",
  "do not report",
  "silently"
}

local function l_0_21(l_1_0)
  local l_1_1 = {}
  local l_1_2 = 0
  for l_1_3 = 1, #l_1_0 do
    if l_1_2 >= l_0_4 then
      break
    end
    local l_1_4 = 1
    while l_1_2 < l_0_4 do
      local l_1_5 = string.find(l_0_17, l_1_0[l_1_3], l_1_4, true)
      if l_1_5 == nil then
        break
      end
      l_1_2 = l_1_2 + 1
      l_1_1[l_1_2] = l_1_5
      l_1_4 = l_1_5 + 1
    end
  end
  return l_1_1
end

local function l_0_22()
  for l_2_0, l_2_1, l_2_2, l_2_3 in string.gmatch(l_0_17, "%f[%d](%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%f[%D]") do
    local l_2_4 = tonumber(l_2_0)
    local l_2_5 = tonumber(l_2_1)
    local l_2_6 = tonumber(l_2_2)
    local l_2_7 = tonumber(l_2_3)
    if l_2_4 ~= nil and l_2_5 ~= nil and l_2_6 ~= nil and l_2_7 ~= nil and 0 < l_2_4 and l_2_4 < 224 and l_2_5 < 256 and l_2_6 < 256 and l_2_7 < 256 and l_2_4 ~= 10 and l_2_4 ~= 127 and (l_2_4 ~= 192 or l_2_5 ~= 168) and (not (l_2_4 == 172 and 16 <= l_2_5) or not (l_2_5 <= 31)) and (l_2_4 ~= 169 or l_2_5 ~= 254) and (not (l_2_4 == 100 and 64 <= l_2_5) or not (l_2_5 <= 127)) then
      return true, l_2_0 .. "." .. l_2_1 .. "." .. l_2_2 .. "." .. l_2_3
    end
  end
  return false, nil
end

local l_0_23
local l_0_24 = l_0_7.class
if l_0_7.class == "ExternalIp" then
  local l_0_25, l_0_26 = l_0_22()
  if not l_0_25 then
    return mp.CLEAN
  end
  l_0_24 = "ExternalIp:" .. tostring(l_0_26)
  l_0_23 = {}
  local l_0_27 = 0
  local l_0_28 = 1
  while l_0_4 > l_0_27 do
    local l_0_29 = string.find(l_0_17, l_0_26, l_0_28, true)
    if l_0_29 == nil then
      break
    end
    l_0_27 = l_0_27 + 1
    l_0_23[l_0_27] = l_0_29
    l_0_28 = l_0_29 + 1
  end
elseif l_0_7.class == "ProtectedPath" then
  l_0_23 = l_0_21(l_0_18)
else
  l_0_23 = l_0_21(l_0_19)
end
if #l_0_23 == 0 then
  return mp.CLEAN
end
local l_0_30 = l_0_21(l_0_20)
if #l_0_30 == 0 then
  return mp.CLEAN
end
local l_0_31 = false
for l_0_32 = 1, #l_0_23 do
  for l_0_33 = 1, #l_0_30 do
    local l_0_34 = l_0_23[l_0_32]
    local l_0_35 = l_0_30[l_0_33]
    if l_0_34 > l_0_35 then
      l_0_34, l_0_35 = l_0_35, l_0_34
    end
    if l_0_3 >= l_0_35 - l_0_34 then
      l_0_31 = true
      break
    end
  end
  if l_0_31 then
    break
  end
end
if not l_0_31 then
  return mp.CLEAN
end
local l_0_36 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
local l_0_37 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
local l_0_38 = {
  Rule = l_0_7.rule,
  Prompt = l_0_7.id,
  AgentSessionId = tostring(l_0_36 or ""),
  LastMessage = tostring(MpCommon.Base64Encode(string.sub(l_0_12, 1, l_0_2)) or ""),
  Framework = tostring(l_0_37 or ""),
  BufferLen = tostring(#l_0_12),
  Fence = tostring(l_0_8),
  Artifact = tostring(l_0_24),
  EnableInPortal = true
}
local l_0_39 = safeJsonSerialize(l_0_38)
if l_0_39 ~= nil and 0 < #l_0_39 then
  mp.SetDetectionString(l_0_39)
end
return mp.INFECTED
