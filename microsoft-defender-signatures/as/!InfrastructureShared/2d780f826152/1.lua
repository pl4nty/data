-- Threat: !InfrastructureShared
-- Name: 2d780f826152
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win64/Mikey.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
