-- Threat: !InfrastructureShared
-- Name: 457841c6e942
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
