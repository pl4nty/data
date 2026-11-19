-- Threat: !InfrastructureShared
-- Name: 8378e3966f6f
-- Type: 21
-- Includes: HstrLuaLib

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if checkIfCertificateHit() then
  return mp.CLEAN
end
return mp.INFECTED
