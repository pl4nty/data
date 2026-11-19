-- Threat: !InfrastructureShared
-- Name: 38782b1bcaf4
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
