-- Threat: !InfrastructureShared
-- Name: 49789ed4b6fc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
