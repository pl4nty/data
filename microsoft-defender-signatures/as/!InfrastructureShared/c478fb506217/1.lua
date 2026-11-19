-- Threat: !InfrastructureShared
-- Name: c478fb506217
-- Type: 21
-- Includes: HstrLuaLib

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if checkIfCertificateHit() then
  return mp.CLEAN
end
return mp.INFECTED
