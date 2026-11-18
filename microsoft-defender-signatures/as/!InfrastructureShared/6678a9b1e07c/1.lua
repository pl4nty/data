-- Threat: !InfrastructureShared
-- Name: 6678a9b1e07c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
