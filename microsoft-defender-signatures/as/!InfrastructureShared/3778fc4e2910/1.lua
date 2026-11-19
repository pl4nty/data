-- Threat: !InfrastructureShared
-- Name: 3778fc4e2910
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
