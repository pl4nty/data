-- Threat: !InfrastructureShared
-- Name: 2478608b5407
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
