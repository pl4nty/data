-- Threat: !InfrastructureShared
-- Name: 387870189e47
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
