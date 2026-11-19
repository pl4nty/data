-- Threat: !InfrastructureShared
-- Name: 877815e36382
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
