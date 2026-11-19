-- Threat: !InfrastructureShared
-- Name: b378d42c0cd7
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Neoreblamy.BC!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
