-- Threat: !InfrastructureShared
-- Name: 6678ea0c816a
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
