-- Threat: !InfrastructureShared
-- Name: 38781ecbad10
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
