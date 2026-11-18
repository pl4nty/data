-- Threat: !InfrastructureShared
-- Name: 354037cefa75
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") == false then
  return mp.CLEAN
end
if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
