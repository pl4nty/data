-- Threat: !InfrastructureShared
-- Name: 6078bc2f3460
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Ekstak.AN!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
