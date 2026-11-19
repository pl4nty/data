-- Threat: !InfrastructureShared
-- Name: 8578ad36d42a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
