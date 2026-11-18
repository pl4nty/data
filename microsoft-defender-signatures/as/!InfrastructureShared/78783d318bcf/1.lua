-- Threat: !InfrastructureShared
-- Name: 78783d318bcf
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  if not mp.get_mpattribute("RPF:TopLevelFile") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
