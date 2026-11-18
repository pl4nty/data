-- Threat: !InfrastructureShared
-- Name: 10c78aeacba2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
