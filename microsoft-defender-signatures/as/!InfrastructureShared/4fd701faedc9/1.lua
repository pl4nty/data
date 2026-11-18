-- Threat: !InfrastructureShared
-- Name: 4fd701faedc9
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("cmdhstr", "wgear.exe") then
  return mp.INFECTED
end
return mp.CLEAN
