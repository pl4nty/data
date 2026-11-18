-- Threat: !InfrastructureShared
-- Name: 5e78643a96b7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
