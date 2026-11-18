-- Threat: !InfrastructureShared
-- Name: 39b3ab04541d
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.len(l_0_0) < 700 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059.001", "PowershellEncodedCommandGTE700")
return mp.INFECTED
