-- Threat: !InfrastructureShared
-- Name: 7db3584d7bd5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = ""
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if l_0_0:match("/Users/.*/Library/") ~= nil then
  TrackPidAndTechniqueBM("BM", "T1546.004", "profile-persistence")
  return mp.INFECTED
end
return mp.CLEAN
