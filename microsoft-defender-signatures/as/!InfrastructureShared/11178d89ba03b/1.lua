-- Threat: !InfrastructureShared
-- Name: 11178d89ba03b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
