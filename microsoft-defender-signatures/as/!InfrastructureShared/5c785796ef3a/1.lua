-- Threat: !InfrastructureShared
-- Name: 5c785796ef3a
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
