-- Threat: !InfrastructureShared
-- Name: 3178685a71cc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
