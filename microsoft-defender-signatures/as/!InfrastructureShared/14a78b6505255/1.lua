-- Threat: !InfrastructureShared
-- Name: 14a78b6505255
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
