-- Threat: !InfrastructureShared
-- Name: 2178dc8e1854
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Alien.AME!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
