-- Threat: !InfrastructureShared
-- Name: e578fcba0111
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
