-- Threat: !InfrastructureShared
-- Name: 6278317e4fed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
