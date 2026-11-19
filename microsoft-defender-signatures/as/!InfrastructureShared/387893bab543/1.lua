-- Threat: !InfrastructureShared
-- Name: 387893bab543
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
