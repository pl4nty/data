-- Threat: !InfrastructureShared
-- Name: 6c782ba64c46
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
