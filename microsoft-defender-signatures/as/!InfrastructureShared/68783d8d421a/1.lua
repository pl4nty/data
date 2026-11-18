-- Threat: !InfrastructureShared
-- Name: 68783d8d421a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
