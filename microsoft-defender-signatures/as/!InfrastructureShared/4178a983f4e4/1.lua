-- Threat: !InfrastructureShared
-- Name: 4178a983f4e4
-- Type: 21

if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") or mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
