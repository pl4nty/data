-- Threat: !InfrastructureShared
-- Name: 8678ce8766c2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
