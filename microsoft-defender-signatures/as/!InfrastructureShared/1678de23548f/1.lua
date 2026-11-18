-- Threat: !InfrastructureShared
-- Name: 1678de23548f
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
