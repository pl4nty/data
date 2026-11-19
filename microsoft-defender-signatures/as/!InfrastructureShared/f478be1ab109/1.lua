-- Threat: !InfrastructureShared
-- Name: f478be1ab109
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
