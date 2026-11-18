-- Threat: !InfrastructureShared
-- Name: 3878b35ae418
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win32/Doina.KK1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
