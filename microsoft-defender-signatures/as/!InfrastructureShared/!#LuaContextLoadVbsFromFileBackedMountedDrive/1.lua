-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/LoadVbsFromFileBackedMountedDrive
-- Type: 13
-- MpAttributes: (FILE_DEVICE_IS_MOUNTED | MpFileIsOnRemovableDrive) & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) < 4 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
if l_0_1 ~= ".vbs" or l_0_1 ~= ".vbe" then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetMountedFileBackingFilePath(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_3, 2536803289)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)
if l_0_4 == "wscript.exe" then
  mp.set_mpattribute("Lua:Context/WscriptLoadVbsFromMountedDrive")
elseif l_0_4 == "cscript.exe" then
  mp.set_mpattribute("Lua:Context/CscriptLoadVbsFromMountedDrive")
end
return mp.CLEAN
