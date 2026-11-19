-- Threat: !InfrastructureShared
-- Name: 4d781fc8c4ad
-- Type: 21
-- Includes: HstrLuaLib

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if checkIfCertificateHit() then
  return mp.CLEAN
end
return mp.INFECTED
