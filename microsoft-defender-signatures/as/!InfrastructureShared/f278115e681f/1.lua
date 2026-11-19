-- Threat: !InfrastructureShared
-- Name: f278115e681f
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
