-- Threat: !InfrastructureShared
-- Name: 3f78ddf76599
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/LummaC!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
