-- Threat: !InfrastructureShared
-- Name: 11ed744ca09a9
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("cmdhstr", "python.exe") then
  return mp.INFECTED
end
return mp.CLEAN
