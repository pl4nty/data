-- Threat: !InfrastructureShared
-- Name: 6578f052feed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
