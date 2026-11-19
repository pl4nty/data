-- Threat: !InfrastructureShared
-- Name: 9f785d2e246e
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.AP!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
