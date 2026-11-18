-- Threat: !InfrastructureShared
-- Name: 2778f2469f48
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
