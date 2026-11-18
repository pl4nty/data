-- Threat: !InfrastructureShared
-- Name: 3878b6996226
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
