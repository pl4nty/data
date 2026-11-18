-- Threat: !InfrastructureShared
-- Name: 6a780b1a593a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
