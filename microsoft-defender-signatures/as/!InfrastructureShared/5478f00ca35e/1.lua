-- Threat: !InfrastructureShared
-- Name: 5478f00ca35e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
