-- Threat: !InfrastructureShared
-- Name: 2a78c2728961
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Baryas.MBXI!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
