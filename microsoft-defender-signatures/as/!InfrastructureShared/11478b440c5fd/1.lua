-- Threat: !InfrastructureShared
-- Name: 11478b440c5fd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
