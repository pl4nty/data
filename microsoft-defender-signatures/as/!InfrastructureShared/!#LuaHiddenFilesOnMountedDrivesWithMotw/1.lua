-- Threat: !InfrastructureShared
-- Name: !#Lua:HiddenFilesOnMountedDrivesWithMotw
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & (FILE_DEVICE_IS_MOUNTED | FILE_REMOVABLE_MEDIA | FILE_READ_ONLY_DEVICE | MpFileIsOnRemovableDrive)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or 2 < #l_0_0 or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0 .. "\\" .. l_0_1
local l_0_3 = MpCommon.GetMountedFileBackingFilePath(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("CC_filelist", l_0_3) then
  local l_0_4 = sysio.GetFileAttributes(l_0_2)
  if mp.bitand(l_0_4, 2) == 2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
