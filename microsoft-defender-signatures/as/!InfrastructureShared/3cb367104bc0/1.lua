-- Threat: !InfrastructureShared
-- Name: 3cb367104bc0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if not string.find(l_0_1, ".jsp", 1, true) then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_1, "%-%-data%-urlencode%s+[\"']?c=[%w+/]") ~= nil
if not l_0_3 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence")
add_parents()
return mp.INFECTED
