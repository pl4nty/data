-- Threat: !InfrastructureShared
-- Name: f278a8877662
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
