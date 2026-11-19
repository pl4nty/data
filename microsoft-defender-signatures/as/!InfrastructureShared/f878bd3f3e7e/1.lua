-- Threat: !InfrastructureShared
-- Name: f878bd3f3e7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
