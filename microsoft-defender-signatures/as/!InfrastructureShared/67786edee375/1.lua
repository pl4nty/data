-- Threat: !InfrastructureShared
-- Name: 67786edee375
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
