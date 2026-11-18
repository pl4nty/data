-- Threat: !InfrastructureShared
-- Name: 606164a4be86
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
