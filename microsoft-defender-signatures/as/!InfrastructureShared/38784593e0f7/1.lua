-- Threat: !InfrastructureShared
-- Name: 38784593e0f7
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
