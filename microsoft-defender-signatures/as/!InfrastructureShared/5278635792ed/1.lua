-- Threat: !InfrastructureShared
-- Name: 5278635792ed
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win64/Tedy.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
