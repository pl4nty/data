-- Threat: !InfrastructureShared
-- Name: 55b3e20e2278
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
  TrackPidAndTechniqueBM("BM", "susp_spoolhack", "priteshel_a")
  return mp.INFECTED
end
return mp.CLEAN
