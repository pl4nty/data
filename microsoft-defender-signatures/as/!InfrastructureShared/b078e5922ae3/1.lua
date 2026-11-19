-- Threat: !InfrastructureShared
-- Name: b078e5922ae3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
