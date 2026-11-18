-- Threat: !InfrastructureShared
-- Name: 3978bf32a1bd
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win64/MeduzaStealer!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
