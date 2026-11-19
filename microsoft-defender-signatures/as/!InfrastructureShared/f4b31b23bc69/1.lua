-- Threat: !InfrastructureShared
-- Name: f4b31b23bc69
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].ppid ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_0 == nil or #l_0_0 < 3 or l_0_1 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "/%.[^/]+$") and IsDiscoveryCollectionThresholdMetLinux(l_0_1) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
