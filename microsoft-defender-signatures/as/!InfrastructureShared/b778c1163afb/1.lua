-- Threat: !InfrastructureShared
-- Name: b778c1163afb
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Win32/DarkTortilla.PA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
