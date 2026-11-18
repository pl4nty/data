-- Threat: !InfrastructureShared
-- Name: 6878b5747edb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
