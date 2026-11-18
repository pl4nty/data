-- Threat: !InfrastructureShared
-- Name: 3778f6fcd76b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
