-- Threat: !InfrastructureShared
-- Name: 55b39ee50233
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if l_0_0 ~= nil and string.len(l_0_0) > 4 and string.sub(l_0_0, -4) == ".lnk" then
    if this_sigattrlog[1].matched then
      local l_0_1 = this_sigattrlog[1].utf8p2
      bm_AddRelatedFileFromCommandLine(l_0_1)
    end
    TrackPidAndTechniqueBM("BM", "T1547.009", "persistence_source")
    TrackPidAndTechniqueBM("BM", "T1547.009", "ShortcutFileInStartup.H")
    TrackFileAndTechnique(l_0_0, "T1547.009:persistence_target")
    TrackFileAndTechnique(l_0_0, "T1547.009:ShortcutFileInStartup.H")
    return mp.INFECTED
  end
end
return mp.CLEAN
