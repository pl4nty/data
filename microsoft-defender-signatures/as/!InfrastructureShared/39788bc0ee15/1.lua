-- Threat: !InfrastructureShared
-- Name: 39788bc0ee15
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Rootkit.MBXI!MTB") and mp.get_mpattribute("Lua:Issuer.Microsoft") and mp.get_mpattribute("pea_isdriver") then
  return mp.INFECTED
end
return mp.CLEAN
