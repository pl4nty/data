-- Threat: !InfrastructureShared
-- Name: 51781d5afabf
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win64/Silverfox.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
