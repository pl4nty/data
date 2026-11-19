-- Threat: !InfrastructureShared
-- Name: a6b3e5ddc62d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "\\mozilla\\firefox\\",
  "\\microsoft\\edge\\",
  "\\google\\chrome\\"
}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1555.003", "rundll32_firefox_credaccess")
return mp.INFECTED
