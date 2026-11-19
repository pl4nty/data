-- Threat: !InfrastructureShared
-- Name: 72784bc9058d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
