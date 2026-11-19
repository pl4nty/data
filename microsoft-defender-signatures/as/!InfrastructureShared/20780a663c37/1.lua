-- Threat: !InfrastructureShared
-- Name: 20780a663c37
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win64/Rhadamanthys.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
