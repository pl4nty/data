-- Threat: !InfrastructureShared
-- Name: 96788ca7f9aa
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
