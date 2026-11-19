-- Threat: !InfrastructureShared
-- Name: 37780214bc5c
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win64/Farfli.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
