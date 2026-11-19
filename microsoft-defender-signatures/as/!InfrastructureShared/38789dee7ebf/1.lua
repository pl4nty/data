-- Threat: !InfrastructureShared
-- Name: 38789dee7ebf
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
