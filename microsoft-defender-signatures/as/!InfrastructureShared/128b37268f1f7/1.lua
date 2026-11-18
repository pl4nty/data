-- Threat: !InfrastructureShared
-- Name: 128b37268f1f7
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  if IsPidExcluded(l_0_0.ppid) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "persistence_schtask_create_source")
  return mp.INFECTED
end
return mp.CLEAN
