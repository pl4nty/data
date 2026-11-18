-- Threat: !InfrastructureShared
-- Name: 6378254b7c54
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
