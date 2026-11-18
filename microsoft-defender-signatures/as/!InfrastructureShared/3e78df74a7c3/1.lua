-- Threat: !InfrastructureShared
-- Name: 3e78df74a7c3
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
