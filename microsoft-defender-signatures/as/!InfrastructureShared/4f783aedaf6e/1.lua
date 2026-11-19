-- Threat: !InfrastructureShared
-- Name: 4f783aedaf6e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
