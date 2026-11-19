-- Threat: !InfrastructureShared
-- Name: 26eb3ed5017fd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  if isParentPackageManager(l_0_1.ppid, true) then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_1.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_ufw_config")
end
AddResearchData("BM", true)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
