-- Threat: !InfrastructureShared
-- Name: 6778399c016f
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
