-- Threat: !InfrastructureShared
-- Name: 4f782dea464d
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Lazy.MBXI!MTB") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
