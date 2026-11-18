-- Threat: !InfrastructureShared
-- Name: 6f785a81eab2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
