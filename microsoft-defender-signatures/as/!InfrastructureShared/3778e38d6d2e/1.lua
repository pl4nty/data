-- Threat: !InfrastructureShared
-- Name: 3778e38d6d2e
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Ransom:Win32/Crypmodng.GXW!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
