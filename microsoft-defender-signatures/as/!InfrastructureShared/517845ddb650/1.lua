-- Threat: !InfrastructureShared
-- Name: 517845ddb650
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
