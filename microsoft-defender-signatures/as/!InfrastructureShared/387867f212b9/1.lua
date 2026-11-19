-- Threat: !InfrastructureShared
-- Name: 387867f212b9
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
