-- Threat: !InfrastructureShared
-- Name: 59788e1f1b14
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
