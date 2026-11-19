-- Threat: !InfrastructureShared
-- Name: db78c9825096
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
