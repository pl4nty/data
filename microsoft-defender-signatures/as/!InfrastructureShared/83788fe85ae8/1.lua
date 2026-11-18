-- Threat: !InfrastructureShared
-- Name: 83788fe85ae8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
