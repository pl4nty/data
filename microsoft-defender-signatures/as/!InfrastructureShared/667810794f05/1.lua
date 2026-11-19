-- Threat: !InfrastructureShared
-- Name: 667810794f05
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if peattributes.isdll == true then
  local l_0_0 = mp.getfilesize()
  if l_0_0 == 1668848 and (mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") or mp.get_mpattribute("PEPCODE:HasDigitalSignature")) then
    return mp.INFECTED
  end
end
return mp.CLEAN
