-- Threat: !InfrastructureShared
-- Name: !#SLF:RenamedRclone.SA
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: OFN:rclone.exe

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
local l_0_1 = {
  "\\program files",
  "\\rclone.exe",
  "\\cmmagent.exe",
  "\\gclone.exe",
  "\\lclone.exe",
  "\\mclone.exe",
  "\\chef-mclone",
  "\\zdriveex.exe",
  "\\fclone.exe",
  "\\cbdownloader.exe",
  "\\dcnetdisk.exe",
  "rclone"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetOriginalFileName(l_0_0)
if l_0_2 and string.find(l_0_2, "rclone.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
