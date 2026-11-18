-- Threat: !InfrastructureShared
-- Name: 63786ff5023c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
