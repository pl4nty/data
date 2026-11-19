-- Threat: !InfrastructureShared
-- Name: 6278bc225948
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
