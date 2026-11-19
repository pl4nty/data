-- Threat: !InfrastructureShared
-- Name: 67784ccbe871
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
