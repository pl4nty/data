-- Threat: !InfrastructureShared
-- Name: b078a63777f1
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.BD!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
