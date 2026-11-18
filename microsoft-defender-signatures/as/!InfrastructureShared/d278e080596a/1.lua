-- Threat: !InfrastructureShared
-- Name: d278e080596a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
