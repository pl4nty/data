-- Threat: !InfrastructureShared
-- Name: 112783fa9c628
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
