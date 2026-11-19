-- Threat: !InfrastructureShared
-- Name: 3a781ac70260
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") or mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
