-- Threat: !InfrastructureShared
-- Name: 6778aac6f883
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
