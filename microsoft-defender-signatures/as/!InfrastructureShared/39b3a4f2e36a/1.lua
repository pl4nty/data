-- Threat: !InfrastructureShared
-- Name: 39b3a4f2e36a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].ppid
end
if l_0_0 ~= nil and IsTacticObservedForPid(l_0_0, "SuspBunProcess") then
  return mp.INFECTED
end
return mp.CLEAN
