-- Threat: !InfrastructureShared
-- Name: 1f378bfed37a6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
