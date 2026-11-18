-- Threat: !InfrastructureShared
-- Name: 13078eb1684ba
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
