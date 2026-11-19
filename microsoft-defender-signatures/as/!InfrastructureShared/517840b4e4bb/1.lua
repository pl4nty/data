-- Threat: !InfrastructureShared
-- Name: 517840b4e4bb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
