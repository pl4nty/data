-- Threat: !InfrastructureShared
-- Name: 5ed758b0a6a3
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("cmdhstr", "python.exe") then
  return mp.INFECTED
end
return mp.CLEAN
