-- Threat: !InfrastructureShared
-- Name: 3e78a02c04c5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
