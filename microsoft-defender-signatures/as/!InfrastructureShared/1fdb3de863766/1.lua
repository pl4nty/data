-- Threat: !InfrastructureShared
-- Name: 1fdb3de863766
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = l_0_0.ppid
  TrackPidAndTechniqueBM(l_0_1, "ttexclusion", "ttexclusion_gp")
  return mp.INFECTED
end
return mp.CLEAN
