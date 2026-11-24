-- Threat: !InfrastructureShared
-- Name: 46b3500c88f6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = this_sigattrlog[1]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = l_0_0.utf8p2
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:sub(-3) ~= "/cp" then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (" " .. l_0_2):match("%s[\"']?(/dev/shm/[^%s\"']+)[\"']?%s+[\"']?(/[^%s\"']+)[\"']?%s*$")
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
if not l_0_4:find("/crx%-quickstart/install/[^/]+%.jar$") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1505.003", "ShmAemBundleStage")
add_parents()
return mp.INFECTED
