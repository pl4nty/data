-- Threat: !InfrastructureShared
-- Name: d4b3d7b52198
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  if l_0_0 ~= nil and IsTacticObservedForPid(l_0_0, "TaintedIISInstance") then
    return mp.INFECTED
  end
end
return mp.CLEAN
