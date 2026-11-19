-- Threat: !InfrastructureShared
-- Name: 19b3965069d5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
if l_0_0 == nil or string.len(l_0_0) == 0 then
  return mp.CLEAN
end
for l_0_1 in l_0_0:gmatch("([^\r\n]*)\n?") do
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
TrackPidAndTechniqueBM("BM", "T1037.001", "persistence_source")
return mp.INFECTED
