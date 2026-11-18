-- Threat: !InfrastructureShared
-- Name: 7d789ca5071b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
