-- Threat: !InfrastructureShared
-- Name: 3f7893ce386f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
