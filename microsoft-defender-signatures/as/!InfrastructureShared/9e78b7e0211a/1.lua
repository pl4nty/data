-- Threat: !InfrastructureShared
-- Name: 9e78b7e0211a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
