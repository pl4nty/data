-- Threat: !InfrastructureShared
-- Name: fb787b4958b4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
