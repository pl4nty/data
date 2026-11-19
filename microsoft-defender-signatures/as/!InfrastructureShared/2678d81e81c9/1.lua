-- Threat: !InfrastructureShared
-- Name: 2678d81e81c9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
