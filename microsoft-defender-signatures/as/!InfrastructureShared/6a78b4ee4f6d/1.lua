-- Threat: !InfrastructureShared
-- Name: 6a78b4ee4f6d
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
