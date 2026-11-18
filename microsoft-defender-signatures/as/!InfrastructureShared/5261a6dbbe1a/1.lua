-- Threat: !InfrastructureShared
-- Name: 5261a6dbbe1a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
