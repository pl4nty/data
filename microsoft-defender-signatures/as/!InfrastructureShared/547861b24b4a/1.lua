-- Threat: !InfrastructureShared
-- Name: 547861b24b4a
-- Type: 21

if peattributes.isexe == false then
  return mp.CLEAN
end
if peattributes.no_resources == true then
  return mp.CLEAN
end
if peattributes.hasappendeddata == false then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
