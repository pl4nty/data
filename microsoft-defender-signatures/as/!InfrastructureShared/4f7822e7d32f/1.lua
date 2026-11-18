-- Threat: !InfrastructureShared
-- Name: 4f7822e7d32f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
