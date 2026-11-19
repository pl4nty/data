-- Threat: !InfrastructureShared
-- Name: 3878416d07b6
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
