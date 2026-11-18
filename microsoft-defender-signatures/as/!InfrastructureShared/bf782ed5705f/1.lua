-- Threat: !InfrastructureShared
-- Name: bf782ed5705f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
