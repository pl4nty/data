-- Threat: !InfrastructureShared
-- Name: 1af78aab6df72
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
