-- Threat: !InfrastructureShared
-- Name: 3878ea717bca
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
