-- Threat: !InfrastructureShared
-- Name: 47780671cbdf
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win32/Staser.LM!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
