-- Threat: !InfrastructureShared
-- Name: 1a4b3c961ae1b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1:lower()
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1:lower()
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1:lower()
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1:lower()
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1:lower()
end
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  "program files",
  "\\rclone\\",
  "cmmagent.exe",
  "cymulateagent.exe"
}
if not contains(l_0_0, l_0_1) then
  TrackPidAndTechniqueBM("BM", "T1567", "ToolExfilOverWeb")
  reportRelatedBmHits()
  add_parents()
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
