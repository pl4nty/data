-- Threat: !InfrastructureShared
-- Name: 1054041cd20a6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
