-- Threat: !InfrastructureShared
-- Name: f1788b67337a
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
