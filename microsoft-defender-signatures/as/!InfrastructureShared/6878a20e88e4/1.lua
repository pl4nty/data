-- Threat: !InfrastructureShared
-- Name: 6878a20e88e4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
