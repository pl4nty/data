-- Threat: !InfrastructureShared
-- Name: a078fb0c5b3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
