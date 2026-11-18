-- Threat: !InfrastructureShared
-- Name: 67780745581c
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
