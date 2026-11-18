-- Threat: !InfrastructureShared
-- Name: 617838cd20f8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
