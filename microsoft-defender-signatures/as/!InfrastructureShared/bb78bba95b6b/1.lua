-- Threat: !InfrastructureShared
-- Name: bb78bba95b6b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
