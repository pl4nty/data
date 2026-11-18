-- Threat: !InfrastructureShared
-- Name: 55b3ee0d749d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0, nil)
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1105", "remotedropexe_childproc")
  end
  return mp.INFECTED
end
return mp.CLEAN
