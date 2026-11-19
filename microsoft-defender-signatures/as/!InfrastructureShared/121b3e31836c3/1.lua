-- Threat: !InfrastructureShared
-- Name: 121b3e31836c3
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("BM", "windeploy.exe") then
  return mp.CLEAN
end
return mp.INFECTED
