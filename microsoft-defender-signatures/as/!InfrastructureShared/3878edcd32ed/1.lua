-- Threat: !InfrastructureShared
-- Name: 3878edcd32ed
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
