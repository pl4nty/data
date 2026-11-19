-- Threat: !InfrastructureShared
-- Name: 1d785c34e4ee
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
