-- Threat: !InfrastructureShared
-- Name: 76612a8fe175
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") and peattributes.ismsil == true then
  local l_0_0 = mp.getfilesize()
  if 3000000 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
