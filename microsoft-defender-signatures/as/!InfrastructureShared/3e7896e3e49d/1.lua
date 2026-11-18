-- Threat: !InfrastructureShared
-- Name: 3e7896e3e49d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
