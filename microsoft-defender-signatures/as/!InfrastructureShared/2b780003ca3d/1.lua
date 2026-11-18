-- Threat: !InfrastructureShared
-- Name: 2b780003ca3d
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
