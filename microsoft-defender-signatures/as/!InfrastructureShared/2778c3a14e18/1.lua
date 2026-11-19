-- Threat: !InfrastructureShared
-- Name: 2778c3a14e18
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
