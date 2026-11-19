-- Threat: !InfrastructureShared
-- Name: 727859318963
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
