-- Threat: !InfrastructureShared
-- Name: 5b785cab8dc8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
