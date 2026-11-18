-- Threat: !InfrastructureShared
-- Name: 16c7b329d6209e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
if verify_relevant_sim_orgs() then
  return mp.INFECTED
end
return mp.CLEAN
