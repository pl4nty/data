-- Threat: !InfrastructureShared
-- Name: 207864cbc56c
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
