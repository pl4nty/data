-- Threat: !InfrastructureShared
-- Name: 134784b79e0ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
