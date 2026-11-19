-- Threat: !InfrastructureShared
-- Name: 11a78a5854653
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
