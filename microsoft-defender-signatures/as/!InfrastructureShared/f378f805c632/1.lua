-- Threat: !InfrastructureShared
-- Name: f378f805c632
-- Type: 21
-- Includes: HstrLuaLib

if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN
