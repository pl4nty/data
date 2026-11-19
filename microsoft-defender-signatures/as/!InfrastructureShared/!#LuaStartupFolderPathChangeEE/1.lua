-- Threat: !InfrastructureShared
-- Name: !#Lua:StartupFolderPathChange.EE
-- Type: 12
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan & !Lua:FileInStartupFolder

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetPersistContextNoPath("BMLua:StartupFolderPathChange.EE")
if l_0_1 == nil or next(l_0_1) == nil or l_0_1[1] == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1[1]
if #l_0_2 <= 3 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = normalize_path(l_0_3)
l_0_2 = normalize_path(l_0_2)
if l_0_3 == nil or #l_0_3 <= 3 or l_0_2 == nil or #l_0_2 <= 4 then
  return mp.CLEAN
end
if l_0_3 == l_0_2 then
  mp.set_mpattribute("Lua:FileInStartupFolder")
  return mp.INFECTED
end
return mp.CLEAN
