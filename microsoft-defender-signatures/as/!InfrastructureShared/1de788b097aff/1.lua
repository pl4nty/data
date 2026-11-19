-- Threat: !InfrastructureShared
-- Name: 1de788b097aff
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
