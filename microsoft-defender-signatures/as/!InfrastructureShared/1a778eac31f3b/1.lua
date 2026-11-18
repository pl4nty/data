-- Threat: !InfrastructureShared
-- Name: 1a778eac31f3b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
