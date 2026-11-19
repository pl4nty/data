-- Threat: !InfrastructureShared
-- Name: 6478ea64dc6c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
