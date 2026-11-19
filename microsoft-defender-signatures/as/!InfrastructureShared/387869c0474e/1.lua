-- Threat: !InfrastructureShared
-- Name: 387869c0474e
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
