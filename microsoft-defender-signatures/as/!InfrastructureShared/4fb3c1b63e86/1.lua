-- Threat: !InfrastructureShared
-- Name: 4fb3c1b63e86
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[3].ppid
end
if l_0_0 ~= nil and l_0_1 ~= nil and isTainted(l_0_0, "remote_file_created_taint") then
  local l_0_2, l_0_3 = bm.get_process_relationships(l_0_1)
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    bm.add_related_process(l_0_5.ppid)
    TrackPidAndTechniqueBM(l_0_5.ppid, "T1547.006", "Persistence")
  end
  return mp.INFECTED
end
return mp.CLEAN
