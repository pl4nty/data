-- Threat: !InfrastructureShared
-- Name: 6378613adbc4
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
