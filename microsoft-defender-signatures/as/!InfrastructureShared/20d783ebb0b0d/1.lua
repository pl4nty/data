-- Threat: !InfrastructureShared
-- Name: 20d783ebb0b0d
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  if not mp.get_mpattribute("RPF:TopLevelFile") then
    return mp.CLEAN
  end
  local l_0_0 = mp.getfilesize()
  if 1000000 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
