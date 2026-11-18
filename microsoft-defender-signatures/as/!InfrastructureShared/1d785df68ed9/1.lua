-- Threat: !InfrastructureShared
-- Name: 1d785df68ed9
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
