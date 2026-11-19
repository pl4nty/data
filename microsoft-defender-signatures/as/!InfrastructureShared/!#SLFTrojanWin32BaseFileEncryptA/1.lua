-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/BaseFileEncrypt.A
-- Type: 13
-- Includes: BasRQInfra, BasScenarioSpecificInfra
-- MpAttributes: RPF:TopLevelFile & !BM_MZ_FILE

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == "64eacc49-6a31-42c6-9b39-c3d9148e65f4" or l_0_0 == "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  return mp.CLEAN
end
if l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "(%.[^%.]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsBasFileEncryptExt(l_0_2) == false then
  return mp.CLEAN
else
  mp.set_mpattribute("MpDisableMOACSyncInsert")
  mp.set_mpattribute("MpDisableCaching")
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = MpCommon.PathToWin32Path(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4
local l_0_5 = false
if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) == 4 then
  local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
  if l_0_6 == nil or l_0_6 == "" or l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  l_0_4 = string.lower(l_0_6 .. "\\" .. l_0_7)
  l_0_5 = true
else
  local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_8 == nil or l_0_8 == "" then
    return mp.CLEAN
  end
  local l_0_9 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_9 == nil then
    return mp.CLEAN
  end
  local l_0_10 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_10 == nil or l_0_10 == "" then
    return mp.CLEAN
  end
  local l_0_11 = MpCommon.PathToWin32Path(l_0_10)
  if l_0_11 == nil then
    return mp.CLEAN
  end
  local l_0_12 = string.lower(l_0_11 .. "\\" .. l_0_9)
  l_0_4 = string.lower(l_0_8 .. "\\" .. l_0_12)
end
local l_0_13 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\OriginalNonExecFiles")) or 0
local l_0_14 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles")) or 0
local l_0_15 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\SmbNonExecFiles")) or 0
local l_0_16 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles")) or 0
if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_3) then
  l_0_13 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\OriginalNonExecFiles", 1)
elseif GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3) then
  l_0_14 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles", 1)
elseif GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_3) then
  l_0_15 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\SmbNonExecFiles", 1)
elseif GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_3) then
  l_0_16 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles", 1)
elseif l_0_5 then
  UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_3, "1")
  l_0_15 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\SmbNonExecFiles", 1)
elseif GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_4) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_4) then
  UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3, "1")
  l_0_14 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles", 1)
else
  UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_3, "1")
  l_0_16 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles", 1)
end
if 2 <= l_0_13 or 3 <= l_0_13 + l_0_14 or 4 <= l_0_13 + l_0_14 + l_0_15 + l_0_16 then
  MpCommon.BmTriggerSig(mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_BaseFileEncryptProcTel", l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
