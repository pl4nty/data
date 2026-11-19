-- Threat: !InfrastructureShared
-- Name: 15b34b710f11
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
AddResearchData(l_0_0.ppid, true)
return mp.INFECTED
