-- Threat: !InfrastructureShared
-- Name: 3378a3c56c2e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
