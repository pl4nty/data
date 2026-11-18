-- Threat: !InfrastructureShared
-- Name: a7782eb1f406
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
