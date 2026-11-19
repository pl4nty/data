-- Threat: !InfrastructureShared
-- Name: e5b3df75a06a
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched == false or this_sigattrlog[1].timestamp == nil then
  return mp.CLEAN
end
if this_sigattrlog[2].matched == false or this_sigattrlog[2].timestamp == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].timestamp
local l_0_1 = this_sigattrlog[2].timestamp
if l_0_0 > l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 - l_0_0
if 3000000000 < l_0_2 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass_src")
return mp.INFECTED
