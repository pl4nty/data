-- Threat: !InfrastructureShared
-- Name: d178f184bbaf
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.BE!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
