-- Threat: !InfrastructureShared
-- Name: f378922d2570
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
