-- Threat: !InfrastructureShared
-- Name: 69b34330c42d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = "remote_file_created_taint"
local l_0_1, l_0_2
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].ppid
  l_0_2 = this_sigattrlog[5].image_path
end
if l_0_1 ~= nil and l_0_2 ~= nil and isTainted(l_0_2, l_0_0) then
  TrackPidAndTechniqueBM(l_0_1, "T1053.003", "Execution_SuspiciousCronActivity")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
