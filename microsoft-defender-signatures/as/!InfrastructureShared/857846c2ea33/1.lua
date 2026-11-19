-- Threat: !InfrastructureShared
-- Name: 857846c2ea33
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
