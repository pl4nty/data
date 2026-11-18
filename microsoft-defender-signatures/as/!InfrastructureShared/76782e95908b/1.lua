-- Threat: !InfrastructureShared
-- Name: 76782e95908b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
