-- Threat: !InfrastructureShared
-- Name: 247836dad9eb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
