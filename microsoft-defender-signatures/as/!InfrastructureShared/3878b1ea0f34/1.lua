-- Threat: !InfrastructureShared
-- Name: 3878b1ea0f34
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
