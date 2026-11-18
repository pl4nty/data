-- Threat: !InfrastructureShared
-- Name: a678b7add0da
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.BA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
