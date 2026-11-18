-- Threat: !InfrastructureShared
-- Name: 6d787b05ad14
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
