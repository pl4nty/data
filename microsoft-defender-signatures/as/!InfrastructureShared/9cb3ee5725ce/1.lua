-- Threat: !InfrastructureShared
-- Name: 9cb3ee5725ce
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 ~= "" and l_0_1 ~= nil then
  local l_0_2 = string.match(l_0_1, "//[^%s]+%s([^%s]+)%s")
  if l_0_2 ~= "" and l_0_2 ~= nil and string.match(l_0_2, "/%.[^/]+$") then
    TrackPidAndTechniqueBM("BM", "T1564.005", "DefenseEvasion_HideArtifacts_HiddenFileSystem_HiddenMount")
    reportRelatedBmHits()
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN
