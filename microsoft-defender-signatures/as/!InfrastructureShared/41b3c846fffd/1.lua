-- Threat: !InfrastructureShared
-- Name: 41b3c846fffd
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 ~= nil and string.len(l_0_0) > 4 and string.sub(l_0_0, -4) == ".lnk" then
    TrackPidAndTechniqueBM("BM", "T1547.009", "persistence_source")
    TrackPidAndTechniqueBM("BM", "T1547.009", "ShortcutFileInStartup.D")
    TrackFileAndTechnique(l_0_0, "T1547.009:persistence_target")
    TrackFileAndTechnique(l_0_0, "T1547.009:ShortcutFileInStartup.D")
    return mp.INFECTED
  end
end
return mp.CLEAN
