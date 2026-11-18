-- Threat: !InfrastructureShared
-- Name: 18a78c5e56b41
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
