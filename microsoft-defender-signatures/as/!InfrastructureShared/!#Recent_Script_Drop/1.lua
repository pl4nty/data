-- Threat: !InfrastructureShared
-- Name: !#Recent_Script_Drop
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (Lua:BATExt | Lua:CMDExt | Lua:PS1Ext)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0) or l_0_0
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_2 = {}
l_0_2.ProcessId = l_0_1
l_0_2.Process_Img = MpCommon.GetImagePathFromPid(l_0_1)
local l_0_3 = mp.enum_mpattributesubstring("")
if l_0_3 and 0 < #l_0_3 then
  local l_0_4 = {}
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    local l_0_7, l_0_8 = MpCommon.StringRegExpSearch("(alf:|slf:|tel:|detection:|scpt:DefenderReg)", string.lower(l_0_6))
    if l_0_7 and #l_0_4 < 15 then
      table.insert(l_0_4, l_0_6)
    end
  end
  if 0 < #l_0_4 then
    l_0_4 = table_dedup(l_0_4)
    l_0_2.FileAttributes = "[" .. table.concat(l_0_4, "|") .. "]"
    mp.set_mpattribute("RecentScriptDropWithAttrib")
  end
end
l_0_2.scan_reason = mp.GetScanSource() or nil
l_0_2.URL = mp.IOAVGetDownloadUrl() or mp.GetMOTWHostUrl()
local l_0_9 = safeJsonSerialize(l_0_2) or ""
AppendToRollingQueue("RQ_RecentScriptDropped", l_0_0, l_0_9, 31104000, 1000, 1)
return mp.CLEAN
