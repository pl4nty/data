-- Threat: !InfrastructureShared
-- Name: f17820167d07
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
