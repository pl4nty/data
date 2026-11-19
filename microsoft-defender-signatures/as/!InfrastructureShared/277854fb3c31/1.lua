-- Threat: !InfrastructureShared
-- Name: 277854fb3c31
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
