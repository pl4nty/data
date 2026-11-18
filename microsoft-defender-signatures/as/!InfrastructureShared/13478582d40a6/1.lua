-- Threat: !InfrastructureShared
-- Name: 13478582d40a6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
