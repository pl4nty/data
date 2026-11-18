-- Threat: !InfrastructureShared
-- Name: 38782dba97e3
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
