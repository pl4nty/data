-- Threat: !InfrastructureShared
-- Name: ad78fbdd8e15
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
