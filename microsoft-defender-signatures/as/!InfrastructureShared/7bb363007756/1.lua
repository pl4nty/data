-- Threat: !InfrastructureShared
-- Name: 7bb363007756
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion")
  local l_0_1 = bm.get_current_process_startup_info()
  local l_0_2, l_0_3 = bm.get_process_relationships(l_0_1.ppid)
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    bm.add_related_process(l_0_5.ppid)
    TrackPidAndTechniqueBM(l_0_5.ppid, "T1070.004", "DefenseEvasion")
  end
  return mp.INFECTED
end
return mp.CLEAN
