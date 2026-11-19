-- Threat: !InfrastructureShared
-- Name: 3778f0bd3122
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
