-- Threat: !InfrastructureShared
-- Name: add70f6d52eb
-- Type: 21
-- Includes: TechniqueTracker

if IsProcNameInParentProcessTree("cmdhstr", {
  "onenote.exe"
}) then
  return mp.INFECTED
end
return mp.CLEAN
