-- Threat: !InfrastructureShared
-- Name: 47787a552ed2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
