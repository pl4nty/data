-- Threat: !InfrastructureShared
-- Name: 7261ed34500a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
