-- Threat: !InfrastructureShared
-- Name: af78d1f4bc0c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.BB!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
