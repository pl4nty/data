-- Threat: !InfrastructureShared
-- Name: 9d61cb2d16c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
