-- Threat: !InfrastructureShared
-- Name: 3878a7a2253b
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
