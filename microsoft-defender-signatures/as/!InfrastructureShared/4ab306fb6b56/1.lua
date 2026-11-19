-- Threat: !InfrastructureShared
-- Name: 4ab306fb6b56
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
    if mp.IsKnownFriendlyFile(l_0_0, true, true) == true then
      return mp.CLEAN
    end
    if checkFileLastWriteTime(l_0_0, 3600) == false then
      TrackPidAndTechniqueBM(this_sigattrlog[2].ppid, "T1071.003", "tactic=susptransportdll;filepath:" .. l_0_0)
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
