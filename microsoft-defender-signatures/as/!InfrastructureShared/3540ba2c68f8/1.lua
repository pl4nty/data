-- Threat: !InfrastructureShared
-- Name: 3540ba2c68f8
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") == false then
  return mp.CLEAN
end
if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
