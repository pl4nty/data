-- Threat: !InfrastructureShared
-- Name: 5378970b7f41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
