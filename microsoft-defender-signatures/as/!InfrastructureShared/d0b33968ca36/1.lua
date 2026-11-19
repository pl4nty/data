-- Threat: !InfrastructureShared
-- Name: d0b33968ca36
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched and not this_sigattrlog[3].matched then
  return mp.CLEAN
end
if this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      end
    end
  end
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1546.015", "COMHijacking")
return mp.INFECTED
