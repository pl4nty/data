-- Threat: !InfrastructureShared
-- Name: 2778ad8cda27
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:TrojanDropper:Win32/Jacard!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
