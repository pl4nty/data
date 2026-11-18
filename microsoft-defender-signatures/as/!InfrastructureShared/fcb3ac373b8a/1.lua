-- Threat: !InfrastructureShared
-- Name: fcb3ac373b8a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not (this_sigattrlog[1].matched and this_sigattrlog[2].matched) or not this_sigattrlog[3].matched then
  return mp.CLEAN
end
local l_0_0 = string.match(this_sigattrlog[1].utf8p2 or "", " user (.-) ")
local l_0_1 = string.match(this_sigattrlog[2].utf8p2 or "", "([^ ]+) /add")
local l_0_2 = string.match(this_sigattrlog[3].utf8p2 or "", "([^ ]+) /add")
if isnull(l_0_0) or isnull(l_0_1) or isnull(l_0_2) or l_0_0 ~= l_0_1 or l_0_0 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {
  ["T1098.007"] = "persist_user_local",
  ["T1136.001"] = "persist_user_local"
}
TrackPidAndMultipleTechniquesBM(this_sigattrlog[1].ppid, l_0_3)
TrackPidAndMultipleTechniquesBM(this_sigattrlog[2].ppid, l_0_3)
TrackPidAndMultipleTechniquesBM(this_sigattrlog[3].ppid, l_0_3)
return mp.INFECTED
