-- Threat: !InfrastructureShared
-- Name: 26781dba272a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
