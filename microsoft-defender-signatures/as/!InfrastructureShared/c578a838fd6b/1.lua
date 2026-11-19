-- Threat: !InfrastructureShared
-- Name: c578a838fd6b
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
