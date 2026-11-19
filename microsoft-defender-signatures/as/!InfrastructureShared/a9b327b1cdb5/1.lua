-- Threat: !InfrastructureShared
-- Name: a9b327b1cdb5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1112", "revil_malware", 28800)
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1112", "revil_child_malware", 28800)
  end
  return mp.INFECTED
end
return mp.CLEAN
