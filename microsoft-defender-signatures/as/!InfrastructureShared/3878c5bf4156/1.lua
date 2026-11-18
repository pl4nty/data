-- Threat: !InfrastructureShared
-- Name: 3878c5bf4156
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
