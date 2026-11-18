-- Threat: !InfrastructureShared
-- Name: 4278b8c90fb2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
