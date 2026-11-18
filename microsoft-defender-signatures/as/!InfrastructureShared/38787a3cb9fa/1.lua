-- Threat: !InfrastructureShared
-- Name: 38787a3cb9fa
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
