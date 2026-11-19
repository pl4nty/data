-- Threat: !InfrastructureShared
-- Name: 9978485e7dc8
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.AO!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
