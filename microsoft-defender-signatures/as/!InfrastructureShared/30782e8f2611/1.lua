-- Threat: !InfrastructureShared
-- Name: 30782e8f2611
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
