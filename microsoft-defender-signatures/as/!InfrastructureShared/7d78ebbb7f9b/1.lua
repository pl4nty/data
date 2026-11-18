-- Threat: !InfrastructureShared
-- Name: 7d78ebbb7f9b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
