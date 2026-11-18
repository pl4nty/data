-- Threat: !InfrastructureShared
-- Name: 5fdd7d340db82
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = {
  "rdiff-backup_1.2.8.exe",
  "rclone.exe",
  "edgewebsync.exe",
  "rsync.exe",
  "edgewebview.exe",
  "devicesync.exe",
  "ag.exe",
  "s5cmd.exe",
  "msedgehelpers.exe",
  "conhost.exe"
}
if contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
if string.find(l_0_2, "rclone.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
