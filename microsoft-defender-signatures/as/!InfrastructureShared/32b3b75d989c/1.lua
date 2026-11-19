-- Threat: !InfrastructureShared
-- Name: 32b3b75d989c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "\\gsl\\filesync\\rclone.exe",
  "schoolsdataarchive\\rclone.exe"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
reportSessionInformation()
return mp.INFECTED
