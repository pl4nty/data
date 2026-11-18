-- Threat: !InfrastructureShared
-- Name: c078d8ebe5df
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
