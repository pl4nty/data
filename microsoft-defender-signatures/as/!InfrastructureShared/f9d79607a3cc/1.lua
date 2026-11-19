-- Threat: !InfrastructureShared
-- Name: f9d79607a3cc
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("cmdhstr", "svchost.exe") then
  return mp.INFECTED
end
return mp.CLEAN
