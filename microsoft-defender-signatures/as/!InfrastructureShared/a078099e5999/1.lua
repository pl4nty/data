-- Threat: !InfrastructureShared
-- Name: a078099e5999
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
