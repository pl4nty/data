-- Threat: !InfrastructureShared
-- Name: 7978f5f346c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
