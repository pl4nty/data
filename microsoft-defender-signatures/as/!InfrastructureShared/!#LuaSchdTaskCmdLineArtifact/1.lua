-- Threat: !InfrastructureShared
-- Name: !#Lua:SchdTaskCmdLineArtifact
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.GetResmgrBasePlugin() ~= "Taskscheduler" then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, ":\\windows\\system32", 1, true) ~= nil or string.find(l_0_0, ":\\windows\\syswow64", 1, true) ~= nil or string.find(l_0_0, ":\\windows\\tasks", 1, true) ~= nil then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
