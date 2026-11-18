-- Threat: !InfrastructureShared
-- Name: 167b3d7079dfa
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 then
  local l_0_0 = this_sigattrlog[7].utf8p2
  if not string.match(l_0_0, "^/var/www/") then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
end
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1190", "InitialAccess_www")
return mp.INFECTED
