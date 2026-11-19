-- Threat: !InfrastructureShared
-- Name: 6778031b9266
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
