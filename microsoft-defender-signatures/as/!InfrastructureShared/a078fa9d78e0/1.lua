-- Threat: !InfrastructureShared
-- Name: a078fa9d78e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
