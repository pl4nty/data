-- Threat: !InfrastructureShared
-- Name: 1bbb3d2117d60
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath()):lower()
local l_0_1 = {
  "putty",
  "psftp",
  "plink",
  "pscp",
  "puttygen",
  "pageant",
  "mobaxterm",
  "RoyalTS_PuTTY64",
  "fzsftp",
  "mobascp",
  "mobacptransfer",
  "acs_ssh.exe",
  "ssh.exe",
  "imcnetresdm.exe",
  "mfg pro.exe"
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
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
