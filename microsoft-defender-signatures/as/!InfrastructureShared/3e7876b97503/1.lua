-- Threat: !InfrastructureShared
-- Name: 3e7876b97503
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
