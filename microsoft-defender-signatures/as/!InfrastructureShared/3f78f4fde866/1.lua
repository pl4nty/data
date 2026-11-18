-- Threat: !InfrastructureShared
-- Name: 3f78f4fde866
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
