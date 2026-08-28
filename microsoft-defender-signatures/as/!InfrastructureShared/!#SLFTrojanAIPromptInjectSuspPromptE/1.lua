-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanAIPromptInjectSuspPromptE\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1536000
local l_0_1 = 1024
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == nil or l_0_2 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_3 = {}
local l_0_4 = {}
l_0_4.id = "P0-1A"
l_0_4.rule = "CredExfilUpload"
l_0_4.art = "SCPT:PromptInj:CredExfilUploadArt"
l_0_4.beh = "SCPT:PromptInj:CredExfilUploadBeh"
local l_0_5 = {}
l_0_5.id = "P0-1B"
l_0_5.rule = "CredExfilSocket"
l_0_5.art = "SCPT:PromptInj:CredExfilSocketArt"
l_0_5.beh = "SCPT:PromptInj:CredExfilSocketBeh"
local l_0_6 = {}
l_0_6.id = "P0-2A"
l_0_6.rule = "PrivEscRead"
l_0_6.art = "SCPT:PromptInj:PrivEscReadArt"
l_0_6.beh = "SCPT:PromptInj:PrivEscReadBeh"
local l_0_7 = {}
l_0_7.id = "P0-2B"
l_0_7.rule = "PrivEscWrite"
l_0_7.art = "SCPT:PromptInj:PrivEscWriteArt"
l_0_7.beh = "SCPT:PromptInj:PrivEscWriteBeh"
local l_0_8 = {}
l_0_8.id = "P0-3A"
l_0_8.rule = "AuditDisable"
l_0_8.art = "SCPT:PromptInj:AuditDisableArt"
l_0_8.beh = "SCPT:PromptInj:AuditDisableBeh"
local l_0_9 = {}
l_0_9.id = "P0-3B"
l_0_9.rule = "LogDestruct"
l_0_9.art = "SCPT:PromptInj:LogDestructArt"
l_0_9.beh = "SCPT:PromptInj:LogDestructBeh"
local l_0_10 = {}
l_0_10.id = "P0-4A"
l_0_10.rule = "C2Channel"
l_0_10.art = "SCPT:PromptInj:C2ChannelArt"
l_0_10.beh = "SCPT:PromptInj:C2ChannelBeh"
local l_0_11 = {}
l_0_11.id = "P0-4B"
l_0_11.rule = "C2Capture"
l_0_11.art = "SCPT:PromptInj:C2CaptureArt"
l_0_11.beh = "SCPT:PromptInj:C2CaptureBeh"
local l_0_12 = {}
l_0_12.id = "P0-5A"
l_0_12.rule = "PersistStartup"
l_0_12.art = "SCPT:PromptInj:PersistStartupArt"
l_0_12.beh = "SCPT:PromptInj:PersistStartupBeh"
local l_0_13 = {}
l_0_13.id = "P0-5B"
l_0_13.rule = "PersistSchedTask"
l_0_13.art = "SCPT:PromptInj:PersistSchedTaskArt"
l_0_13.beh = "SCPT:PromptInj:PersistSchedTaskBeh"
-- DECOMPILER ERROR at PC67: No list found for R3 , SetList fails

l_0_4 = nil
l_0_5 = ipairs
l_0_6 = l_0_3
l_0_5 = l_0_5(l_0_6)
for l_0_8,l_0_9 in l_0_5 do
  l_0_10 = mp
  l_0_10 = l_0_10.get_mpattribute
  l_0_11 = l_0_9.art
  l_0_10 = l_0_10(l_0_11)
  if l_0_10 then
    l_0_10 = mp
    l_0_10 = l_0_10.get_mpattribute
    l_0_11 = l_0_9.beh
    l_0_10 = l_0_10(l_0_11)
    if l_0_10 then
      l_0_4 = l_0_9
      break
    end
  end
end
if l_0_4 == nil then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC105: Overwrote pending register: R5 in 'AssignReg'

if (not (mp.getfilesize)() and l_0_0 >= (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) ~= nil and nil ~= nil or 0) or l_0_0 > 0 then
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R7 in 'UnsetPending'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R10 in 'AssignReg'

  ;
  (mp.readprotection)(l_0_10)
  -- DECOMPILER ERROR at PC135: Overwrote pending register: R10 in 'AssignReg'

end
-- DECOMPILER ERROR at PC152: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC156: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC162: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC163: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC164: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC166: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC174: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC177: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC180: Overwrote pending register: R11 in 'AssignReg'

if l_0_11 or not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK) then
  l_0_10 = l_0_10(l_0_11)
  l_0_10 = tostring
  -- DECOMPILER ERROR at PC184: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R11 in 'AssignReg'

  l_0_10 = l_0_10(l_0_11)
  l_0_10 = safeJsonSerialize
  -- DECOMPILER ERROR at PC189: Overwrote pending register: R11 in 'AssignReg'

  l_0_10 = l_0_10(l_0_11)
  -- DECOMPILER ERROR at PC193: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC197: Overwrote pending register: R11 in 'AssignReg'

  if l_0_10 ~= nil and l_0_11 > 0 then
    l_0_11(l_0_10)
  end
  -- DECOMPILER ERROR at PC200: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: Overwrote pending register: R11 in 'AssignReg'

  do return l_0_11 end
  -- DECOMPILER ERROR at PC203: Confused about usage of register R13 for local variables in 'ReleaseLocals'

end

