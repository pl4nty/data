-- Threat: !InfrastructureShared
-- Name: 397802d98a10
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
