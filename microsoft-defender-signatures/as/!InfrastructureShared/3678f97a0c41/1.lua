-- Threat: !InfrastructureShared
-- Name: 3678f97a0c41
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Lotok.RF!MTB") or mp.get_mpattribute("NID:Trojan:Win64/Lotok.RG!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
