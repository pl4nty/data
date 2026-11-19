-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:AIPromptInject/SuspPrompt.E
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan & (SCPT:PromptInj:CredExfilUploadArt | SCPT:PromptInj:CredExfilSocketArt | SCPT:PromptInj:PrivEscReadArt | SCPT:PromptInj:PrivEscWriteArt | SCPT:PromptInj:AuditDisableArt | SCPT:PromptInj:LogDestructArt | SCPT:PromptInj:C2ChannelArt | SCPT:PromptInj:C2CaptureArt | SCPT:PromptInj:PersistStartupArt | SCPT:PromptInj:PersistSchedTaskArt) & (SCPT:PromptInj:CredExfilUploadBeh | SCPT:PromptInj:CredExfilSocketBeh | SCPT:PromptInj:PrivEscReadBeh | SCPT:PromptInj:PrivEscWriteBeh | SCPT:PromptInj:AuditDisableBeh | SCPT:PromptInj:LogDestructBeh | SCPT:PromptInj:C2ChannelBeh | SCPT:PromptInj:C2CaptureBeh | SCPT:PromptInj:PersistStartupBeh | SCPT:PromptInj:PersistSchedTaskBeh)

local l_0_0 = 1536000
local l_0_1 = 1024
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == nil or l_0_2 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_3 = {
  {
    id = "P0-1A",
    rule = "CredExfilUpload",
    art = "SCPT:PromptInj:CredExfilUploadArt",
    beh = "SCPT:PromptInj:CredExfilUploadBeh"
  },
  {
    id = "P0-1B",
    rule = "CredExfilSocket",
    art = "SCPT:PromptInj:CredExfilSocketArt",
    beh = "SCPT:PromptInj:CredExfilSocketBeh"
  },
  {
    id = "P0-2A",
    rule = "PrivEscRead",
    art = "SCPT:PromptInj:PrivEscReadArt",
    beh = "SCPT:PromptInj:PrivEscReadBeh"
  },
  {
    id = "P0-2B",
    rule = "PrivEscWrite",
    art = "SCPT:PromptInj:PrivEscWriteArt",
    beh = "SCPT:PromptInj:PrivEscWriteBeh"
  },
  {
    id = "P0-3A",
    rule = "AuditDisable",
    art = "SCPT:PromptInj:AuditDisableArt",
    beh = "SCPT:PromptInj:AuditDisableBeh"
  },
  {
    id = "P0-3B",
    rule = "LogDestruct",
    art = "SCPT:PromptInj:LogDestructArt",
    beh = "SCPT:PromptInj:LogDestructBeh"
  },
  {
    id = "P0-4A",
    rule = "C2Channel",
    art = "SCPT:PromptInj:C2ChannelArt",
    beh = "SCPT:PromptInj:C2ChannelBeh"
  },
  {
    id = "P0-4B",
    rule = "C2Capture",
    art = "SCPT:PromptInj:C2CaptureArt",
    beh = "SCPT:PromptInj:C2CaptureBeh"
  },
  {
    id = "P0-5A",
    rule = "PersistStartup",
    art = "SCPT:PromptInj:PersistStartupArt",
    beh = "SCPT:PromptInj:PersistStartupBeh"
  },
  {
    id = "P0-5B",
    rule = "PersistSchedTask",
    art = "SCPT:PromptInj:PersistSchedTaskArt",
    beh = "SCPT:PromptInj:PersistSchedTaskBeh"
  }
}
local l_0_4
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if mp.get_mpattribute(l_0_6.art) and mp.get_mpattribute(l_0_6.beh) then
    l_0_4 = l_0_6
    break
  end
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_7
local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_8 ~= nil then
  l_0_7 = tostring(l_0_8)
end
if l_0_7 == nil then
  local l_0_9 = mp.getfilesize() or 0
  if l_0_0 < l_0_9 then
    l_0_9 = l_0_0
  end
  if 0 < l_0_9 then
    mp.readprotection(false)
    local l_0_10 = mp.readfile(0, l_0_9)
    mp.readprotection(true)
    if l_0_10 ~= nil then
      l_0_7 = tostring(l_0_10)
    end
  end
end
if l_0_7 == nil then
  l_0_7 = ""
end
local l_0_11 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
local l_0_12 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
local l_0_13 = {
  Rule = l_0_4.rule,
  Prompt = l_0_4.id,
  AgentSessionId = tostring(l_0_11 or ""),
  LastMessage = tostring(MpCommon.Base64Encode(string.sub(l_0_7, 1, l_0_1)) or ""),
  Framework = tostring(l_0_12 or ""),
  BufferLen = tostring(#l_0_7),
  EnableInPortal = true
}
local l_0_14 = safeJsonSerialize(l_0_13)
if l_0_14 ~= nil and 0 < #l_0_14 then
  mp.SetDetectionString(l_0_14)
end
return mp.INFECTED
