-- Threat: !InfrastructureShared
-- Name: ce782172e023
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
