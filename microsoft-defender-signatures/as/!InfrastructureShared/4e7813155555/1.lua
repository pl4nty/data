-- Threat: !InfrastructureShared
-- Name: 4e7813155555
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Ekstak.AD!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
