-- Threat: !InfrastructureShared
-- Name: 7d78c57fa293
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
