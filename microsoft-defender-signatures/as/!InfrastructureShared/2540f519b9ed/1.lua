-- Threat: !InfrastructureShared
-- Name: 2540f519b9ed
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") == false then
  return mp.CLEAN
end
if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
