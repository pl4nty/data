-- Threat: !InfrastructureShared
-- Name: 41078cdf2c498
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
