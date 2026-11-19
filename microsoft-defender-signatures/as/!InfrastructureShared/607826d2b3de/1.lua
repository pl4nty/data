-- Threat: !InfrastructureShared
-- Name: 607826d2b3de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
