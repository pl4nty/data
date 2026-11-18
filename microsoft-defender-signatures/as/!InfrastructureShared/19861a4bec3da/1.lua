-- Threat: !InfrastructureShared
-- Name: 19861a4bec3da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
