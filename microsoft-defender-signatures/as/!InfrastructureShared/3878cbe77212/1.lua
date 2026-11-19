-- Threat: !InfrastructureShared
-- Name: 3878cbe77212
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
