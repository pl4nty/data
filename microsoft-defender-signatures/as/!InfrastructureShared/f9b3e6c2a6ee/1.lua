-- Threat: !InfrastructureShared
-- Name: f9b3e6c2a6ee
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
end
if l_0_0 and string.match(l_0_0, "/%.[^/]+$") then
  TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts")
  return mp.INFECTED
end
return mp.CLEAN
