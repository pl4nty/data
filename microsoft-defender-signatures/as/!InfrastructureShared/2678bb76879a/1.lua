-- Threat: !InfrastructureShared
-- Name: 2678bb76879a
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Destroysom.MBXK!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
