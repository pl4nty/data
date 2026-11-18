-- Threat: !InfrastructureShared
-- Name: c540da8001d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
