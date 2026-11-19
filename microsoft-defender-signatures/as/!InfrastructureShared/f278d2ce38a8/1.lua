-- Threat: !InfrastructureShared
-- Name: f278d2ce38a8
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
