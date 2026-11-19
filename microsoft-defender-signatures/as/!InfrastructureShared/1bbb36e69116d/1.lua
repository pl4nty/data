-- Threat: !InfrastructureShared
-- Name: 1bbb36e69116d
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath()):lower()
local l_0_1 = {
  "rclone.exe",
  "megasync.exe",
  "freefilesync.exe",
  "realtimesync.exe",
  "FreeFileSync_Win32.exe",
  "FreeFileSync_x64.exe",
  "RealTimeSync_Win32.exe",
  "RealTimeSync_x64.exe",
  "gclone.exe",
  "lclone.exe",
  "fclone.exe",
  "cmmagent",
  "pcloud.exe",
  "FreeFileSyncPortable.exe",
  "upclone",
  "\\rclone\\",
  "rbclone.exe",
  "dellfiletransferutil.exe",
  "restic.exe",
  "restic_"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_2 = {
  "program files"
}
if not contains(l_0_0, l_0_2) then
  TrackPidAndTechniqueBM("BM", "T1567", "ToolExfilOverWeb")
  reportRelatedBmHits()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
