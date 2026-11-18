-- Threat: !InfrastructureShared
-- Name: 387830d155d6
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
