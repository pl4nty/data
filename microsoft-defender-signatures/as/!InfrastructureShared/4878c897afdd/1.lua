-- Threat: !InfrastructureShared
-- Name: 4878c897afdd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
