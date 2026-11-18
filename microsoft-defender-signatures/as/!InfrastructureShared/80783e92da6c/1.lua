-- Threat: !InfrastructureShared
-- Name: 80783e92da6c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
