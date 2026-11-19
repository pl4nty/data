-- Threat: !InfrastructureShared
-- Name: 7d7834249721
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
