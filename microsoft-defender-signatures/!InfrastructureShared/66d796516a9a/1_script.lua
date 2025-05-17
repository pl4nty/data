-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\66d796516a9a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetScannedPPID)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
l_0_2 = (string.gsub)(l_0_2, "\'", "\"")
l_0_2 = (string.gsub)(l_0_2, "\"\"", "\"")
local l_0_3 = (string.match)(l_0_2, "objectcategory=([^%s)]+)")
if l_0_3 == "user" or l_0_3 == "person" then
  TrackPidAndTechnique(l_0_0.ppid, "T1087", "user_discovery_adfind")
end
if l_0_3 == "computer" then
  TrackPidAndTechnique(l_0_0.ppid, "T1018", "system_discovery_adfind")
end
if l_0_3 == "group" then
  TrackPidAndTechnique(l_0_0.ppid, "T1069", "permgroup_discovery_adfind")
end
if l_0_3 == "organizationalunit" then
  TrackPidAndTechnique(l_0_0.ppid, "T1614", "orgunit_discovery_adfind")
end
if l_0_3 == "subnet" then
  TrackPidAndTechnique(l_0_0.ppid, "T1016", "netconfig_discovery_adfind")
end
return mp.INFECTED

